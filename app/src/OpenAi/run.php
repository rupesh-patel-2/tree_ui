<?php 
require_once __DIR__."/../../autoloader.php";
use OpenAi\Manager;
use OpenAi\Thread;
use OpenAi\Message;
use OpenAi\Assistants\SiteGenerator;


Manager::configure();

$assistant = SiteGenerator::getInstance();
$user_uuid = "I_am_site_admin_1";
$thread = Thread::getInstance("generate_site",$user_uuid);
$messageData =  [
    'role' => 'user',
    'content' => 'I am a dentist and I want to create a website where I can show all my services.'
];

// $mesasage = $thread->pushMessage($messageData);

$run = $thread->createRun($assistant->uuid);
if($run->status != 'completed'){
    echo "going to sync ";
    $run->sync();
} else {
    echo "getting messages from thread";
    $thread->getMessages();
}


//var_dump($run);

