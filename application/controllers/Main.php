<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Main extends CI_Controller {

    public $_view_path;

    public function __construct() {
        parent::__construct();
        /* Set View Path */
        $this->_view_path = 'frontend/';
    }

    public function index() {
        $data = array();
        $data['pageTitle'] = 'Home | '.$this->config->item('PROJECT_TITLE');
        $data['tabActive'] = 'home';
        $data['content']=$this->load->view($this->_view_path . 'home',$data,true);
        $this->load->view($this->_view_path .'template',$data);
    }
    public function contact() {
        $data = array();
        $data['pageTitle'] = 'Contact | '.$this->config->item('PROJECT_TITLE');
        $data['tabActive'] = 'contact';
        $data['content']=$this->load->view($this->_view_path . 'contact',$data,true);
        $this->load->view($this->_view_path .'template',$data);
    }
    public function about() {
        $data = array();
        $data['pageTitle'] = 'About | '.$this->config->item('PROJECT_TITLE');
        $data['tabActive'] = 'about';
        $data['content']=$this->load->view($this->_view_path . 'about',$data,true);
        $this->load->view($this->_view_path .'template',$data);
    }
    public function terms_condition() {
        $data = array();
        $data['pageTitle'] = 'Terms&Condition | '.$this->config->item('PROJECT_TITLE');
        $data['tabActive'] = 'terms_condition';
        $data['content']=$this->load->view($this->_view_path . 'terms_condition',$data,true);
        $this->load->view($this->_view_path .'template',$data);
    }
    public function shipping_policy() {
        $data = array();
        $data['pageTitle'] = 'Shipping | '.$this->config->item('PROJECT_TITLE');
        $data['tabActive'] = 'shipping';
        $data['content']=$this->load->view($this->_view_path . 'shipping_policy',$data,true);
        $this->load->view($this->_view_path .'template',$data);
    }
    public function return_policy() {
        $data = array();
        $data['pageTitle'] = 'Return Policy | '.$this->config->item('PROJECT_TITLE');
        $data['tabActive'] = 'return_policy';
        $data['content']=$this->load->view($this->_view_path . 'return_policy',$data,true);
        $this->load->view($this->_view_path .'template',$data);
    }
    public function privacy_policy() {
        $data = array();
        $data['pageTitle'] = 'Return Policy | '.$this->config->item('PROJECT_TITLE');
        $data['tabActive'] = 'privacy_policy';
        $data['content']=$this->load->view($this->_view_path . 'privacy_policy',$data,true);
        $this->load->view($this->_view_path .'template',$data);
    }

    public function products($id=0) {
        $get_data = $this->input->get();
        $data = array();
        if ($id == 0 && empty($get_data['tag']) && empty($get_data['search'])) { // if no id has been provided
            redirect('');
        } else {
            $data = array();
            $data['tabActive'] = 'dionescollection';
            $data['jilanCollectionId'] = $id;

            $this->load->model('jilancollection_model');
            $search = !empty($this->input->get('search')) ? $this->input->get('search') : false;
            // get all related product info by cat id
            if(!empty($get_data['tag'])) {

                if($get_data['tag']=='popular') {
                    $tagName = 'is_popular';
                }
                elseif($get_data['tag']=='featured') {
                    $tagName = 'is_featured';
                }
                else {
                    $tagName = 'is_latest';
                }
                $data['productInfo'] = $productInfo = $this->global_model->get('jilancollection', [$tagName=>'yes']);
            }
            elseif(!empty($get_data['search'])) {
                $search = $get_data['search'];
                $where = "title like '%$search%'";
                $data['productInfo'] = $productInfo = $this->global_model->get('jilancollection', $where);
            }
            else {
                $data['productInfo'] = $productInfo = $this->global_model->getAllProductRelationIdByCatId($id, $search);
            }
//            pr($data['productInfo']);
            $data['jilanCollectionCategory'] = $jilanCollectionCategory = $this->global_model->getCollectionCategoryNameById($id);
            $data['pageTitle'] = !empty($jilanCollectionCategory->category_name) ? $jilanCollectionCategory->category_name : "";

//            $this->load->view('frontend/header', $data);
//            $this->load->view($this->_view_path . 'jilancollection_details_backup', $data);
//            $this->load->view($this->_view_path . 'jilancollection_details', $data);
//            $this->load->view('frontend/footer', $data);
        }
        $data['pageTitle'] = 'Product | '.$this->config->item('PROJECT_TITLE');
        $data['tabActive'] = 'products';
        $data['content']=$this->load->view($this->_view_path . 'products',$data,true);
        $this->load->view($this->_view_path .'template',$data);
    }


    public function productDetails($id) {
        $data = array();
        $data['pageTitle'] = 'Product | '.$this->config->item('PROJECT_TITLE');
        $data['tabActive'] = 'products';
        $productInfo = $this->global_model->getOnlyRow('jilancollection',['jilancollection_id'=>$id]);
        $data['product_info'] = $productInfo;
        $data['related_product'] =  $this->global_model->get('jilancollection',['jilancollection_id !='=>$id,'category_id'=>$productInfo->category_id]);
        $data['content']=$this->load->view($this->_view_path . 'product-details',$data,true);
        $this->load->view($this->_view_path .'template',$data);
    }

}
