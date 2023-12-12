<?php

namespace Controllers;

use Core\DatabaseHandler;
use Models\SiteModel;

class Site
{
    public static function add()
    {
        $data = [
            'name'    => $_POST['name'],
            'uuid'    => DatabaseHandler::generateUUId(),
            'user_id' => $_SESSION['LoggedInUser']['id'] ?? 1,
        ];
        $site = new SiteModel();
        $res = $site->add($data);
        if ($res) {
            return [
                'code' => 200,
                'message' => 'Site has been added successfully'
            ];
        } else {
            return [
                'code' => 400,
                'message' => 'Site failed to add'
            ];
        }
    }
}
