<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Jilanmedia_model extends CI_Model {

    public $_module;
    public $_primary_key;

    function __construct() {
        parent::__construct();
        $this->_module = 'jilanmedia';
        $this->_primary_key = 'jilanmedia_id';
    }

    // insert new record 
    public function create($data) {
        $this->db->insert($this->_module, $data);
        return $this->db->affected_rows();
    }

    // get the specific information
    public function getSingleInfo($id) {

        $select = $this->db->select('*');
        $select->from($this->_module);
        $select->where($this->_primary_key, $id);
        $query = $this->db->get();
        return $query->row();
    }

    public function getAllCollectionData() {

        $this->db->select('jilanmedia.*,jilanmedia_category.*');
        $this->db->from('jilanmedia');
        $this->db->order_by('jilanmedia_id','desc');
        $this->db->join('jilanmedia_category', 'jilanmedia_category.id = jilanmedia.category_id');
        $query = $this->db->get();

        if ($query->num_rows() != 0) {
            return $query->result();
        } else {
            return false;
        }
    }

    // delete single information
    public function delete($id = 0) {
        $this->db->delete($this->_module, array($this->_primary_key => $id));
        return $this->db->affected_rows();
    }

    // update the information
    public function update($data, $id) {
        if ($this->db->update($this->_module, $data, $this->_primary_key . "= " . $id)) {
            return TRUE;
        } else {
            return FALSE;
        }
    }

}

/* End of file Jilanmedia_model.php */
/* Location: ./application/model/admin/Jilanmedia_model.php */