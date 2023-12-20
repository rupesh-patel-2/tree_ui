<?php

namespace OpenAi;

use OpenAi\Traits\Common;
use Core\DatabaseHandler;
use stdClass;

error_reporting(1);
ini_set('display_errors', true);
class Message
{
    use Common;
    protected $role;
    protected $content;
    protected $file_ids = [];
    protected $thread_id;
    protected $uuid;
    protected $run_id;
    protected $created_at = false;
    protected $id;
    public $extracted_json = '{}';

    public function __construct($message)
    {
        $this->role = $message['role'];
        $this->content = $message['content'];
        $this->thread_id = $message['thread_id'];
        $this->file_ids = isset($message['file_ids']) ? $message['file_ids'] : [];
    }

    public function getPropertiesAsArray($encoded = true)
    {
        $data = [
            'uuid' => $this->uuid,
            'role' => $this->role,
            'content' => is_array($this->content) ? json_encode($this->content) : $this->content,
            'thread_id' => $this->thread_id,
            'file_ids' => $encoded ?  json_encode($this->file_ids) : $this->file_ids,
            'created_at' => $this->created_at ? $this->created_at : date('Y-m-d H:i:s'),
            'extracted_json' => $this->extracted_json
        ];
        return $data;
    }

    public function save()
    {
        $db = DatabaseHandler::inst();
        $data = $this->getPropertiesAsArray();
        if ($this->id) {
            $db->update('messages', $data, ['runs.id' => $this->id]);
        } else {
            $db->insert('messages', $data);
        }
    }

    public static function storeMessage($msg)
    {
        $db = DatabaseHandler::inst();
        $msgDb = $db->select('messages', ['uuid' => $msg['id']]);
        if (empty($msgDb)) {
            $msgObj = new self($msg);
            $msgObj->uuid = $msg['id'];
            $msgObj->created_at = date('Y-m-d H:i:s', $msg['created_at']);
            // $msgObj->extractJsonFromString();
            $msgObj->save();
        }
    }

    public function extractJsonFromString()
    {
        $text = $this->content;
        $text = is_array($text) ? $text[0]['text']['value'] : $this->content;
        $startPos = strpos($text, 'json');

        if ($startPos !== false) {
            preg_match('/```json(.*?)```/s', $text, $cleanedText);
            if (isset($cleanedText[1])) {
                $jsonString = str_replace("\n", '', $cleanedText[1]);
                $jsonData = json_decode($jsonString, true);
                $extractedJson = json_encode($jsonData);
            } else {
                $extractedJson = "{}";
            }
            $this->extracted_json = $extractedJson;
        }
    }

    public function createOnOpenAi()
    {
        $success = false;
        $data = $this->getPropertiesAsArray(false);
        unset($data['uuid']);
        unset($data['thread_id']);
        unset($data['run_id']);
        unset($data['created_at']);
        unset($data['extracted_json']);
        $response = Http::post('threads/' . $this->thread_id . '/messages', $data, self::getExtraHeaers());
        if (!empty($response['id'])) {
            $this->uuid = $response['id'];
            $this->save();
            $success = true;
        } else {
            throw new \Exception(json_encode($response));
        }
        return $success;
    }

    public static function getUnProcessedAssistantMessages()
    {
        $db = DatabaseHandler::inst();
        $fetchedmessages = $db->select('messages', ['role' => 'assistant']);
        $messages = array_map(function ($item) {
            $object = new Message($item);
            $object->uuid = $item['uuid'];
            $object->run_id = $item['run_id'];
            $object->file_ids = $item['file_ids'];
            $object->created_at = $item['created_at'];
            $object->id = $item['id'];
            $object->extracted_json = $item['extracted_json'];
            return $object;
        }, $fetchedmessages);
        return $messages;
    }

    public function processMessage()
    {
        $data = array_shift(json_decode($this->content, true));

        preg_match('/```json(.*?)```/s', $data['text']['value'], $matches);

        if (isset($matches[1])) {
            $jsonString = str_replace("\n", '', $matches[1]);

            $jsonData = json_decode($jsonString, true);
            $extractedJson = json_encode($jsonData);
        } else {
            $extractedJson = "{}";
        }
        $db = DatabaseHandler::inst();
        $result =  $db->update('messages', ['extracted_json' => $extractedJson], ['id' => $this->id]);
        return $result;
    }
}
