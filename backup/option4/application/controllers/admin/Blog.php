<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Blog extends CI_Controller {

    public $_module_name;
    public $_module;
    public $_moduleImagePath;
    public $_view_path;

    function __construct() {

        parent::__construct();
        // load specific model
        $this->load->model('admin/jilancollection_model');

        $this->load->library('file_processing');
        $this->_module_name = 'Jilan Blogs';
        $this->_module = 'admin/blog';
        $this->_view_path = 'admin/blog';

        if (!loginCheck()) {
            $this->session->set_userdata('return_url', current_url()); // set the last visit page
            $this->session->set_flashdata('success_msg', 'Please Login First !!');
            redirect(admin_url('auth/login'));
        }
    }

    public function index($id = false) {

        // set the page name
        $data['module'] = $this->_module;
        $data['pageGroup'] = $this->_module_name;
        $data['pageTitle'] = "Manage " . $this->_module_name;
        $data['moduleImagePath'] = $this->_moduleImagePath;

        $data['tabActive'] = "blog";
        $data['subTabActive'] = "blog_manage";

        // get the all information
        $data['allData'] = $this->global_model->get("blogs");
        // load the views
        $data['required_contents'] = $this->load->view($this->_view_path . '/manage', $data, TRUE);
        $this->load->view('admin/admin_master', $data);
    }

    public function add() {

        $data = array();
        $data['tabActive'] = "blog";
        $data['subTabActive'] = "blog_add";

        if ($this->input->post('submit')) {

            $this->form_validation
                    ->set_rules('title', 'Title', 'trim|required')
                    ->set_rules('summary', 'Summary', 'trim')
                    ->set_rules('description', 'Description', 'trim');

            if ($this->form_validation->run()) {
                $addData['title'] = $this->input->post('title');
                $addData['summary'] = $this->input->post('summary');
                $addData['description'] = $this->input->post('description');
                $addData['created'] = date('Y-m-d H:i:s');

                if ($typeid = $this->global_model->insertData('blogs',$addData)) {

                    $this->singlePhotoUpload($typeid);

                    $this->session->set_flashdata('success_msg', 'New Jilan Blog Added Successfully !');
                    redirect(admin_url('blog'));
                } else {
                    $data['error'] = mysql_error();
                }
            } else {
                $data['error'] = validation_errors();
            }
        }
        $data['required_contents'] = $this->load->view($this->_view_path . '/create', $data, TRUE);
        $this->load->view('admin/admin_master', $data);
    }

    public function update($id = false) {

        $data = array();
        $data['tabActive'] = "blog";
        $data['subTabActive'] = "blog_add";
        $data['id'] = $id;
        $data['blog'] = $this->global_model->getOnlyRow("blogs",['id'=>$id]);
        if ($this->input->post('submit')) {

            $this->form_validation
                ->set_rules('title', 'Title', 'trim|required')
                ->set_rules('summary', 'Summary', 'trim')
                ->set_rules('image', 'Images', 'callback_file_validate[no.jilancollection_images.jpg,jpeg,gif,png]')
                ->set_rules('description', 'Description', 'trim');

            if ($this->form_validation->run()) {
                $id = $this->input->post('id');
                $addData['title'] = $this->input->post('title');
                $addData['summary'] = $this->input->post('summary');
                $addData['description'] = $this->input->post('description');
                $addData['modified'] = date('Y-m-d H:i:s');

                if ($this->global_model->update('blogs',$addData,['id'=>$id])) {

                    if(!empty($_FILES['image']['name'])) {
                        $this->global_model->delete("media",['typeid'=>$id,'type'=>'blog']);
                        $this->singlePhotoUpload($id);
                    }

                    $this->session->set_flashdata('success_msg', 'New Jilan Blog Updated Successfully !');
                    redirect(admin_url('blog'));
                } else {
                    $data['error'] = mysql_error();
                }
            } else {
                $data['error'] = validation_errors();
            }
        }

        $data['required_contents'] = $this->load->view($this->_view_path . '/update', $data, TRUE);
        $this->load->view('admin/admin_master', $data);
    }

    public function view($id) {

        $data['module'] = $this->_module;
        $data['pageGroup'] = $this->_module_name;
        $blog = $this->global_model->getOnlyRow("blogs",['id'=>$id]);
        $data['blog'] = $blog;
        $data['pageTitle'] = "View of " . $blog->title;
        $data['tabActive'] = "blog";
        $data['subTabActive'] = "blog_manage";

        //Check data
        if (empty($blog)) {
            $this->session->set_flashdata('error_msg', 'No data found!!');
            redirect($this->module);
        }

        // load the views
        $data['required_contents'] = $this->load->view($this->_view_path . '/view', $data, TRUE);
        $this->load->view('admin/admin_master', $data);
    }

    public function delete($id) {
        // delete the album
        if ($this->global_model->delete('blogs', array('id' => $id))) {
            $this->session->set_flashdata('success_msg', 'Item Deleted Successfully !!');
            redirect(admin_url('blog'));
        }
    }

    // delete single photo of a album
    public function delete_photo($photoid, $typeid) {
        // get the specfic recoed item
        $item = $this->global_model->get_data('media', array('id' => $photoid, 'typeid' => $typeid));

        if ($this->file_processing->delete_multiple($item['images'], $this->_moduleImagePath)) {
            // delete the record from database
            if ($this->global_model->delete('media', array('id' => $photoid))) {
                if (file_exists('assets/media/jilancollection/' . $item['images'])) {
                    unlink('assets/media/jilancollection/' . $item['images']);
                    unlink('assets/media/jilancollection/thumbs/' . $item['images']);
                    unlink('assets/media/jilancollection/original/' . $item['images']);
                    unlink('assets/media/jilancollection/home/' . $item['images']);
                }
                $this->session->set_flashdata('success_msg', '1 Item Delete Successfully !!');
                redirect(admin_url('jilancollection/update/' . $typeid));
            }
        }
    }
    
    public function deletePhotoDashboard($photoid, $typeid) {
        // get the specfic recoed item
        $item = $this->global_model->get_data('media', array('id' => $photoid, 'typeid' => $typeid));

        if ($this->file_processing->delete_multiple($item['images'], $this->_moduleImagePath)) {
            // delete the record from database
            if ($this->global_model->delete('media', array('id' => $photoid))) {
                if (file_exists('assets/media/jilancollection/' . $item['images'])) {
                    unlink('assets/media/jilancollection/' . $item['images']);
                    unlink('assets/media/jilancollection/thumbs/' . $item['images']);
                    unlink('assets/media/jilancollection/original/' . $item['images']);
                    unlink('assets/media/jilancollection/home/' . $item['images']);
                }
                $this->session->set_flashdata('success_msg', '1 Item Delete Successfully !!');
                redirect(admin_url());
            }
        }
    }

    // file validation
    public function file_validate($fieldValue, $params) {
        // get the parameter as variable
        list($require, $fieldName, $type) = explode('.', $params);

        // get the type as array
        $types = explode(',', $type);

        // get the file field name
        $filename = $_FILES[$fieldName]['name'];

        if (is_array($filename)) {
            // filter the array
            $filename = array_filter($filename);

            if (count($filename) == 0 && $require == 'yes') {
                $this->form_validation->set_message('file_validate', 'The %s field is required');
                return FALSE;
            } elseif ($type != '' && count($filename) != 0) {
                foreach ($filename as $aFile) {
                    // get the extention
                    $ext = strtolower(substr(strrchr($aFile, '.'), 1));

                    if (!in_array($ext, $types)) {
                        $this->form_validation->set_message('file_validate', 'The %s field must be ' . implode(' OR ', $types) . ' !!');
                        return FALSE;
                    }
                }
                return true;
            } else {
                return TRUE;
            }
        } else {
            if ($filename == '' && $require == 'yes') {
                $this->form_validation->set_message('file_validate', 'The %s field is required');
                return FALSE;
            } elseif ($type != '' && $filename != '') {
                // get the extention
                $ext = strtolower(substr(strrchr($filename, '.'), 1));

                if (!in_array($ext, $types)) {
                    $this->form_validation->set_message('file_validate', 'The %s field must be ' . implode(' OR ', $types) . ' !!');
                    return FALSE;
                }
            } else
                return TRUE;
        }
    }

    private function singlePhotoUpload($typeId = 0) {

        $photoCount = array();

        // filter the array
        $mainPhotos = array_filter($_FILES['image']);

        // populate the single File field 
        $_FILES['photo']['name'] = $mainPhotos['name'];
        $_FILES['photo']['type'] = $mainPhotos['type'];
        $_FILES['photo']['tmp_name'] = $mainPhotos['tmp_name'];
        $_FILES['photo']['size'] = $mainPhotos['size'];

        // generate the photo name
        $imageName = time();

        // upload photo
        $photo = $this->file_processing->image_upload('photo', './assets/media/blog/original/', 'size[1100,99999]', 'jpg|jpeg|png|gif', $imageName);

        $ini_path = './assets/media/blog/original/' . $photo;
        $main_path = './assets/media/blog/' . $photo; // main image path
        $thumbs_path = './assets/media/blog/thumbs/' . $photo; // thumbs path
        $home_thumbs_path = './assets/media/blog/home/' . $photo; // resize home thumbs
        // resizing the image
        img_resize($ini_path, $main_path, array('width' => 800, 'height' => 400)); // original
        img_resize($ini_path, $thumbs_path, array('width' => 405, 'height' => 213)); // resize with thumbs
        img_resize($ini_path, $home_thumbs_path, array('width' => 370, 'height' => 476)); // resized thumbs home path

//        $caption = $this->input->post('caption');
//        $imageDetails = $this->input->post('image_details');

        //generate the photo data
        $photoData = array(
            'typeid' => $typeId,
            'images' => $photo,
            'title' => 'Blog Title',
            'image_details' => 'Blog Details', // image details
            'type' => 'blog',
            'created' => date('Y-m-d H:i:s')
        );

        $this->global_model->saveNewMedia($photoData);
        $photoCount[] = array('typeid' => $typeId);

        if (count($photoCount)) {
            return true;
        } else {
            return true;
        }
    }

    private function multiplePhotoUploadForCollectionUpdate($typeId = 0) {

        $photoCount = array();

        // generate the photo name
        $photo_name = time();

        // filter the array
        $allFiles = array_filter($_FILES['jilancollection_images']['name']);

        // save the photo of album
        foreach ($allFiles as $key => $aPhoto) {
            // populate the single File field 
            $_FILES['photo']['name'] = $_FILES['jilancollection_images']['name'][$key];
            $_FILES['photo']['type'] = $_FILES['jilancollection_images']['type'][$key];
            $_FILES['photo']['tmp_name'] = $_FILES['jilancollection_images']['tmp_name'][$key];
            $_FILES['photo']['size'] = $_FILES['jilancollection_images']['size'][$key];
            $_FILES['photo']['error'] = $_FILES['jilancollection_images']['error'][$key];

            $imageName = $photo_name . "_" . $key;
            // upload photo
            $photo = $this->file_processing->image_upload('photo', './assets/media/jilancollection/original/', 'size[1100,99999]', 'jpg|jpeg|png|gif', $imageName);

            $ini_path = './assets/media/jilancollection/original/' . $photo; // original image path
            $main_path = './assets/media/jilancollection/' . $photo; // main image path
            $thumbs_path = './assets/media/jilancollection/thumbs/' . $photo; // resized thumbs path
            $home_thumbs_path = './assets/media/jilancollection/home/' . $photo; // resized home image path

            img_resize($ini_path, $main_path, array('width' => 935, 'height' => 553));
            img_resize($ini_path, $thumbs_path, array('width' => 274, 'height' => 444)); // resize with thumbs
            img_resize($ini_path, $home_thumbs_path, array('width' => 370, 'height' => 476)); // home image

            $caption = $this->input->post('caption');
            $imageDetails = $this->input->post('image_details');

            //generate the photo data
            $photoData = array(
                'typeid' => $typeId,
                'images' => $photo,
                'title' => $caption[$key],
                'image_details' => $imageDetails[$key],
                'type' => 'jilancollection',
                'created' => date('Y-m-d H:i:s')
            );

            $this->global_model->saveNewMedia($photoData);
            $photoCount[] = array('typeid' => $typeId);
        }
        if (count($photoCount)) {
            return true;
        } else {
            return true;
        }
    }

}

/* End of file Jilancollection.php */
/* Location: ./application/controllers/admin/Jilancollection.php */