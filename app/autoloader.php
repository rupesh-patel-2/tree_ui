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

function env($key, $default = null)
{
    // Load the contents of the .env file
    $envFilePath = __DIR__ . '/.env';

    if (!file_exists($envFilePath)) {
        throw new Exception('The .env file does not exist.');
    }

    $envFileContents = file_get_contents($envFilePath);

    // Parse the .env file contents and extract key-value pairs
    $lines = explode("\n", $envFileContents);
    $envVariables = [];

    foreach ($lines as $line) {
        $line = trim($line);

        if ($line && strpos($line, '=') !== false) {
            list($envKey, $envValue) = explode('=', $line, 2);
            $envVariables[trim($envKey)] = trim($envValue);
        }
    }

    // Return the value for the given key or the default value if not found
    return isset($envVariables[$key]) ? $envVariables[$key] : $default;
}