<?php

namespace Controllers;

use Core\DatabaseHandler;
use Models\ComponentModel;

class Component
{
    public static function add()
    {
        $data = [
            'name'        => $_POST['name'],
            'description' => $_POST['description'] ?? '',
            'uuid'        => DatabaseHandler::generateUUId()
        ];
        $component = new ComponentModel();
        $res = $component->add($data);
        if ($res) {
            return [
                'code' => 200,
                'message' => 'Component has been added successfully'
            ];
        } else {
            return [
                'code' => 400,
                'message' => 'Component failed to add'
            ];
        }
    }

    public static function list()
    {
        $component = new ComponentModel();
        $res = $component->list();
        if (!empty($res)) {
            return [
                'code'     => 200,
                'message'  => 'List of Components',
                'data'     => $res,
            ];
        } else {
            return [
                'code' => 400,
                'message' => 'Component failed to add'
            ];
        }
    }
}
