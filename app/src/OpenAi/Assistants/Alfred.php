<?php 
namespace OpenAi\Assistants;
use Core\DatabaseHandler;
use OpenAi\Http;
abstract class Alfred {
    protected $name = "Alfred Thaddeus Crane Pennyworth";
    protected $instructions = "You are the blueprint for all the assistants,this project will have. behave as Alfrate behaves with batman.";
    protected $tools = [ ["type" => "retrieval"] , ["type" => "code_interpreter"] ];
    protected $model = 'gpt-4';
    protected $file_ids = [];
    protected $metadata = [];

    public static function createInstance(){

    }

    public static function loadInstance(){
        
    }
}

