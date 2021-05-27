<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Jilanmedia extends CI_Controller {

    public $_module_name;
    public $_module;
    public $_moduleImagePath;
    public $_view_path;

    function __construct() {

        parent::__construct();
        // load specific model
        $this->load->model('admin/jilanmedia_model');

        $this->load->library('file_processing');
        $this->_module_name = 'Jilanmedia';
        $this->_module = 'admin/jilanmedia';
        $this->_view_path = 'admin/jilan_media';

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

        $data['tabActive'] = "jilanmedia";
        $data['subTabActive'] = "jilanmedia_manage";

        // get the all information
        $data['allData'] = $this->jilanmedia_model->getAllJilanMediaData();

        // load the views
        $data['required_contents'] = $this->load->view($this->_view_path . '/manage', $data, TRUE);
        $this->load->view('admin/admin_master', $data);
    }

    public function add() {

        $data = array();
        $data['tabActive'] = "jilanmedia";
        $data['subTabActive'] = "jilanmedia_add";

        if ($this->input->post('submit')) {

            $this->form_validation
                    ->set_rules('category', 'Category', 'trim|required')
                    ->set_rules('title', 'Title', 'trim|required')
                    ->set_rules('jilanmedia_images', 'Category Images', 'callback_file_validate[no.jilanmedia_images.jpg,jpeg,gif,png]')
            ;

            if ($this->form_validation->run()) {

                $addData['category_id'] = $this->input->post('category');
                $addData['title'] = $this->input->post('title');
                $addData['description'] = $this->input->post('description');
                $addData['created'] = date('Y-m-d H:i:s');

                if ($this->jilanmedia_model->create($addData)) {
                    $typeId = $this->db->insert_id();

                    if ($this->photoUpload($typeId)) {
                        $this->session->set_flashdata('success_msg', 'New Jilan Media Page Added Successfully !');
                        redirect(admin_url('jilanmedia'));
                    }
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

        $data['tabActive'] = "jilanmedia";
        $data['subTabActive'] = "jilanmedia_manage";

        $data['allData'] = $this->jilanmedia_model->getSingleInfo($id);
        $data['photos'] = $photos = $this->global_model->get('media', array('typeid' => $id, 'type' => 'jilanmedia'));

        if ($this->input->post('submit')) {
            // write the validation rule
            $this->form_validation
                    ->set_rules('category', 'Category', 'trim|required')
                    ->set_rules('title', 'Title', 'trim|required')
                    ->set_rules('jilanmedia_images', 'Category Images', 'callback_file_validate[no.jilanmedia_images.jpg,jpeg,gif,png]')
            ;

            // check the validation
            if ($this->form_validation->run()) {
                $addData['category_id'] = $this->input->post('category');
                $addData['title'] = $this->input->post('title');
                $addData['description'] = $this->input->post('description');

                $caption = $this->input->post('caption_old');

                if (!empty($photos)) {
                    foreach ($photos as $key => $photo) {
                        $photo_data = array(
                            'typeid' => $photo->typeid,
                            'title' => $caption[$key]
                        );
                        $this->global_model->update('media', $photo_data, array('id' => $photo->id));
                    }
                }
                if ($this->jilanmedia_model->update($addData, $id)) {
                    if (array_filter($_FILES['jilanmedia_images']['name'])) {
                        $this->photoUpload($id);
                    }

                    $this->session->set_flashdata('success_msg', 'Jilan Media Updated Successfully !');
                    redirect(admin_url('jilanmedia'));
                }
            }
        }

        $data['required_contents'] = $this->load->view($this->_view_path . '/update', $data, TRUE);
        $this->load->view('admin/admin_master', $data);
    }

    public function view($id) {

        $data['module'] = $this->_module;
        $data['pageGroup'] = $this->_module_name;
        $data['get_info'] = $this->jilanmedia_model->getSingleInfo($id);
        $data['pageTitle'] = "View of " . $data['get_info']->title;
        $data['tabActive'] = "jilanmedia";
        $data['subTabActive'] = "jilanmedia_manage";

        //Check data
        if (empty($data['get_info'])) {
            $this->session->set_flashdata('error_msg', 'No data found!!');
            redirect($this->module);
        }

        // load the views
        $data['required_contents'] = $this->load->view($this->_view_path . '/view', $data, TRUE);
        $this->load->view('admin/admin_master', $data);
    }

    private function photoUpload($typeId = 0) {

        $photoCount = array();

        $caption = !empty($this->input->post('caption_old')) ? $this->input->post('caption_old') : $this->input->post('caption');

        // generate the photo name
        $photo_name = time();

        //photo table array
        $photo_data = array();
        // filter the array
        $allFiles = array_filter($_FILES['jilanmedia_images']['name']);

        // save the photo of album
        foreach ($allFiles as $key => $aPhoto) {
            // populate the single File field 
            $_FILES['photo']['name'] = $_FILES['jilanmedia_images']['name'][$key];
            $_FILES['photo']['type'] = $_FILES['jilanmedia_images']['type'][$key];
            $_FILES['photo']['tmp_name'] = $_FILES['jilanmedia_images']['tmp_name'][$key];
            $_FILES['photo']['size'] = $_FILES['jilanmedia_images']['size'][$key];
            $_FILES['photo']['error'] = $_FILES['jilanmedia_images']['error'][$key];

            $imageName = $photo_name . "_" . $key;

            // upload photo
            $photo = $this->file_processing->image_upload('photo', './assets/media/jilanmedia/original/', 'size[1100,99999]', 'jpg|jpeg|png|gif', $imageName);

            $ini_path = './assets/media/jilanmedia/original/' . $photo; // original
            $main_path = './assets/media/jilanmedia/' . $photo; // main image path
            $thumbs_path = './assets/media/jilanmedia/thumbs/' . $photo; // resized thumbs path
            $home_thumbs_path = './assets/media/jilanmedia/home/' . $photo; // resized thumbs home path

            img_resize($ini_path, $main_path, array('width' => 935, 'height' => 553));
            img_resize($ini_path, $thumbs_path, array('width' => 275, 'crop' => FALSE)); // resized thumbs path            
            img_resize($ini_path, $home_thumbs_path, array('width' => 370, 'height' => 476)); // resized thumbs home path
            //generate the photo data
            $photoData = array(
                'typeid' => $typeId,
                'images' => $photo,
                'title' => $caption[$key],
                'type' => 'jilanmedia',
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

    public function delete($id) {

        // get the specfic recoed item
        $allPhotos = $this->global_model->get('media', array('typeid' => $id, 'type' => 'jilanmedia'));

        if (!empty($allPhotos)) {
            foreach ($allPhotos as $photo) {
                if ($this->file_processing->delete_multiple($photo->images, './assets/media/jilanmedia/')) {
                    // delete the record from database
                    if ($photo->images) {
                        if ($this->global_model->delete('media', array('id' => $photo->id, 'type' => 'jilanmedia'))) {
                            if (file_exists('assets/media/jilanmedia/' . $photo->images)) {
                                unlink('assets/media/jilanmedia/' . $photo->images);
                            }
                            if (file_exists('assets/media/jilanmedia/thumbs/' . $photo->images)) {
                                unlink('assets/media/jilanmedia/thumbs/' . $photo->images);
                            }
                            if (file_exists('assets/media/jilanmedia/original/' . $photo->images)) {
                                unlink('assets/media/jilanmedia/original/' . $photo->images);
                            }

                            if (file_exists('assets/media/jilanmedia/home/' . $photo->images)) {
                                unlink('assets/media/jilanmedia/home/' . $photo->images);
                            }
                        }
                    }
                }
            }
        }

        // delete the album
        if ($this->global_model->delete('jilanmedia', array('jilanmedia_id' => $id))) {
            $this->session->set_flashdata('success_msg', 'Item Deleted Successfully !!');
            redirect(admin_url('jilanmedia'));
        }
    }

    // delete single photo of a album
    public function delete_photo($photoid, $typeid) {
        // get the specfic recoed item
        $item = $this->global_model->get_data('media', array('id' => $photoid, 'typeid' => $typeid));

        if ($this->file_processing->delete_multiple($item['images'], $this->_moduleImagePath)) {
            // delete the record from database
            if ($this->global_model->delete('media', array('id' => $photoid))) {
                if (file_exists('assets/media/jilanmedia/' . $item['images'])) {
                    unlink('assets/media/jilanmedia/' . $item['images']);
                    unlink('assets/media/jilanmedia/thumbs/' . $item['images']);
                    unlink('assets/media/jilanmedia/original/' . $item['images']);
                    unlink('assets/media/jilanmedia/home/' . $item['images']);
                }
                $this->session->set_flashdata('success_msg', '1 Item Delete Successfully !!');
                redirect(admin_url('jilanmedia/update/' . $typeid));
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

}

/* End of file Jilanmedia.php */
/* Location: ./application/controllers/admin/Jilanmedia.php */