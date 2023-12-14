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

    // public function loadMap($data)
    // {
    //     $whereClause = $data;

    //     $orderBy = 'page_components.sequence_number ASC';

    //     $joins = [
    //         "LEFT JOIN pages ON sites.id = pages.site_id",
    //         "LEFT JOIN page_components ON pages.id = page_components.page_id",
    //         "LEFT JOIN components ON page_components.component_id = components.id",
    //     ];

    //     $columns = 'sites.id as site_id, 
    //     pages.name as page_name,pages.id as page_id,
    //     pages.parent_page_id,
    //     components.name as component_name,
    //     components.description as component_description';

    //     $databaseHandler = new DatabaseHandler();
    //     $result = $databaseHandler->select($this->tableName, $whereClause, $orderBy, $joins, $columns);

    //     $mappedResult = [];

    //     foreach ($result as &$row) {
    //         $siteId = $row['site_id'];
    //         $mappedResult[$siteId]['name'] = $row['page_name'];
    //         $mappedResult[$siteId]['id'] = $row['page_id'];

    //         if ($row['component_name'] !== null) {
    //             $component = [
    //                 'name' => $row['component_name'],
    //                 'description' => $row['component_description'],
    //             ];
    //             $mappedResult[$siteId]['components'][] = $component;
    //         } else {
    //             $mappedResult[$siteId]['components'] = [];
    //         }


    //         if (!isset($mappedResult[$siteId]['top_component'])) {
    //             $mappedResult[$siteId]['top_component'] = $component;
    //         }

    //         $mappedResult[$siteId]['bottom_component'] = $component;

    //         if ($row['parent_page_id'] !== null) {
    //             $mappedResult[$siteId]['children'][] = [
    //                 'name' => $row['page_name'],
    //                 'id'   => $row['page_id'],
    //             ];
    //         }
    //     }


    //     return array_values($mappedResult);
    // }

    public function loadSiteMap($data)
    {
        $site_id = $this->isSiteExists($data);
        if ($site_id) {
            $pageModel = new PageModel();
            $siteMap = $pageModel->loadRootPage($site_id);
            return $siteMap;
        } else {
            return false;
        }
    }

    public function isSiteExists($data)
    {
        $databaseHandler = DatabaseHandler::inst();
        $result = $databaseHandler->select($this->tableName, $data);
        if (!empty($result)) {
            $result = array_shift($result);
            return $result['id']; // return that site id
        } else {
            $result = false;
        }
    }
}
