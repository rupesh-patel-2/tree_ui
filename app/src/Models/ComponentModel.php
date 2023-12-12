<?php

namespace Models;

use Core\DatabaseHandler;

class ComponentModel
{
    public $tableName;

    public $timeStamp;

    public function __construct()
    {
        $this->tableName = 'components';
        $this->timeStamp = date("Y-m-d H:i:s");
    }

    public function add($pageData)
    {
        $pageData['created_at'] = $this->timeStamp;
        $databaseHandler = new DatabaseHandler();
        $result = $databaseHandler->insert($this->tableName, $pageData);
        return $result;
    }

    public function list()
    {
        $databaseHandler = new DatabaseHandler();
        $result = $databaseHandler->select($this->tableName);
        return $result;
    }
}
