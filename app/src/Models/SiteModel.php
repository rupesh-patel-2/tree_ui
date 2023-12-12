<?php

namespace Models;

use Core\DatabaseHandler;

class SiteModel
{
    public $tableName;

    public $timeStamp;

    public function __construct()
    {
        $this->tableName = 'sites';
        $this->timeStamp = date("Y-m-d H:i:s");
    }

    public function add($siteData)
    {
        $siteData['created_at'] = $this->timeStamp;
        $databaseHandler = new DatabaseHandler();
        $result = $databaseHandler->insert($this->tableName, $siteData);
        return $result;
    }
}
