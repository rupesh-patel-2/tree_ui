<?php

require_once __DIR__ . "/../../autoloader.php";

use OpenAi\Message;

$messages = Message::getUnProcessedAssistantMessages();

foreach ($messages as $message) {
    $message->processMessage();
}
