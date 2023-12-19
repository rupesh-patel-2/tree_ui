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
$result = $db->select('openai_user_requests', ['id' => $request_id]);
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


sleep(10);

$db->update('openai_user_requests', ['status' => 'completed', 'updated_at' => date("Y-m-d H:i:s")], ['id' => $request_id]);
return;
