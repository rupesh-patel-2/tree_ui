<?php

namespace Models;

use Core\DatabaseHandler as CoreDatabaseHandler;

class SiteModel
{
    public function add($data)
    {
        $insertData = [
            'name' => $data['name'] ?? 'Asad Mansuri',
            'user_id' => $data['user_id'] ?? 1,
            'created_at' => date("Y-m-d H:i:s")
        ];
        $databaseHandler = new CoreDatabaseHandler();
        $result = $databaseHandler->insert('sites', $insertData);
        return $result;
    }
}
