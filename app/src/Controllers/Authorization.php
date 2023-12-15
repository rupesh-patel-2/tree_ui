<?php

namespace Controllers;

use Models\UserModel;

session_start();
class Authorization
{

    public static function login()
    {
        $data = [
            'email'    => $_POST["email"],
            'password' => md5($_POST['password'])
        ];

        $user = new UserModel();
        $res = $user->login($data);
        if ($res) {
            $userData = array_shift($res);
            $_SESSION['LoggedInUser'] = [
                'id'           => $userData['id'],
                'first_name'   => $userData['first_name'],
                'last_name'    => $userData['last_name'],
                'email'        => $userData['email'],
            ];
            $user = $_SESSION['LoggedInUser'];

            $user['access_token'] = session_id() . '090##934' . time();

            return [
                'code' => 200,
                'message' => 'User Login Success',
                'user' => $user,
            ];
        } else {
            return [
                'code' => 400,
                'message' => 'User Login Failed'
            ];
        }
    }
}
