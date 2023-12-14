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

    public function edit($pageData)
    {
        $whereClause = ['uuid' => $_REQUEST['uuid']];
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

    public function loadRootPage($site_id)
    {
        $whereClause = [
            'site_id' => $site_id,
            'parent_page_id' => null
        ];

        $rootPage = false;

        // write query to load root page
        $databaseHandler = DatabaseHandler::inst();
        $result = $databaseHandler->select($this->tableName, $whereClause);
        var_dump($result);
        die;

        if ($rootPage) {
            $rootPage['children'] = self::loadChildren($rootPage['uuid']);
        }
        return $rootPage;
    }

    public static function loadChildren($uuid)
    {
        $children = []; // write query to load all the children of uuid
        foreach ($children as $key => $child) {
            $children[$key]['children'] = self::loadChildren($child['uuid']);
        }

        return $children;
    }
}
