<?php 
function customAutoloader($className)
{
    // Define the base directory for your namespace
    $baseDir = __DIR__ . '/src/';

    // Replace namespace separator with directory separator, replace underscores
    // with directory separators in the class name, append with .php
    $className = str_replace('\\', DIRECTORY_SEPARATOR, $className) . '.php';

    // Combine the base directory with the class file
    $file = $baseDir . $className;

    // If the file exists, include it
    if (file_exists($file)) {
        require $file;
    }
}

// Register the autoloader
spl_autoload_register('customAutoloader');