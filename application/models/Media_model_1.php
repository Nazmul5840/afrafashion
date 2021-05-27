<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Media_model_1 extends CI_Model {

    public $_module;

    function __construct() {
        parent::__construct();
        $this->_module = 'jilanmedia';
        $this->_primary_key = 'jilanmedia_id';
    }

    public function getEntertainmentCategoryDetails($id) {

        $this->db->select('jilanmedia.*,jilanmedia_category.category_name')
                ->from('jilanmedia')
                ->join('jilanmedia_category', 'jilanmedia_category.id =jilanmedia.category_id');
        $this->db->where('jilanmedia_category.id', $id);
        $query = $this->db->get();

        if ($query->num_rows() != 0) {
            return $query->row();
        } else {
            return false;
        }
    }

    public function getMediaTitleById($jilanmediaId) {

        $this->db->select('*')->from('jilanmedia_category')->where('id', $jilanmediaId);

        $query = $this->db->get();
        if ($query->num_rows() > 0) {

            $row = $query->row();
            return $row->category_name;
        } else {
            return FALSE;
        }
    }

    public function getMediaInfoById($where) {

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