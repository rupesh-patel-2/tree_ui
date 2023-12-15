<?php

namespace Controllers;

use Models\UserModel;

session_start();
class Authorization
{

    public static function login()
    {
        $data = [
            'username'    => $_POST["username"],
            'is_active'   => 1,
            'is_verified' => 1,
        ];

        $user = new UserModel();
        $isEmailExists = $user->login($data);
        if ($isEmailExists) {
            $userData = array_shift($isEmailExists);
            $isPasswordExists = password_verify($_POST['password'], $userData['passhash']);
            if ($isPasswordExists) {
                $_SESSION['LoggedInUser'] = [
                    'id'           => $userData['uid'],
                    'first_name'   => $userData['first_name'],
                    'last_name'    => $userData['last_name'],
                    'email'        => $userData['username'],
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
        } else {
            return [
                'code' => 400,
                'message' => 'You are either not an active user or you haven\'t verified yourself yet'
            ];
        }
    }
}
