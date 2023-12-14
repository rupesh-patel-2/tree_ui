<?php 
namespace OpenAi;

class Http {
    public static $baseUrl = 'https://api.openai.com/v1/';
    public static $apiKey;
    public static function setApiKey($key) {
        self::$apiKey = $key;
    }

    public static function get($endpoint) {
        self::preCheck();
        $url = self::$baseUrl . $endpoint;

        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, [
            'Content-Type: application/json',
            'Authorization: Bearer ' . self::$apiKey,
        ]);

        $response = curl_exec($ch);

        if (curl_errno($ch)) {
            throw new \Exception('Curl error: ' . curl_error($ch));
        }

        curl_close($ch);

        return json_decode($response, true);
    }

    public static function post($endpoint, $params) {
        self::preCheck();
        $url = self::$baseUrl . $endpoint;

        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($params));
        curl_setopt($ch, CURLOPT_HTTPHEADER, [
            'Content-Type: application/json',
            'Authorization: Bearer ' . self::$apiKey,
        ]);

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