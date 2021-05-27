<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class EntertainmentCat extends CI_Controller {

    public $_module_name;
    public $_module;
    public $_view_path;

    function __construct() {

        parent::__construct();
        $this->load->model('admin/entertainmentCat_model', 'category');
        $this->_module_name = 'Entertainment Category';
        $this->_module = 'admin/entertainmentCat';
        $this->_view_path = 'admin/entertainment';

        if (!loginCheck()) {
            $this->session->set_userdata('return_url', current_url()); // set the last visit page
            $this->session->set_flashdata('success_msg', 'Please Login First !!');

            redirect(admin_url('auth/login'));
        }
    }

    public function index($id = false) {

        $data['module'] = $this->_module;
        $data['pageGroup'] = $this->_module_name;
        $data['pageTitle'] = "Manage " . $this->_module_name;
        $data['tabActive'] = "entertainment";
        $data['subTabActive'] = "entertainment_category";
        $data['category_id'] = $id;

        if ($id && ($category = $this->category->getSingleInfo($id))) {
            $data['category'] = $category;
        }

        // if form has submitted
        if ($this->input->post('submit')) {
            if ($id) { // if got id for edit
                $data = $this->edit($id);
            } else { // must for insert
                $data = $this->create();
            }
        }

        $data['required_contents'] = $this->load->view($this->_view_path . '/category', $data, TRUE);
        $this->load->view('admin/admin_master', $data);
    }

    public function create() {

        $data['page_title'] = 'Add Entertainment Category';
        $data['tabActive'] = 'entertainment_category';

        if ($this->input->post('submit')) {
            $this->form_validation->set_rules('category', 'Category', 'trim|required');
            $this->form_validation->set_rules('status', 'Status', 'trim|required');

            if ($this->form_validation->run()) {

                $insertData['category_name'] = $this->input->post('category');
                $insertData['parent_id'] = $this->input->post('parent_id');
                $insertData['status'] = $this->input->post('status');
                $insertData['created'] = date('Y-m-d H:i:s');

                if ($this->global_model->insert('entertainment_category', $insertData)) {
                    $this->session->set_flashdata('success_msg', 'Entertainment Category Added Successfully');
                    redirect(admin_url('entertainmentCat'));
                } else {
                    $data['error'] = mysql_error();
                }
            } else {
                $data['error'] = validation_errors();
            }
        }
    }

    public function edit($id) {

        $data['tabActive'] = 'entertainment_category';
        $data['category'] = $category = $this->global_model->get_data('entertainment_category', array('id' => $id));
        $data['subCategory'] = $this->global_model->get_data('entertainment_category', array('parent_id' => $category['id']));

        if ($this->input->post('submit')) {
            $this->form_validation->set_rules('category', 'Category', 'trim|required');

            if ($this->form_validation->run()) {
                $insertData['category_name'] = $this->input->post('category');
                $insertData['parent_id'] = $this->input->post('parent_id');
                $insertData['status'] = $this->input->post('status');

                if ($this->global_model->update('entertainment_category', $insertData, array('id' => $id))) {
                    $this->session->set_flashdata('success_msg', 'Updated Successfully');
                    redirect(admin_url('entertainmentCat'));
                }
            } else {
                $data['error'] = validation_errors();
            }
        }

        return $data;
    }

    public function delete($id) {

        if ($this->global_model->delete('entertainment_category', array('id' => $id))) {
            $allData = $this->global_model->get_data('entertainment_category', array('id' => $id));
            if ($allData['parent_id'] == 0) {
                $allSubData = $this->global_model->get('entertainment_category', array('parent_id' => $id));
                if (!empty($allSubData)) {
                    foreach ($allSubData as $data) {
                        $this->global_model->delete('entertainment_category', array('id' => $data->id));
//                        $this->global_model->delete('entertainment', array('category_id' => $data->id));
                    }
                }
            }

            $this->session->set_flashdata('success_msg', 'Deleted successfully');
            redirect(admin_url('entertainmentCat'));
        }
    }

}
