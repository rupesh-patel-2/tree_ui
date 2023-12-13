<?php

namespace Controllers;

require_once(__DIR__ . '/../Core/Config/CheckLogin.php');
class Sitemap
{
    public static function index()
    {
        return [
            'message' => 'I am index'
        ];
    }
}
