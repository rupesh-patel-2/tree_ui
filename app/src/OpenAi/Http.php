<?php 
namespace OpenAi;
use OpenAi\Manager;
class Http {
    public static $baseUrl;
    public static $apiKey;
    public static function configure() {
        self::$apiKey = Manager::get('api_key');
        self::$baseUrl = Manager::get('baseUrl');
    }

    public static function get( $endpoint, $extraHeaders = []) {
        self::preCheck();
        $url = self::$baseUrl . $endpoint;

        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $headers = [
            'Content-Type: application/json',
            'Authorization: Bearer ' . self::$apiKey,
        ];
        $headers = array_merge($headers,$extraHeaders);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);

        $response = curl_exec($ch);

        if (curl_errno($ch)) {
            throw new \Exception('Curl error: ' . curl_error($ch));
        }

        curl_close($ch);

        return json_decode($response, true);
    }

    public static function post($endpoint, $params , $extraHeaders = []) {
        self::preCheck();
        $url = self::$baseUrl . $endpoint;

        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($params));
        $headers = [
            'Content-Type: application/json',
            'Authorization: Bearer ' . self::$apiKey,
        ];
        $headers = array_merge($headers,$extraHeaders);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);

        $response = curl_exec($ch);

        if (curl_errno($ch)) {
            throw new \Exception('Curl error: ' . curl_error($ch));
        }

        curl_close($ch);

        return json_decode($response, true);
    }

    public static function postMultiPart($endpoint, $params, $files = [], $extraHeaders = []) {
        self::preCheck();
        $url = self::$baseUrl . $endpoint;
    
        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POST, true);
    
        // Check if there are files to upload
        if (!empty($files)) {
            $postData = $params;
    
            foreach ($files as $fileKey => $filePath) {
                if (class_exists('CURLFile')) {
                    $postData[$fileKey] = new \CURLFile($filePath);
                } else {
                    $postData[$fileKey] = '@' . $filePath;
                }
            }
    
            curl_setopt($ch, CURLOPT_POSTFIELDS, $postData);
        } else {
            // If no files, send JSON data
            curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($params));
        }
    
        $headers = [
            'Authorization: Bearer ' . self::$apiKey,
        ];
    
        // If uploading files, set Content-Type as multipart/form-data
        if (!empty($files)) {
            $headers[] = 'Content-Type: multipart/form-data';
        } else {
            $headers[] = 'Content-Type: application/json';
        }
    
        $headers = array_merge($headers, $extraHeaders);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    
        $response = curl_exec($ch);
    
        if (curl_errno($ch)) {
            throw new \Exception('Curl error: ' . curl_error($ch));
        }
    
        curl_close($ch);
    
        return json_decode($response, true);
    }

    public static function preCheck(){
        if (empty(self::$apiKey)) {
            throw new \Exception('OpenAI API key not found in environment');
        }
    }
}