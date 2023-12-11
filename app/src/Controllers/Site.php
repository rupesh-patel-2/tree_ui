<?php

namespace Controllers;

use Models\SiteModel;

class Site
{


    public static function add()
    {
        // echo $connection;
        // die;
        $data = $_REQUEST['params'];
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
