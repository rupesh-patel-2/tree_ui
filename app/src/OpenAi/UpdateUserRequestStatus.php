<?php


require_once __DIR__ . "/../../autoloader.php";

use Core\DatabaseHandler;
use OpenAi\Assistants\SiteGenerator;
use OpenAi\Files\File;
use OpenAi\Manager;
use OpenAi\Thread;

error_reporting(E_ALL);
ini_set('display_errors', 1);
if ($argc < 2) {
    die("Usage: php script.php request_id\n");
}

$request_id = $argv[1];

$db = DatabaseHandler::inst();

// fetch the request details using id.
$result = $db->select('openai_user_requests', ['id' => $request_id, 'status' => 'in_progress']);
$result = array_shift($result);

Manager::configure();
$file = File::getInstance('components.json', 'assistants');

$assistant = SiteGenerator::getInstance();
$fileIds = $assistant->getFileIds();
if (!in_array($file->uuid, $fileIds)) {
    $fileIds[] = $file->uuid;
    $assistant->setFileIds($fileIds);
    $assistant->sync();
}

$thread = Thread::getInstance($result['type'], $result['user_uuid'], $result['site_uuid']);

$messageData =  [
    'role' => 'user',
    'content' => $result['prompt'],
    'file_ids' => [$file->uuid]
];

function checkRun($thread, $assistant)
{
    global $request_id;

    $db = DatabaseHandler::inst();

    $maxAttempts = 10;
    $attempts = 0;

    do {
        $run = $thread->getLatestRun();

        if (!$run) {
            $run = $thread->createRun($assistant->uuid);
        }

        if ($run->status != 'completed') {
            echo "Going to sync\n";
            $run->sync();
            $attempts++;
            sleep(5); // Sleep for 5 seconds
        } else {
            echo "Getting messages from thread\n";
            $asad =  $thread->getMessages();
            $db->update('openai_user_requests', ['status' => 'completed', 'updated_at' => date("Y-m-d H:i:s"), 'ai_response_json' => $asad['data'][0]['content'][0]['text']['value']], ['id' => $request_id]);
            return;
        }
    } while ($attempts < $maxAttempts);
    $db->update('openai_user_requests', ['status' => 'failed', 'updated_at' => date("Y-m-d H:i:s")], ['id' => $request_id]);
}

checkRun($thread, $assistant);
return;
