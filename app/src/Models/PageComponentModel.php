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
        $databaseHandler = DatabaseHandler::inst();
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
        $databaseHandler = DatabaseHandler::inst();
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
        $databaseHandler = DatabaseHandler::inst();
        $result = $databaseHandler->select($this->tableName, $whereClause, $orderBy);
        return !empty($result) ? $result : false;
    }

    public function remove($data)
    {
        $whereClause = $data;
        $databaseHandler = DatabaseHandler::inst();
        $result = $databaseHandler->delete($this->tableName, $whereClause);
        return !empty($result) ? $result : false;
    }

    public function changeOrder($data)
    {
        $databaseHandler = DatabaseHandler::inst();

        $databaseHandler->beginTransaction();

        global $success;
        $success = true;

        foreach ($data['component_ids'] as $index => $componentId) {
            $updateResult[] = $databaseHandler->update($this->tableName, ['sequence_number' => $index + 1, 'updated_at' => $this->timeStamp], ['component_id' => $componentId, 'page_id' => $data['page_id']]);
            if ($updateResult === false) {
                $success = false;
                break;
            }
        }

        if ($success) {
            $databaseHandler->commit();
            return true;
        } else {
            $databaseHandler->rollback();
            return false;
        }
    }

    public function components($page_id)
    {
        $components = [];

        $whereClause = $page_id;

        $orderBy = 'page_components.sequence_number ASC';

        $joins = [
            "LEFT JOIN components ON page_components.component_id = components.id",
        ];

        $columns = 'components.name,components.description';

        $databaseHandler = DatabaseHandler::inst();
        $components = $databaseHandler->select($this->tableName, $whereClause, $orderBy, $joins, $columns);

        return $components;
    }
}
