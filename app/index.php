<?php

require_once 'autoloader.php';
require_once(__DIR__ . '/src/Core/Config/CheckSession.php');

$lanucher = new \Core\Launcher();

$lanucher->processUrl();
$lanucher->callAction();
$lanucher->sendResponse();
