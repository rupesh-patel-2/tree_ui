<?php 
namespace OpenAi\Traits;

trait Common {
    public static function getExtraHeaers(){
        return [
            'OpenAI-Beta: assistants=v1'
        ];
    }
}