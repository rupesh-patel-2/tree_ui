<?php 
namespace Core;

class Launcher {

    protected $controller = false;
    protected $action = false;
    protected $response = false;
    protected $responseHeaders = [];
    protected $baseUrl = '/';

    public function __construct(){
        $this->processUrl();
    }

    public function setBaseUrl($url){
        $this->baseURl = $url;
    } 

    public function processUrl(){
        var_dump($_SERVER['REQUEST_URI']);
        $parts = array_filter(explode('/',$_SERVER['REQUEST_URI']));
        $parts = array_reverse($parts);
        
        var_dump($parts);

    }

    public function callAction(){
        $controller = $this->controller;
        $action = $this->action;
        if($controller && $action) {
            $this->$response =  $controller::$action();
        }
    }

    public function sendResponse(){
        $this->sendResponseHeaders();
    }

    public function setHeader($key,$value){
        $this->responseHeaders[$key] = $value;
    }

    public function sendResponseHeaders(){
        foreach($this->headers as $header => $headerValue){
            header($header.': '.$headerValue);
        }
    }
}