<?php

namespace Controllers;

use Models\SiteModel;

require_once(__DIR__ . '/../Core/Config/CheckLogin.php');
class Sitemap
{
    public static function index()
    {
        $data = [
            'user_id' => $_SESSION['LoggedInUser']['id']
        ];

        $siteMap = new SiteModel();
        $res = $siteMap->loadMap($data);

        return [
            'code'    => 200,
            'message' => 'Site Map JSON',
            'data'    => $res
        ];
    }
}
