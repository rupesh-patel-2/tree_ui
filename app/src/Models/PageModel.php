<?php

namespace Models;

use Core\DatabaseHandler;

class PageModel
{
    public $tableName;

    public $timeStamp;

    public function __construct()
    {
        $this->tableName = 'pages';
        $this->timeStamp = date("Y-m-d H:i:s");
    }

    public function add($pageData)
    {
        $pageData['created_at'] = $this->timeStamp;
        $databaseHandler = new DatabaseHandler();
        $result = $databaseHandler->insert($this->tableName, $pageData);
        return $result;
    }
}
