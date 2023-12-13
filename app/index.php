<?php

require_once 'autoloader.php';

$lanucher = new \Core\Launcher();

$lanucher->processUrl();
$lanucher->callAction();
$lanucher->sendResponse();
