<?php

return  [
    'servername' => env( 'DB_HOST', 'localhost'),
    'username' => env( 'DB_USERNAME', 'root'),
    'password' => env( 'DB_PASSWORD', 'localhost'),
    'dbname' => env( 'DB_DATABASE'),
    'port' => env( 'DB_PORT', '3306'),
];
