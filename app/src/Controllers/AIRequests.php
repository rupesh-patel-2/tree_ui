<?php

namespace Controllers;

use Models\AIRequestModel;

require_once(__DIR__ . '/../Core/Config/CheckLogin.php');
class AIRequests
{
    public static function add()
    {
        $data = [
            'type'        => $_POST['type'],
            'prompt'      => $_POST['prompt'],
            'site_id'     => $_POST['site_id'],
            'user_id'     => $_SESSION['LoggedInUser']['id'],
            'status'      => 'in_progress',
        ];
        $request = new AIRequestModel();
        $res = $request->add($data);
        if ($res) {
            $command = "php " . __DIR__ . "/../OpenAi/UpdateRequestStatus.php $res > /dev/null 2>&1 &";
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
