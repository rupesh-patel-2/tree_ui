<?php 
require_once __DIR__."/../../autoloader.php";
use OpenAi\Manager;
echo env('TEST');
$db = Core\DatabaseHandler::inst();
var_dump($db);
