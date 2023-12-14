<?php 
namespace OpenAi\Assistants;
use Core\DatabaseHandler;
use OpenAi\Http;
use OpenAi\Traits\Common;
abstract class Alfred {
    use Common;
    protected static $name = "Alfred Thaddeus Crane Pennyworth";
    protected static $model = 'gpt-4';
    protected $instructions = "You are the blueprint for all the assistants,this project will have. behave as Alfrate behaves with batman.";
    protected $tools = [ ["type" => "retrieval"] , ["type" => "code_interpreter"] ];
    
    protected $file_ids = [];
    protected $metadata = [];
    public $uuid = null;

    public static function getInstance(){
        $db = DatabaseHandler::inst();
        $class = get_called_class();
        $inst = new $class();
        $dbInst = $db->select('assistants',['name' => $class::$name , 'model' => $class::$model]);
        if(empty($dbInst)){
            $inst->createOnOpenAi();
        } else {
            $dbInst = $dbInst[0];
            $inst->uuid = $dbInst['uuid'];
        }
        return $inst;
    }

    public function save(){

        $db = DatabaseHandler::inst();
        $data = $this->getPropertiesAsArray();
        $db->insert('assistants',$data);   

    }

    public function getPropertiesAsArray( $encoded = true){
        $class = get_called_class();
        $data = [
            'uuid' => $this->uuid,
            'name' => $class::$name,
            'model' => $class::$model,
            'instructions' => $this->instructions,
            'tools' =>  $encoded ? json_encode($this->tools) : $this->tools,
            'file_ids' => $encoded ?  json_encode($this->file_ids) : $this->file_ids,
            'metadata' => $encoded ?  json_encode($this->metadata) : $this->metadata
        ];
        return $data;
    }

    public function createOnOpenAi(){
        $success = false;
        $data = $this->getPropertiesAsArray(false);
        unset($data['uuid']);
        $response = Http::post('assistants',$data,self::getExtraHeaers());
        if(!empty($response['id'])){
            $this->uuid = $response['id'];
            $this->save();
            $success = true;
        }
        return $success;
    }

   

    public static function loadInstance(){
        
    }
}

