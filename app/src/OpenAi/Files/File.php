<?php 
namespace OpenAi\Files;
use OpenAi\Traits\Common;
use Core\DatabaseHandler;
use OpenAi\Http;
class File {
    use Common;
    protected $id;
    protected $filename;
    public $uuid;
    protected $purpose = 'assistants';
    protected static $fileBasePath = __DIR__.'/../TrainingFiles';

    public function __construct($file) {
        $this->filename = $file['filename'];
        $this->purpose = isset($file['purpose']) ? $file['purpose'] : 'assistants';
    }

    public static function getInstance($filename , $purpose) {
        $db = DatabaseHandler::inst();
        $inst = new self(['filename' => $filename,'purpose' => $purpose]);
        $dbInst = $db->select('files',['purpose' => $purpose , 'filename' => $filename]);
        if(empty($dbInst)){
            $inst->createOnOpenAi();
        } else {
            $dbInst = $dbInst[0];
            $inst->uuid = $dbInst['uuid'];
        }
        return $inst;
    }

    public function getPropertiesAsArray( $encoded = true ) {
        $data = [
            'uuid' => $this->uuid,
            'filename' => $this->filename,
            'purpose' => $this->purpose
        ];
        return $data;
    }

    public function save() {
        $db = DatabaseHandler::inst();
        $data = $this->getPropertiesAsArray();
        if($this->id) {
            $db->update('files',$data,['files.id' => $this->id]);
        } else {
            $db->insert('files',$data);
        }
    }
    public function getPath(){
        return self::$fileBasePath.'/'.$this->filename;
    }
    public function createOnOpenAi(){
        $success = false;
        $data = [
            'purpose' => $this->purpose
        ];
        $files = [
           "file" => $this->getPath()
        ];

        $response = Http::postMultiPart('files',$data,$files,self::getExtraHeaers());
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