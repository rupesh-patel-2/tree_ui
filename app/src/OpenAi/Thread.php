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

    public function getMessages() {
        $response = Http::get('threads/'.$this->uuid.'/messages',self::getExtraHeaers());
        var_dump($response);
    }
}