<?php

namespace Core;

error_reporting(1);
ini_set('display_errors', true);

class Launcher
{

    protected $controller = false;
    protected $action = false;
    protected $response = false;
    protected $responseHeaders = [];
    protected $baseUrl = '/';

    public function __construct()
    {
        $this->processUrl();
    }

    public function setBaseUrl($url)
    {
        $this->baseUrl = $url;
    }

    public function processUrl()
    {
        $parts = array_filter(explode('/', $_SERVER['REQUEST_URI']));
        $parts = array_reverse($parts);
        $this->action = $parts[0];
        $this->controller = $parts[1];
    }

    public function callAction()
    {
        $controller = ucfirst($this->controller);
        $action = $this->action;
        $namespace = "Controllers";

        if ($controller && $action) {
           $output = call_user_func($namespace . "\\" . "$controller::$action");
           $this->response = $output;
        }
    }

    public function sendResponse()
    {
        $this->sendResponseHeaders();
        echo json_encode($this->response);
    }

    public function setHeader($key, $value)
    {
        $this->responseHeaders[$key] = $value;
    }

    public function sendResponseHeaders()
    {
        foreach ($this->responseHeaders as $header => $headerValue) {
            header($header . ': ' . $headerValue);
        }
    }
}
