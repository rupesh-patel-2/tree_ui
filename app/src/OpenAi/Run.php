<?php 
namespace OpenAi;
use OpenAi\Traits\Common;
use Core\DatabaseHandler;
class Run {
    use Common;
    public $id;
    public $uuid;
    protected $assistant_id;
    protected $thread_id;
    public $status;

    public function __construct($run){
        $this->assistant_id = $run['assistant_id'];
        $this->thread_id = $run['thread_id'];
    }

    public function getStatus(){
        return $this->status;
    }

    public function getPropertiesAsArray( $encoded = true){
        $data = [
            'uuid' => $this->uuid,
            'assistant_id' => $this->assistant_id,
            'thread_id' => $this->thread_id,
            'status' => $this->status
        ];
        return $data;
    }

    public function save(){
        $db = DatabaseHandler::inst();
        $data = $this->getPropertiesAsArray();
        if($this->id) {
            $db->update('runs',$data,['runs.id' => $this->id]);
        } else {
            $db->insert('runs',$data);
        }
    }

    public function start(){
        $db = DatabaseHandler::inst();
        $dbInst = $db->select('runs', [
            ['thread_id' ,'=', $this->thread_id] ,
            ['assistant_id' , '=', $this->assistant_id],
            ['status' ,'!=','completed']
        ] , 'runs.id DESC');
       
        if(empty($dbInst)) {
            $this->createOnOpenAi();
        } else {
            $dbInst = $dbInst[0];
            $this->id = $dbInst['id'];
            $this->uuid = $dbInst['uuid'];
            $this->status = $dbInst['status'];
        }
        return $this;
    }

    public function createOnOpenAi(){
        $success = false;
        $data = $this->getPropertiesAsArray(false);
        unset($data['uuid']);
        unset($data['thread_id']);
        unset($data['status']);

        $response = Http::post('threads/'.$this->thread_id.'/runs',$data,self::getExtraHeaers());
        if(!empty($response['id'])){
            $this->uuid = $response['id'];
            $this->status = $response['status'];
            $this->save();
            $success = true;
        } else {
            throw new \Exception(json_encode($response));
        }
        return $success;
    }

    public function sync(){
        $response = Http::get('threads/'.$this->thread_id.'/runs/'.$this->uuid,self::getExtraHeaers());
        $this->status = $response['status'];
        $this->save();
    }

    

}