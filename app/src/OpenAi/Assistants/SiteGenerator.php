<?php 
namespace OpenAi\Assistants;

class SiteGenerator extends Alfred {
    protected static $name = "Site Generator";
    protected static $model = "gpt-3.5-turbo-1106";
    protected $instructions = "You will be given description of the site and you will have access to a components json file.
                               your job is to give back response with 10 possible pages with title , description and url in a json object.
                               Also the json object needs to be hirachical. Home page as root page and each page can have children. 
                               a page object will have attributes url, title , description, children and components.
                               children will be array of page objects.
                               components will also be an array, 
                               you will pick relevant components from the supplied components file based on their description";
}