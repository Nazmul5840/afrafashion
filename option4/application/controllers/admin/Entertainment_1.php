<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Entertainment extends CI_Controller {

    public $_module_name;
    public $_module;
    public $_moduleImagePath;
    public $_view_path;

    function __construct() {

        parent::__construct();
        // load specific model
        $this->load->model('admin/entertainment_model');

        $this->load->library('file_processing');
        $this->_module_name = 'Entertainment';
        $this->_module = 'admin/entertainment';
        $this->_view_path = 'admin/entertainment';

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

        $data['tabActive'] = "entertainment";
        $data['subTabActive'] = "entertainment_manage";

        // get the all information
        $data['allData'] = $this->entertainment_model->getAllEntertainmentData();

        // load the views
        $data['required_contents'] = $this->load->view($this->_view_path . '/manage', $data, TRUE);
        $this->load->view('admin/admin_master', $data);
    }

    public function add() {

        $data = array();
        $data['tabActive'] = "entertainment";
        $data['subTabActive'] = "entertainment_add";

        if ($this->input->post('submit')) {

            $this->form_validation
                    ->set_rules('category', 'Category', 'trim|required')
                    ->set_rules('title', 'Title', 'trim|required')
                    ->set_rules('entertainment_images', 'Images', 'callback_file_validate[no.entertainment_images.jpg,jpeg,gif,png]')
            ;

            if ($this->form_validation->run()) {

                $addData['category_id'] = $this->input->post('category');
                $addData['title'] = $this->input->post('title');
                $addData['description'] = $this->input->post('description');
                $addData['created'] = date('Y-m-d H:i:s');

                if ($this->entertainment_model->create($addData)) {
                    $typeId = $this->db->insert_id();
                    if ($this->photoUpload($typeId)) {
                        $this->session->set_flashdata('success_msg', 'New Entertainment Page Added Successfully !');
                        redirect(admin_url('entertainment'));
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

        $data['tabActive'] = "entertainment";
        $data['subTabActive'] = "entertainment_manage";

        $data['allData'] = $this->entertainment_model->getSingleInfo($id);
        $data['photos'] = $photos = $this->global_model->get('media', array('typeid' => $id, 'type' => 'entertainment'));

        if ($this->input->post('submit')) {
            // write the validation rule
            $this->form_validation
                    ->set_rules('category', 'Category', 'trim|required')
                    ->set_rules('title', 'Title', 'trim|required')
                    ->set_rules('entertainment_images', 'Images', 'callback_file_validate[no.entertainment_images.jpg,jpeg,gif,png]')
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
                            'title' => $caption[$key],
                        );
                        $this->global_model->update('media', $photo_data, array('id' => $photo->id));
                    }
                }

                if ($this->entertainment_model->update($addData, $id)) {
                    if (array_filter($_FILES['entertainment_images']['name'])) {
                        $this->photoUpload($id);
                    }

                    $this->session->set_flashdata('success_msg', 'Entertainment Updated Successfully !');
                    redirect(admin_url('entertainment'));
                }
            }
        }

        $data['required_contents'] = $this->load->view($this->_view_path . '/update', $data, TRUE);
        $this->load->view('admin/admin_master', $data);
    }

    public function view($id) {

        $data['module'] = $this->_module;
        $data['pageGroup'] = $this->_module_name;
        $data['get_info'] = $this->entertainment_model->getSingleInfo($id);
        $data['pageTitle'] = "View of " . $data['get_info']->title;
        $data['tabActive'] = "entertainment";
        $data['subTabActive'] = "entertainment_manage";

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
        $allFiles = array_filter($_FILES['entertainment_images']['name']);

        // save the photo of album
        foreach ($allFiles as $key => $aPhoto) {
            // populate the single File field 
            $_FILES['photo']['name'] = $_FILES['entertainment_images']['name'][$key];
            $_FILES['photo']['type'] = $_FILES['entertainment_images']['type'][$key];
            $_FILES['photo']['tmp_name'] = $_FILES['entertainment_images']['tmp_name'][$key];
            $_FILES['photo']['size'] = $_FILES['entertainment_images']['size'][$key];
            $_FILES['photo']['error'] = $_FILES['entertainment_images']['error'][$key];

            $imageName = $photo_name . "_" . $key;
            // upload photo
            $photo = $this->file_processing->image_upload('photo', './assets/media/entertainment/original/', 'size[1100,99999]', 'jpg|jpeg|png|gif', $imageName);

            $ini_path = './assets/media/entertainment/original/' . $photo; // original image path
            $main_path = './assets/media/entertainment/' . $photo; // main image path
            $thumbs_path = './assets/media/entertainment/thumbs/' . $photo; // resized thumbs path
            $home_thumbs_path = './assets/media/entertainment/home/' . $photo; // resized home image path

            img_resize($ini_path, $main_path, array('width' => 935, 'height' => 553));
            img_resize($ini_path, $thumbs_path, array('width' => 170, 'crop' => FALSE)); // thumbs
            img_resize($ini_path, $home_thumbs_path, array('width' => 370, 'height' => 476)); // home image
            //generate the photo data
            $photoData = array(
                'typeid' => $typeId,
                'images' => $photo,
                'title' => $caption[$key],
                'type' => 'entertainment',
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
        $allPhotos = $this->global_model->get('media', array('typeid' => $id, 'type' => 'entertainment'));
        if (!empty($allPhotos)) {
            foreach ($allPhotos as $photo) {
                if ($this->file_processing->delete_multiple($photo->images, './assets/media/entertainment/')) {
                    // delete the record from database
                    if ($photo->images) {
                        if ($this->global_model->delete('media', array('id' => $photo->id, 'type' => 'entertainment'))) {
                            if (file_exists('assets/media/entertainment/' . $photo->images)) {
                                unlink('assets/media/entertainment/' . $photo->images);
                            }
                            if (file_exists('assets/media/entertainment/thumbs/' . $photo->images)) {
                                unlink('assets/media/entertainment/thumbs/' . $photo->images);
                            }
                            if (file_exists('assets/media/entertainment/original/' . $photo->images)) {
                                unlink('assets/media/entertainment/original/' . $photo->images);
                            }
                            if (file_exists('assets/media/entertainment/home/' . $photo->images)) {
                                unlink('assets/media/entertainment/home/' . $photo->images);
                            }
                        }
                    }
                }
            }
        }

        // delete the album
        if ($this->global_model->delete('entertainment', array('entertainment_id' => $id))) {
            $this->session->set_flashdata('success_msg', 'Item Deleted Successfully !!');
            redirect(admin_url('entertainment'));
        }
    }

    // delete single photo of a album
    public function delete_photo($photoid, $typeid) {
        // get the specfic recoed item
        $item = $this->global_model->get_data('media', array('id' => $photoid, 'typeid' => $typeid));
        if ($this->file_processing->delete_multiple($item['images'], $this->_moduleImagePath)) {
            // delete the record from database
            if ($this->global_model->delete('media', array('id' => $photoid))) {
                if (file_exists('assets/media/entertainment/' . $item['images'])) {
                    unlink('assets/media/entertainment/' . $item['images']);
                    unlink('assets/media/entertainment/thumbs/' . $item['images']);
                    unlink('assets/media/entertainment/original/' . $item['images']);
                    unlink('assets/media/entertainment/home/' . $item['images']);
                }
                $this->session->set_flashdata('success_msg', '1 Item Delete Successfully !!');
                redirect(admin_url('entertainment/update/' . $typeid));
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

/* End of file Entertainment.php */
/* Location: ./application/controllers/admin/Entertainment.php */

