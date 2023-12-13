<?php

namespace Models;

use Core\DatabaseHandler;

class PageComponentModel
{
    public $tableName;

    public $timeStamp;

    public function __construct()
    {
        $this->tableName = 'page_components';
        $this->timeStamp = date("Y-m-d H:i:s");
    }

    public function add($pageComponentData)
    {
        $pageComponentData['created_at'] = $this->timeStamp;
        $databaseHandler = new DatabaseHandler();
        $result = $databaseHandler->insert($this->tableName, $pageComponentData);
        return $result;
    }

    public function edit($pageData)
    {
        $whereClause = ['uuid' => $_POST['uuid']];
        $databaseHandler = new DatabaseHandler();
        $result = $databaseHandler->select($this->tableName, $whereClause);

        if (!empty($result)) {
            $pageData['updated_at'] = $this->timeStamp;
            $updateResult = $databaseHandler->update($this->tableName, $pageData, $whereClause);
            return $updateResult;
        } else {
            return false;
        }
    }

    public function list($data)
    {
        $whereClause = $data;
        $databaseHandler = new DatabaseHandler();
        $result = $databaseHandler->select($this->tableName, $whereClause);
        return !empty($result) ? $result : false;
    }

    public function remove($data)
    {
        $whereClause = $data;
        $databaseHandler = new DatabaseHandler();
        $result = $databaseHandler->delete($this->tableName, $whereClause);
        return !empty($result) ? $result : false;
    }
}
