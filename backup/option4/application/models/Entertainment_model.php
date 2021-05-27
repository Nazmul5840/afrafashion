<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Entertainment_model extends CI_Model {

    public $_module;

    function __construct() {
        parent::__construct();
        $this->_module = 'entertainment';
        $this->_primary_key = 'entertainment_id';
    }

    public function getEntertainmentCategoryDetails($id) {

        $this->db->select('entertainment.*,entertainment_category.category_name')
                ->from('entertainment')
                ->join('entertainment_category', 'entertainment_category.id =entertainment.category_id');
        $this->db->where('entertainment_category.id', $id);
        $query = $this->db->get();

        if ($query->num_rows() != 0) {
            return $query->row();
        } else {
            return false;
        }
    }

    public function getEntertainmentTitleById($entertainmentId) {

        $this->db->select('*')->from('entertainment_category')->where('id', $entertainmentId);

        $query = $this->db->get();
        if ($query->num_rows() > 0) {

            $row = $query->row();
            return $row->category_name;
        } else {
            return FALSE;
        }
    }

    public function getEntertainmentInfoById($where) {

        $query = $this->db->get_where($this->_module, $where);

        if ($query->result()) {
            return $query->row_array();
        } else {
            return false;
        }
    }

}

/* End of file Entertainment_model.php */
/* Location: ./application/model/Entertainment_model.php */