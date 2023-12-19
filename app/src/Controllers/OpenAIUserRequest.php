<?php

namespace Controllers;

use Models\OpenAIUserRequestModel;

require_once(__DIR__ . '/../Core/Config/CheckLogin.php');
class OpenAIUserRequest
{
    public static function add()
    {
        $data = [
            'type'        => $_POST['type'],
            'prompt'      => $_POST['prompt'],
            'site_uuid'   => $_POST['site_uuid'],
            'user_uuid'   => $_SESSION['LoggedInUser']['uuid'],
            'status'      => 'in_progress',
        ];
        $request = new OpenAIUserRequestModel();
        $res = $request->add($data);
        if ($res) {
            $command = "php " . __DIR__ . "/../OpenAi/UpdateUserRequestStatus.php $res > /dev/null 2>&1 &";
            exec($command);

            return [
                'code' => 200,
                'message' => 'Request has been sent successfully',
                'request_id' => $res,
            ];
        } else {
            return [
                'code' => 400,
                'message' => 'Failed to request AI'
            ];
        }
    }
}
