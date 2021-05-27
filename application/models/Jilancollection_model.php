<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Jilancollection_model extends CI_Model {

    public $_module;

    function __construct() {
        parent::__construct();
        $this->_module = 'jilancollection';
        $this->_primary_key = 'jilancollection_id';
    }

    public function getJilanCollectionCategoryDetails($id) {

        $this->db->select('jilancollection.*,jilancollection_category.category_name')
                ->from('jilancollection')
                ->join('jilancollection_category', 'jilancollection_category.id =jilancollection.category_id');
        $this->db->where('jilancollection_category.id', $id);
        $query = $this->db->get();

        if ($query->num_rows() != 0) {
            return $query->row();
        } else {
            return false;
        }
    }

    public function getJilanCollectionTitleById($collectionId) {

        $this->db->select('*')->from('jilancollection_category')->where('id', $collectionId);

        $query = $this->db->get();
        if ($query->num_rows() > 0) {

            $row = $query->row();
            return $row->category_name;
        } else {
            return FALSE;
        }
    }

    public function getJilanCollectionInfoById($where) {

        $query = $this->db->get_where($this->_module, $where);

        if ($query->result()) {
            return $query->result();
        } else {
            return false;
        }
    }

}

/* End of file Jilancollection_model.php */
/* Location: ./application/model/Jilancollection_model.php */