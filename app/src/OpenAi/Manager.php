<?php 

namespace OpenAi;

class Manager {
    static $inst = false;

    protected $api_key = '';
    protected $assistant_key = "";
    protected $baseUrl = "";
    static function inst() {
        if(!self::$inst){
            self::$inst = new self(); 
        }
        return self::$inst;
    }

    public static function set($key,$value){
        self::inst()->$key = $value;
    }

    public static function get($key){
        $inst = self::inst();
        return $inst->$key;
    }

    public static function configure(){
        Manager::set('api_key',env('OPEN_AI_API_KEY'));
        Manager::set('baseUrl',env('OPEN_AI_BASE_URL'));
        Http::configure();
    }

    
}