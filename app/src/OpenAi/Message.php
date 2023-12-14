<?php 
namespace OpenAi;
use OpenAi\Traits\Common;
use Core\DatabaseHandler;
class Message {
    use Common;
    protected $role;
    protected $content;
    protected $file_ids = [];
    protected $thread_id;
    protected $uuid;
    protected $run_id;

    public function __construct($message) {
        $this->role = $message['role'];
        $this->content = $message['content'];
        $this->thread_id = $message['thread_id'];
        $this->file_ids = isset($message['file_ids']) ? $message['file_ids'] : [];
    }

    public function getPropertiesAsArray( $encoded = true) {
        $data = [
            'uuid' => $this->uuid,
            'role' => $this->role,
            'content' => $this->content,
            'thread_id' => $this->thread_id,
            'file_ids' => $encoded ?  json_encode($this->file_ids) : $this->file_ids,
        ];
        return $data;
    }

    public function save(){
        $db = DatabaseHandler::inst();
        $data = $this->getPropertiesAsArray();
        $db->insert('messages',$data);
    }

    public function createOnOpenAi(){
        $success = false;
        $data = $this->getPropertiesAsArray(false);
        unset($data['uuid']);
        unset($data['thread_id']);
        unset($data['run_id']);
        $response = Http::post('threads/'.$this->thread_id.'/messages',$data,self::getExtraHeaers());
        if(!empty($response['id'])){
            $this->uuid = $response['id'];
            $this->save();
            $success = true;
        } else {
            throw new \Exception(json_encode($response));
        }
        return $success;
    }
}