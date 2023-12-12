<?php

namespace Controllers;

use Core\DatabaseHandler;
use Models\PageModel;

class Page
{

    public static function add()
    {
        $data = [
            'name'      => $_POST['name'],
            'user_id'   => $_SESSION['LoggedInUser']['id'] ?? 1,
            'site_id'   => $_POST['site_id'],
            'uuid'      => DatabaseHandler::generateUUId()
        ];
        $page = new PageModel();
        $res = $page->add($data);
        if ($res) {
            return [
                'code' => 200,
                'message' => 'Page has been added successfully'
            ];
        } else {
            return [
                'code' => 400,
                'message' => 'Page failed to add'
            ];
        }
    }

    public static function edit()
    {
        $data = [
            'name' => $_POST['name'],
            'uuid' => $_POST['uuid'],
        ];
        $page = new PageModel();
        $res = $page->edit($data);
        if ($res) {
            return [
                'code' => 200,
                'message' => 'Page has been updated successfully'
            ];
        } else {
            return [
                'code' => 400,
                'message' => 'Page failed to update'
            ];
        }
    }
}
