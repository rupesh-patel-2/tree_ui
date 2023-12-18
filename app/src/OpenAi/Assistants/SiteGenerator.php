<?php 
namespace OpenAi\Assistants;

class SiteGenerator extends Alfred {
    protected static $name = "Site Generator";
    protected static $model = "gpt-3.5-turbo-1106";
    protected $instructions = "You will be given description of the site.
                               your job is to give back response with 10 possible pages with title , description and url in a json object.
                               Also the json object needs to be hirachical. Home page as root page and each page can have children. 
                               a page object will have attributes url, title , description, children and components.
                               children will be array of page objects.
                               components will also be an array
                               You will never ask a counter question. just respond with the json file as described above.
                               A sample json response will be like {SampleJson}
                               ";
    public  function __construct() {
        $SampleJson = json_encode([
            "name" =>  "Home Page",
            "keywords" =>  ['teeth whitening', 'dental implants', 'braces', 'cosmetic dentistry'],
            "title"  =>  "Best Dentist in town",
            "url" => '/',
            "components" => [],
            "children" =>  [
                "about_us" => [
                    "name" => "About us",
                    "keywords" => [],
                    "url" => '/about-us',
                    "title" => "Delevering exelence since 10 years",
                    "children" => []
                ] 
            ]
        ]);
        $this->instructions = str_replace('{SampleJson}',$SampleJson,$this->instructions);
    }
}