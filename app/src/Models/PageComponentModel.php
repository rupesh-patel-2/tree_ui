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
        $databaseHandler = new DatabaseHandler();
        # Sequence Number Logic - Starts Here
        if (!empty($pageComponentData['sequence_number'])) {
            $pageComponentData['sequence_number'] = $pageComponentData['sequence_number'];
        } else {
            $addedComponents = $databaseHandler->select($this->tableName, ['page_id' => $pageComponentData['page_id']]);
            $pageComponentData['sequence_number'] = count($addedComponents) + 1;
        }
        # Sequence Number Logic - Ends Here

        $pageComponentData['created_at'] = $this->timeStamp;
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
        $orderBy = '`sequence_number` ASC';
        $databaseHandler = new DatabaseHandler();
        $result = $databaseHandler->select($this->tableName, $whereClause, $orderBy);
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
