<?php
namespace OpenAi; 
use OpenAi\Traits\Common;
use Core\DatabaseHandler;
use OpenAi\Mesage;

class Thread {
    use Common;
    protected $uuid;
    protected $purpose;
    protected $user_uuid;

    public function __construct($purpose , $user_uuid){
        $this->purpose = $purpose;
        $this->user_uuid = $user_uuid;
    }

    public static function getInstance($purpose , $user_uuid){
        $db = DatabaseHandler::inst();
        $inst = new self($purpose , $user_uuid);
        $dbInst = $db->select('threads',['purpose' => $purpose , 'user_uuid' => $user_uuid]);
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
        $db->insert('threads',$data); 
    }

    public function getPropertiesAsArray(){
        $data = [
            'uuid' => $this->uuid,
            'purpose' => $this->purpose,
            'user_uuid' => $this->user_uuid,
        ];
        return $data;
    }

    public function createOnOpenAi(){
        $success = false;
        $data  = ['metadata' => [
            'user_uuid' => $this->user_uuid
        ]];
        $response = Http::post( 'threads', $data, self::getExtraHeaers());
        if(!empty($response['id'])){
            $this->uuid = $response['id'];
            $this->save();
            $success = true;
        }
        return $success;
    }

    public function pushMessage( $message ){
        $message['thread_id'] = $this->uuid;
        $mObj = new Message($message);
        $mObj->createOnOpenAi();
        return $mObj;
    }

    public function createRun($assistant_id){
        $run = [
            'assistant_id' => $assistant_id,
            'thread_id' => $this->uuid
        ];
        $rObj = new Run($run);
        $rObj->start();
        return $rObj;
    }

    public function getLatestCompletedRun(){
        $run = false;
        $db = DatabaseHandler::inst();
        $dbInst = $db->select('runs', [
            ['thread_id' ,'=', $this->uuid] ,
            ['status' ,'=','completed']
        ] , 'runs.id DESC');
        if(!empty($dbInst)){
            $run = new Run([
                'assistant_id' => $dbInst[0]['assistant_id'],
                'thread_id' => $dbInst[0]['thread_id']
            ]);
            $run->status = $dbInst[0]['status'];
            $run->id = $dbInst[0]['id'];
        }
        return $run;
    }

    public function getLatestRun(){
        $run = false;
        $db = DatabaseHandler::inst();
        $dbInst = $db->select('runs', [
            ['thread_id' ,'=', $this->uuid] 
        ] , 'runs.id DESC');
        if(!empty($dbInst)){
            $run = new Run([
                'assistant_id' => $dbInst[0]['assistant_id'],
                'thread_id' => $dbInst[0]['thread_id']
            ]);
            $run->uuid = $dbInst[0]['uuid'];
            $run->status = $dbInst[0]['status'];
            $run->id = $dbInst[0]['id'];
        }
        return $run;
    }

    public function getMessages() {
        $response = Http::get('threads/'.$this->uuid.'/messages',self::getExtraHeaers());
        if(isset($response['data'])){
            foreach($response['data'] as $message){
                Message::storeMessage($message);
            }
        }
    }

    public function extractJsonFromString($text) {
        // Find the position of "json" in the text
        $startPos = strpos($text, 'json');
    
        if ($startPos !== false) {
            // Extract the substring starting from "json"
            $jsonText = substr($text, $startPos + 4);
    
            // Remove unnecessary characters at the beginning of the JSON string
            $cleanedText = preg_replace('/^\s*\\\n/', '', $jsonText);
    
            // Decode the escaped characters in the cleaned text
            $decodedText = stripcslashes($cleanedText);
    
            // Decode the JSON string
            $json = json_decode($decodedText, true);
    
            // Check if the decoding was successful
            if (json_last_error() === JSON_ERROR_NONE) {
                return json_encode($json, JSON_PRETTY_PRINT);
            } else {
                throw new Exception('Invalid JSON format: ' . json_last_error_msg());
            }
        } else {
            throw new Exception('JSON not found in the provided text.');
        }
    }
}