<?php

namespace Models;

use Core\DatabaseHandler;

class OpenAIUserRequestModel
{
    public $tableName;

    public $timeStamp;

    public $requestStatus = [];

    public function __construct()
    {
        $this->tableName = 'openai_user_requests';
        $this->timeStamp = date("Y-m-d H:i:s");
        $this->requestStatus = ['in_progress', 'completed'];
    }

    public function add($requestData)
    {
        $requestData['created_at'] = $this->timeStamp;
        $databaseHandler = DatabaseHandler::inst();
        $result = $databaseHandler->insert($this->tableName, $requestData);

        return $result ? mysqli_insert_id($databaseHandler->connection) : false;
    }
}
