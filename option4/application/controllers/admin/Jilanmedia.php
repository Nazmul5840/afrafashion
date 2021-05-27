<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Jilanmedia extends CI_Controller {

    public $_module_name;
    public $_module;
    public $_moduleImagePath;
    public $_moduleVideoPath;
    public $_view_path;

    function __construct() {

        parent::__construct();
        // load specific model
        $this->load->model('admin/jilanmedia_model');
        $this->load->model('admin/JilanmediaCat_model', 'jilanmediacat');

        $this->load->library('file_processing');
        $this->_module_name = 'Jilanmedia';
        $this->_module = 'admin/jilanmedia';
        $this->_view_path = 'admin/jilan_media';
        $this->_moduleVideoPath = 'assets/media/jilanmedia/videos/';

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
        $data['allData'] = $this->jilanmedia_model->getAllCollectionData();

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
                    ->set_rules('video_name', 'Video', 'callback_file_validate[no.video_name.mp4,3gp,mpeg,mpg,mkv]')
                    ->set_rules('jilanmedia_images', 'Images', 'callback_file_validate[no.jilanmedia_images.jpg,jpeg,gif,png]')
            ;

            if ($this->form_validation->run()) {
//                pr($_FILES);
                $addData['category_id'] = $categoryId = $this->input->post('category');
                $addData['title'] = $this->input->post('title');
                $addData['created'] = date('Y-m-d H:i:s');

                //Video File Upload
                if ($_FILES['video_name']['name']) {
                    $generateFileName = time();
                    $path = './' . $this->_moduleVideoPath;
                    $fileName = $this->videoFileUpload('video_name', $generateFileName, $path, 'mp4|3gp|mpeg|mpg|mkv', 5120);
                    if (!empty($fileName)) {
                        $addData['video_name'] = $fileName['upload_data']['file_name'];
                    } else {
                        $data['error'] = $fileName['error'];
                    }
                }


                if ($this->jilanmedia_model->create($addData)) {
                    $typeId = $this->db->insert_id();

                    $getParentIds = $this->jilanmediacat->lookingForParentIds($categoryId);

                    if (!empty($getParentIds)) {
                        foreach ($getParentIds as $key => $parentId) {
                            $parentData = array(
                                'product_id' => $typeId,
                                'category_ids' => $parentId,
                                'created' => date('Y-m-d H:i:s')
                            );
                            $this->db->insert('jilanmedia_relation', $parentData);
                        }
                    }

                    if (!empty($_FILES['jilanmedia_images']['name'])) {
                        $this->multiplePhotoUpload($typeId);
                    }

                    $this->session->set_flashdata('success_msg', 'New Media Added Successfully !');
                    redirect(admin_url('jilanmedia'));

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

        $data['allData'] = $allData = $this->jilanmedia_model->getSingleInfo($id);
        $data['photos'] = $photos = $this->global_model->get('media', array('typeid' => $id, 'type' => 'jilanmedia'));

        if ($this->input->post('submit')) {
            // write the validation rule
            $this->form_validation
                    ->set_rules('category', 'Category', 'trim|required')
                    ->set_rules('title', 'Title', 'trim|required')
                    ->set_rules('video_name', 'Video', 'callback_file_validate[no.video_name.mp4,3gp,mpeg,mpg,mkv]')
                    ->set_rules('jilanmedia_images', 'Images', 'callback_file_validate[no.jilanmedia_images.jpg,jpeg,gif,png]')
            ;

            // check the validation
            if ($this->form_validation->run()) {
                $addData['category_id'] = $categoryId = $this->input->post('category');
                $addData['title'] = $this->input->post('title');

                $captionOld = $this->input->post('caption_old');
                $imageDetailsOld = $this->input->post('image_details_old');

                //Video File Upload
                if ($_FILES['video_name']['name']) {
                    $generateFileName = time();
                    $path = './' . $this->_moduleVideoPath;
                    $fileName = $this->videoFileUpload('video_name', $generateFileName, $path, 'mp4|3gp|mpeg|mpg|mkv', 5120);
                    if (!empty($fileName)) {
                        $addData['video_name'] = $fileName['upload_data']['file_name'];
                    } else {
                        $data['error'] = $fileName['error'];
                    }
                }

                if (!empty($photos)) {
                    foreach ($photos as $key => $photo) {

                        $photoData = array(
                            'typeid' => $photo->typeid,
                            'title' => $captionOld[$key],
                            'image_details' => $imageDetailsOld[$key], // image details
                        );
                        $this->global_model->update('media', $photoData, array('id' => $photo->id));
                    }
                }

                if ($this->jilanmedia_model->update($addData, $id)) {

                    if (array_filter($_FILES['jilanmedia_images']['name'])) {
                        $this->multiplePhotoUpload($id);
                    }

                    // checking product relation exist or not
                    if ($this->global_model->getJilanmediaRelationsByProductId($id)) {

                        // if exists then just delete old product relation data
                        $this->global_model->delete('jilanmedia_relation', array('product_id' => $id));

                        $typeId = $allData->jilanmedia_id;
                        $getParentIds = $this->jilanmediacat->lookingForParentIds($categoryId);

                        if (!empty($getParentIds)) {
                            foreach ($getParentIds as $key => $parentId) {
                                // new relation params
                                $parentData = array(
                                    'product_id' => $typeId,
                                    'category_ids' => $parentId,
                                    'created' => date('Y-m-d H:i:s')
                                );
                                // insert new relation data
                                $this->db->insert('jilanmedia_relation', $parentData);
                            }
                        }
                    }

                    $this->session->set_flashdata('success_msg', 'Updated Successfully !');
                    redirect(admin_url('jilanmedia'));
                }
            }
        }

        $data['required_contents'] = $this->load->view($this->_view_path . '/update', $data, TRUE);
        $this->load->view('admin/admin_master', $data);
    }

    private function videoFileUpload($fieldName, $fileName, $path, $type, $size) {

        $config['file_name'] = $fileName;
        $config['upload_path'] = $path;
        $config['allowed_types'] = $type;
        $config['max_size'] = $size;
        $config['max_width'] = 0; // 0 has no limit
        $config['max_height'] = 0; // 0 has no limit
        $this->load->library('upload');
        $this->upload->initialize($config);
        unset($config);

        if (!$this->upload->do_upload($fieldName)) {
            return array(
                'status' => 0,
                'error' => $this->upload->display_errors()
            );
        } else {
            return array(
                'status' => 1,
                'upload_data' => $this->upload->data()
            );
        }
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

    public function delete($id) {

        // get the specfic recoed item
        $allPhotos = $this->global_model->get('media', array('typeid' => $id, 'type' => 'jilanmedia'));

        // if exists then just delete old product relation data
        $this->global_model->delete('jilanmedia_relation', array('product_id' => $id));

        if (!empty($allPhotos)) {
            foreach ($allPhotos as $photo) {

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
                $this->session->set_flashdata('success_msg', 'Item Deleted Successfully !!');
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

    private function multiplePhotoUpload($typeId = 0) {

        $photoCount = array();

        // generate the photo name
        $photo_name = time();

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

            $ini_path = './assets/media/jilanmedia/original/' . $photo; // original image path
            $main_path = './assets/media/jilanmedia/' . $photo; // main image path
            $thumbs_path = './assets/media/jilanmedia/thumbs/' . $photo; // resized thumbs path
            $home_thumbs_path = './assets/media/jilanmedia/home/' . $photo; // resized home image path

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

    private function singlePhotoUpload($typeId = 0) {

        $photoCount = array();

        // filter the array
        $mainPhotos = array_filter($_FILES['jilanmedia_images']);

        // populate the single File field 
        $_FILES['photo']['name'] = $mainPhotos['name'];
        $_FILES['photo']['type'] = $mainPhotos['type'];
        $_FILES['photo']['tmp_name'] = $mainPhotos['tmp_name'];
        $_FILES['photo']['size'] = $mainPhotos['size'];

        // generate the photo name
        $imageName = time();

        // upload photo
        $photo = $this->file_processing->image_upload('photo', './assets/media/jilanmedia/original/', 'size[1100,99999]', 'jpg|jpeg|png|gif', $imageName);

        $ini_path = './assets/media/jilanmedia/original/' . $photo;
        $main_path = './assets/media/jilanmedia/' . $photo; // main image path
        $thumbs_path = './assets/media/jilanmedia/thumbs/' . $photo; // thumbs path
        $home_thumbs_path = './assets/media/jilanmedia/home/' . $photo; // resize home thumbs
        // resizing the image
        img_resize($ini_path, $main_path, array('width' => 935, 'height' => 553)); // original
        img_resize($ini_path, $thumbs_path, array('width' => 274, 'height' => 444)); // resize with thumbs            
        img_resize($ini_path, $home_thumbs_path, array('width' => 370, 'height' => 476)); // resized thumbs home path

        $caption = $this->input->post('caption');
        $imageDetails = $this->input->post('image_details');

        //generate the photo data
        $photoData = array(
            'typeid' => $typeId,
            'images' => $photo,
            'title' => $caption,
            'image_details' => $imageDetails, // image details
            'type' => 'jilanmedia',
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

    public function delete_video($activitiesId) {

        // delete related videos
        $videoData = $this->global_model->getOnlyRow('jilanmedia', array('jilanmedia_id' => $activitiesId));
        if (file_exists($this->_moduleVideoPath . $videoData->video_name)) {
            unlink($this->_moduleVideoPath . $videoData->video_name);
        }

        $updateData = array('video_name' => NULL);
        $this->global_model->update('jilanmedia', $updateData, array('activities_id' => $activitiesId));

        $this->session->set_flashdata('success_msg', 'Item Deleted Successfully !!');
        redirect(admin_url($this->_module . '/update/' . $activitiesId));
    }

}

/* End of file Jilanmedia.php */
/* Location: ./application/controllers/admin/Jilanmedia.php */

