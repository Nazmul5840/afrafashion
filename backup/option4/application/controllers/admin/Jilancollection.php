<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Jilancollection extends CI_Controller {

    public $_module_name;
    public $_module;
    public $_moduleImagePath;
    public $_view_path;

    function __construct() {

        parent::__construct();
        // load specific model
        $this->load->model('admin/jilancollection_model');

        $this->load->library('file_processing');
        $this->_module_name = 'Jilan Collection';
        $this->_module = 'admin/jilancollection';
        $this->_view_path = 'admin/jilan_collection';

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

        $data['tabActive'] = "jilancollection";
        $data['subTabActive'] = "jilancollection_manage";

        // get the all information
        $data['allData'] = $this->jilancollection_model->getAllCollectionData();
//        pr($data['allData']);
        $this->load->model('admin/jilancollectionCat_model');

        // load the views
        $data['required_contents'] = $this->load->view($this->_view_path . '/manage', $data, TRUE);
        $this->load->view('admin/admin_master', $data);
    }

    public function add() {

        $data = array();
        $data['tabActive'] = "jilancollection";
        $data['subTabActive'] = "jilancollection_add";

        if ($this->input->post('submit')) {

            $this->form_validation
                    ->set_rules('category', 'Category', 'trim|required')
                    ->set_rules('title', 'Title', 'trim|required')
//                    ->set_rules('price', 'Price', 'trim')
                    ->set_rules('description', 'Description', 'trim|required')
                    ->set_rules('is_popular', 'Popular', 'trim|required')
                    ->set_rules('is_featured', 'Featured', 'trim|required')
                    ->set_rules('is_latest', 'Latest', 'trim|required')
//                    ->set_rules('dimention', 'Dimention', 'trim')
//                    ->set_rules('featured', 'Featured', 'trim')
//                    ->set_rules('new_arrival', 'New Arrival', 'trim')
                    ->set_rules('cart_photo', 'Cart Photo', 'callback_file_validate[yes.cart_photo.jpg,jpeg,gif,png]')
//                    ->set_rules('jilancollection_images', 'Images', 'callback_file_validate[yes.jilancollection_images.jpg,jpeg,gif,png]')
            ;

            if ($this->form_validation->run()) {

                $photo = $this->singlePhotoUpload();

                $addData['category_id'] = $categoryId = $this->input->post('category');
                $addData['title'] = $this->input->post('title');
                $addData['is_popular'] = $this->input->post('is_popular');
                $addData['is_featured'] = $this->input->post('is_featured');
                $addData['is_latest'] = $this->input->post('is_latest');
                $addData['price'] = 0;
                $addData['dimension'] = 'no';
                $addData['featured'] = 'no';
                $addData['description'] = $this->input->post('description');
                $addData['model_size'] = 'no';
                $addData['new_arrival'] = 'no';
                $addData['created'] = date('Y-m-d H:i:s');
                $addData['cart_photo'] = $photo;

                $this->load->model('admin/jilancollectionCat_model', 'jilancollectioncat');

                if ($this->jilancollection_model->create($addData)) {
                    $typeId = $this->db->insert_id();
                    $getParentIds = $this->jilancollectioncat->lookingForParentIds($categoryId);
                    if (!empty($getParentIds)) {
                        foreach ($getParentIds as $key => $parentId) {
                            $parentData = array(
                                'product_id' => $typeId,
                                'category_ids' => $parentId,
                                'created' => date('Y-m-d H:i:s')
                            );
                            $this->db->insert('product_relation', $parentData);
                        }
                    }

                    // multiple image upload
                    if (array_filter($_FILES['jilancollection_images']['name'])) {
//                        $this->multiplePhotoUploadForCollectionUpdate($typeId);
                    }

                    $this->session->set_flashdata('success_msg', 'New Diones Collection Added Successfully !');
                    redirect(admin_url('jilancollection'));


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

        $data['tabActive'] = "jilancollection";
        $data['subTabActive'] = "jilancollection_manage";

        $data['allData'] = $allData = $this->jilancollection_model->getSingleInfo($id);
        $data['photos'] = $photos = $this->global_model->get('media', array('typeid' => $id, 'type' => 'jilancollection'));

        if ($this->input->post('submit')) {
            // write the validation rule
            $this->form_validation
                    ->set_rules('category', 'Category', 'trim|required')
                    ->set_rules('title', 'Title', 'trim|required')
//                    ->set_rules('price', 'Price', 'trim')
                    ->set_rules('description', 'Description', 'trim')
                    ->set_rules('description', 'Description', 'trim|required')
                    ->set_rules('is_popular', 'Popular', 'trim|required')
                    ->set_rules('is_featured', 'Featured', 'trim|required')
                    ->set_rules('is_latest', 'Latest', 'trim|required')
//                    ->set_rules('dimention', 'Dimention', 'trim')
//                    ->set_rules('featured', 'Featured', 'trim')
//                    ->set_rules('new_arrival', 'New Arrival', 'trim')
                    ->set_rules('cart_photo', 'Cart Photo', 'callback_file_validate[no.cart_photo.jpg,jpeg,gif,png]')
//                    ->set_rules('jilancollection_images', 'Images', 'callback_file_validate[no.jilancollection_images.jpg,jpeg,gif,png]')
            ;

            // check the validation
            if ($this->form_validation->run()) {
                $addData['category_id'] = $categoryId = $this->input->post('category');
                $addData['title'] = $this->input->post('title');
                $addData['is_popular'] = $this->input->post('is_popular');
                $addData['is_featured'] = $this->input->post('is_featured');
                $addData['is_latest'] = $this->input->post('is_latest');
                $addData['price'] = 0;
                $addData['dimension'] = 'no';
                $addData['featured'] = 'no';
                $addData['description'] = $this->input->post('description');
                $addData['model_size'] = 'no';
                $addData['new_arrival'] = 'no';

                if(!empty($_FILES['cart_photo']['name'])) {
                    $addData['cart_photo'] = $this->singlePhotoUpload($id);
                }

//                $captionOld = $this->input->post('caption_old');
//                $imageDetailsOld = $this->input->post('image_details_old');

//                if (!empty($photos)) {
//                    foreach ($photos as $key => $photo) {
//
//                        $photoData = array(
//                            'typeid' => $photo->typeid,
//                            'title' => $captionOld[$key],
//                            'image_details' => $imageDetailsOld[$key], // image details
//                        );
//                        $this->global_model->update('media', $photoData, array('id' => $photo->id));
//                    }
//                }

                if ($this->jilancollection_model->update($addData, $id)) {

                    if (array_filter($_FILES['jilancollection_images']['name'])) {
//                        $this->multiplePhotoUploadForCollectionUpdate($id);
                    }

                    // checking product relation exist or not
                    if ($this->global_model->getProductRelationsByProductId($id)) {

                        // if exists then just delete old product relation data
                        $this->global_model->delete('product_relation', array('product_id' => $id));

                        $typeId = $allData->jilancollection_id;
                        $this->load->model('admin/jilancollectionCat_model', 'jilancollectioncat');
                        $getParentIds = $this->jilancollectioncat->lookingForParentIds($categoryId);

                        if (!empty($getParentIds)) {
                            foreach ($getParentIds as $key => $parentId) {
                                // new relation params
                                $parentData = array(
                                    'product_id' => $typeId,
                                    'category_ids' => $parentId,
                                    'created' => date('Y-m-d H:i:s')
                                );
                                // insert new relation data
                                $this->db->insert('product_relation', $parentData);
                            }
                        }
                    }

                    $this->session->set_flashdata('success_msg', 'Updated Successfully !');
                    redirect(admin_url('jilancollection'));
                }
            }
        }

        $data['required_contents'] = $this->load->view($this->_view_path . '/update', $data, TRUE);
        $this->load->view('admin/admin_master', $data);
    }

    public function view($id) {

        $data['module'] = $this->_module;
        $data['pageGroup'] = $this->_module_name;
        $data['get_info'] = $this->jilancollection_model->getSingleInfo($id);
        $data['pageTitle'] = "View of " . $data['get_info']->title;
        $data['tabActive'] = "jilancollection";
        $data['subTabActive'] = "jilancollection_manage";

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
        $allPhotos = $this->global_model->get('media', array('typeid' => $id, 'type' => 'jilancollection'));

        // if exists then just delete old product relation data
        $this->global_model->delete('product_relation', array('product_id' => $id));

        if (!empty($allPhotos)) {
            foreach ($allPhotos as $photo) {

                // delete the record from database
                if ($photo->images) {
                    if ($this->global_model->delete('media', array('id' => $photo->id, 'type' => 'jilancollection'))) {
                        if (file_exists('assets/media/jilancollection/' . $photo->images)) {
                            unlink('assets/media/jilancollection/' . $photo->images);
                        }
                        if (file_exists('assets/media/jilancollection/thumbs/' . $photo->images)) {
                            unlink('assets/media/jilancollection/thumbs/' . $photo->images);
                        }
                        if (file_exists('assets/media/jilancollection/original/' . $photo->images)) {
                            unlink('assets/media/jilancollection/original/' . $photo->images);
                        }

                        if (file_exists('assets/media/jilancollection/home/' . $photo->images)) {
                            unlink('assets/media/jilancollection/home/' . $photo->images);
                        }
                    }
                }
            }
        }

        // delete the album
        if ($this->global_model->delete('jilancollection', array('jilancollection_id' => $id))) {
            $this->session->set_flashdata('success_msg', 'Item Deleted Successfully !!');
            redirect(admin_url('jilancollection'));
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

    private function cartPhotoUpload($typeId = 0) {

        // filter the array
        $mainPhotos = array_filter($_FILES['cart_photo']);

        // populate the single File field 
        $_FILES['photo']['name'] = $mainPhotos['name'];
        $_FILES['photo']['type'] = $mainPhotos['type'];
        $_FILES['photo']['tmp_name'] = $mainPhotos['tmp_name'];
        $_FILES['photo']['size'] = $mainPhotos['size'];



        // generate the photo name
        $imageName = time();

        // upload photo
        $photo = $this->file_processing->image_upload('photo', './assets/media/jilancollection/cart/', 'size[250,300]', 'jpg|jpeg|png|gif', $imageName);
        if(!empty($typeId) && !empty($photo)) {
            $fileName = $this->global_model->getOnlyRow('jilancollection',['jilancollection_id'=>$typeId]);
            if(!empty($fileName->cart_photo)) {
                $this->file_processing->delete_file($fileName->cart_photo, './assets/media/jilancollection/cart/');
            }
        }

          $ini_path = './assets/media/jilancollection/cart/' . $photo;
          $main_path = './assets/media/jilancollection/cart/' . $photo; // main image path
//        $thumbs_path = './assets/media/jilancollection/thumbs/' . $photo; // thumbs path
//        $home_thumbs_path = './assets/media/jilancollection/home/' . $photo; // resize home thumbs
        // resizing the image
          img_resize($ini_path, $main_path, array('width' => 250, 'height' => 300)); // original
//        img_resize($ini_path, $thumbs_path, array('width' => 274, 'height' => 444)); // resize with thumbs
//        img_resize($ini_path, $home_thumbs_path, array('width' => 370, 'height' => 476)); // resized thumbs home path
        return $photo;
//        $caption = $this->input->post('caption');
//        $imageDetails = $this->input->post('image_details');
//
//        //generate the photo data
//        $photoData = array(
//            'typeid' => $typeId,
//            'images' => $photo,
//            'title' => $caption,
//            'image_details' => $imageDetails, // image details
//            'type' => 'jilancollection',
//            'created' => date('Y-m-d H:i:s')
//        );
//
//        $this->global_model->saveNewMedia($photoData);
//        $photoCount[] = array('typeid' => $typeId);

        if (count($photoCount)) {
            return true;
        } else {
            return true;
        }
    }

    private function singlePhotoUpload($typeId = 0) {

        $photoCount = array();

        // filter the array
        $mainPhotos = $_FILES['cart_photo'];

        // populate the single File field
        $_FILES['photo']['name'] = $mainPhotos['name'];
        $_FILES['photo']['type'] = $mainPhotos['type'];
        $_FILES['photo']['tmp_name'] = $mainPhotos['tmp_name'];
        $_FILES['photo']['size'] = $mainPhotos['size'];



        // generate the photo name
        $imageName = time();

        // upload photo
        $photo = $this->file_processing->image_upload('photo', './assets/media/jilancollection/original/', 'size[1100,99999]', 'jpg|jpeg|png|gif', $imageName);

        if(!empty($typeId) && !empty($photo)) {
            $fileName = $this->global_model->getOnlyRow('jilancollection',['jilancollection_id'=>$typeId]);
            if(!empty($fileName->cart_photo)) {
                $this->file_processing->delete_file($fileName->cart_photo, './assets/media/jilancollection/cart/');
                $this->file_processing->delete_file($fileName->cart_photo, './assets/media/jilancollection/original/');
            }
        }

        $ini_path = './assets/media/jilancollection/original/' . $photo;
//        $main_path = './assets/media/jilancollection/' . $photo; // main image path
//        $thumbs_path = './assets/media/jilancollection/thumbs/' . $photo; // thumbs path
        $home_thumbs_path = './assets/media/jilancollection/cart/' . $photo; // resize home thumbs
        // resizing the image
//        img_resize($ini_path, $main_path, array('width' => 935, 'height' => 553)); // original
//        img_resize($ini_path, $thumbs_path, array('width' => 100, 'height' => 100)); // resize with thumbs
        img_resize($ini_path, $home_thumbs_path, array('width' => 250, 'height' => 300)); // resized thumbs home path

        return $photo;

        $caption = $this->input->post('caption');
        $imageDetails = $this->input->post('image_details');

        //generate the photo data
        $photoData = array(
            'typeid' => $typeId,
            'images' => $photo,
            'title' => $caption,
            'image_details' => $imageDetails, // image details
            'type' => 'jilancollection',
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
            $home_thumbs_path = './assets/media/jilancollection/cart/' . $photo; // resized home image path

            img_resize($ini_path, $main_path, array('width' => 935, 'height' => 650));
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