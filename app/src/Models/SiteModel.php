<?php

namespace Models;

use Core\DatabaseHandler as CoreDatabaseHandler;

class SiteModel
{
    public $tableName;

    public $timeStamp;

    public function __construct()
    {
        $this->tableName = 'sites';
        $this->timeStamp = date("Y-m-d H:i:s");
    }

    public function add($data)
    {
        $siteData = [
            'name'       => $data['name'],
            'user_id'    => $data['user_id'],
            'created_at' => $this->timeStamp
        ];
        $databaseHandler = new CoreDatabaseHandler();
        $result = $databaseHandler->insert($this->tableName, $siteData);
        return $result;
    }
}
