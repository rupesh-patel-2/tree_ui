<?php 

require_once 'autoloader.php';
// require_once('config/check_login.php');

$lanucher = new \Core\Launcher();

$lanucher->processUrl();
$lanucher->callAction();
$lanucher->sendResponse();