<?php

namespace Models;

use Core\DatabaseHandler;

class UserModel
{
    public $tableName;

    public $timeStamp;

    public function __construct()
    {
        $this->tableName = 'users';
        $this->timeStamp = date("Y-m-d H:i:s");
    }

    public function login($data)
    {
        $databaseHandler = DatabaseHandler::inst();
        $result = $databaseHandler->select($this->tableName, $data);
        return $result;
    }
}
