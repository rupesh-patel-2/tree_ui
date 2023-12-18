<?php 
namespace OpenAi\Assistants;
use Core\DatabaseHandler;
use OpenAi\Http;
use OpenAi\Traits\Common;
abstract class Alfred {
    use Common;
    protected static $name = "Alfred Thaddeus Crane Pennyworth";
    protected static $model = 'gpt-4';
    protected $id;
    protected $instructions = "You are the blueprint for all the assistants,this project will have. behave as Alfrate behaves with batman.";
    protected $tools = [ ["type" => "retrieval"] , ["type" => "code_interpreter"] ];
    
    protected $file_ids = [];
    protected $metadata = [];
    public $uuid = null;

    protected $propmtVars = [];

    public function setPromptVars($vars = []){
        $this->promptVars = $vars;
        return $this;
    }

    public function setFileIds($files = []){
        $this->file_ids = $files;
    }

    public function getFileIds($files = []){
        return $this->file_ids;
    }


    public function parsePrompt(){
        foreach($this->promptVars as $key => $value){
            $this->instructions = str_replace($key,$value,$this->instructions);
        }
        return $this;
    }

    public static function getInstance($promptVars = []){
        $db = DatabaseHandler::inst();
        $class = get_called_class();
        $inst = new $class();
        $inst->setPromptVars($promptVars)->parsePrompt();
        $dbInst = $db->select('assistants',['name' => $class::$name , 'model' => $class::$model]);
        if(empty($dbInst)){
            $inst->createOnOpenAi();
        } else {
            $dbInst = $dbInst[0];
            $inst->uuid = $dbInst['uuid'];
            $inst->id = $dbInst['id'];
        }
        return $inst;
    }

    public function save(){

        $db = DatabaseHandler::inst();
        $data = $this->getPropertiesAsArray();
        if($this->id) {
            $db->update('assistants',$data,['assistants.id' => $this->id]);
        } else {
            $db->insert('assistants',$data);
        }
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
            $this->file_ids = $response['file_ids'];
            $this->save();
            $success = true;
        }
        return $success;
    }

    public function sync(){
        $success = false;
        $data = $this->getPropertiesAsArray(false);
        unset($data['uuid']);
        $response = Http::post('assistants/'.$this->uuid,$data,self::getExtraHeaers());
        if(!empty($response['id'])){
            $this->uuid = $response['id'];
            $this->file_ids = $response['file_ids'];
            $this->save();
            $success = true;
        }
        return $success;
    }

}

