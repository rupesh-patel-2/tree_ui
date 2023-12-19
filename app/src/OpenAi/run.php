<?php
require_once __DIR__ . "/../../autoloader.php";

use OpenAi\Manager;
use OpenAi\Thread;
use OpenAi\Message;
use OpenAi\Assistants\SiteGenerator;
use OpenAi\Files\File;


Manager::configure();
$file = File::getInstance('components.json', 'assistants');


$assistant = SiteGenerator::getInstance();
$fileIds = $assistant->getFileIds();
if (!in_array($file->uuid, $fileIds)) {

    $fileIds[] = $file->uuid;
    $assistant->setFileIds($fileIds);
    $assistant->sync();
}
$user_uuid = "I_am_site_admin_1";
$site_uuid = "77b82be1-9afc-c10b-0185-58c1e8ac6ef6";
$thread = Thread::getInstance("generate_site", $user_uuid, $site_uuid);
$messageData =  [
    'role' => 'user',
    'content' => 'I am a dentist and I want to create a website where I can show all my services.',
    'file_ids' => [$file->uuid]
];

// $mesasage = $thread->pushMessage($messageData);
// $run = $thread->createRun($assistant->uuid);
$run = $thread->getLatestRun();
if (!$run) {
    $run = $thread->createRun($assistant->uuid);
}

if ($run->status != 'completed') {
    echo "going to sync ";
    $run->sync();
} else {
    echo "getting messages from thread";
    $thread->getMessages();
}


//var_dump($run);
