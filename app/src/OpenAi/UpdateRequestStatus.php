<?php


require_once __DIR__ . "/../../autoloader.php";

use Core\DatabaseHandler;

error_reporting(E_ALL);
ini_set('display_errors', 1);
if ($argc < 2) {
    die("Usage: php script.php request_id\n");
}

$request_id = $argv[1];

sleep(10);
$db = DatabaseHandler::inst();
$db->update('openai_user_requests', ['status' => 'completed', 'updated_at' => date("Y-m-d H:i:s")], ['id' => $request_id]);
return;
