<?php

namespace Controllers;

use Models\SiteModel;

class Site
{
    public static function add()
    {
        $data = [
            'name'    => $_REQUEST['name'],
            'user_id' => $_REQUEST['user_id'],
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
