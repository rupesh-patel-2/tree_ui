<?php

namespace Controllers;

use Models\SiteModel;

require_once(__DIR__ . '/../Core/Config/CheckLogin.php');
class Sitemap
{
    public static function index()
    {
        $data = [
            'user_id' => $_SESSION['LoggedInUser']['id'],
            'uuid'    => $_POST['site_uuid'],
        ];

        $siteMap = new SiteModel();
        $res = $siteMap->loadSiteMap($data);
        if ($res) {
            return [
                'code'    => 200,
                'message' => 'Site Map JSON',
                'data'    => $res
            ];
        } else {
            return [
                'code'    => 400,
                'message' => 'Failed to load site map',
            ];
        }

    }
}
