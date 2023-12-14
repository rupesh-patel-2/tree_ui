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
        $databaseHandler = DatabaseHandler::inst();
        $result = $databaseHandler->insert($this->tableName, $siteData);
        return $result;
    }

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
