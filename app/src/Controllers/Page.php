<?php

namespace Controllers;

use Core\DatabaseHandler;
use Models\PageComponentModel;
use Models\PageModel;

class Page
{

    public static function add()
    {
        $data = [
            'name'      => $_POST['name'],
            'slug'      => self::generateSlug($_POST['name']),
            'site_id'   => $_POST['site_id'],
            'uuid'      => DatabaseHandler::generateUUId()
        ];
        $page = new PageModel();
        $res = $page->add($data);
        if ($res) {
            return [
                'code' => 200,
                'message' => 'Page has been added successfully'
            ];
        } else {
            return [
                'code' => 400,
                'message' => 'Page failed to add'
            ];
        }
    }

    public static function edit()
    {
        $data = [
            'name' => $_POST['name'],
            'slug' => self::generateSlug($_POST['name']),
            'uuid' => $_POST['uuid'],
        ];
        $page = new PageModel();
        $res = $page->edit($data);
        if ($res) {
            return [
                'code' => 200,
                'message' => 'Page has been updated successfully'
            ];
        } else {
            return [
                'code' => 400,
                'message' => 'Page failed to update'
            ];
        }
    }

    public static function generateSlug($slug)
    {
        return strtolower(trim(preg_replace('/[^A-Za-z0-9-]+/', '-', $slug)));
    }

    public static function addComponent()
    {
        $data = [
            'page_id'        => $_POST['page_id'],
            'component_id'   => $_POST['component_id'],
        ];
        $pageComponent = new PageComponentModel();
        $res = $pageComponent->add($data);
        if ($res) {
            return [
                'code' => 200,
                'message' => 'Component has been added successfully'
            ];
        } else {
            return [
                'code' => 400,
                'message' => 'Component failed to add'
            ];
        }
    }

    public static function listComponents()
    {
        $data = [
            'page_id'        => $_POST['page_id'],
        ];
        $pageComponent = new PageComponentModel();
        $res = $pageComponent->list($data);
        if ($res) {
            return [
                'code' => 200,
                'message' => 'List of Components',
                'data' => $res
            ];
        } else {
            return [
                'code' => 400,
                'message' => 'No Component is attached to the page'
            ];
        }
    }

    public static function removeComponent()
    {
        $data = [
            'page_id'        => $_POST['page_id'],
            'component_id'   => $_POST['component_id'],
        ];
        $pageComponent = new PageComponentModel();
        $res = $pageComponent->remove($data);
        if ($res) {
            return [
                'code' => 200,
                'message' => 'Component detached successfully',
            ];
        } else {
            return [
                'code' => 400,
                'message' => 'Component failed to detach'
            ];
        }
    }
}
