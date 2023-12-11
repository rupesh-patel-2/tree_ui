<?php

namespace Controllers;

use Models\UserModel;

class User
{
    public static function add()
    {
        $user = new UserModel();
        echo $user->add();
        die;
        return [
            'message' => 'I am asad index'
        ];
    }
}
