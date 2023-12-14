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
        $databaseHandler = DatabaseHandler::inst();
        $result = $databaseHandler->insert($this->tableName, $pageData);
        return $result;
    }

    public function edit($pageData)
    {
        $whereClause = ['uuid' => $_REQUEST['uuid']];
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

    public function loadRootPage($site_id)
    {
        $whereClause = [
            'site_id'        => $site_id,
            'parent_page_id' => null
        ];

        $columns = 'pages.id,pages.name, pages.uuid';

        $rootPage = false;

        $databaseHandler = DatabaseHandler::inst();
        $result = $databaseHandler->select($this->tableName, $whereClause, '', [], $columns);
        $rootPage = array_shift($result);

        if ($rootPage) {
            $pageComponent = new PageComponentModel();

            // Root Page Components
            $rootPage['components'] = $pageComponent->components(['page_id' => $rootPage['id']]);

            // Top Component
            $rootPage['top_component'] = isset($rootPage['components'][0]) ? $rootPage['components'][0] : (object) array();

            // Bottom Component
            $rootPage['bottom_component'] = isset($rootPage['components'][count($rootPage['components']) - 1]) ? $rootPage['components'][count($rootPage['components']) - 1] : (object) array();

            // Fetch Children Recursively
            $rootPage['children'] = $this->loadChildren($rootPage['id'], $site_id);
        }
        return $rootPage;
    }

    public function loadChildren($page_id, $site_id)
    {
        $whereClause = [
            'parent_page_id' => $page_id,
            'site_id'        => $site_id
        ];

        $columns = 'pages.id,pages.name, pages.uuid';

        $children = [];

        $databaseHandler = DatabaseHandler::inst();
        $children = $databaseHandler->select($this->tableName, $whereClause, '', [], $columns);


        foreach ($children as $key => $child) {
            $children[$key]['children'] = $this->loadChildren($child['id'], $site_id);
        }

        return $children;
    }
}
