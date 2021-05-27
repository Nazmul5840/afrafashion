<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Activities_model extends CI_Model {

    public $_module;

    function __construct() {
        parent::__construct();
        $this->_module = 'activities';
        $this->_primary_key = 'activities_id';
    }

    public function getActivitiesCategoryDetails($id) {

        $this->db->select('activities.*,activities_category.category_name')
                ->from('activities')
                ->join('activities_category', 'activities_category.id =activities.category_id');
        $this->db->where('activities_category.id', $id);
        $query = $this->db->get();

        if ($query->num_rows() != 0) {
            return $query->row();
        } else {
            return false;
        }
    }

    public function getActivitiesTitleById($activitiesId) {

        $this->db->select('*')->from('activities_category')->where('id', $activitiesId);

        $query = $this->db->get();
        if ($query->num_rows() > 0) {

            $row = $query->row();
            return $row->category_name;
        } else {
            return FALSE;
        }
    }

    public function getActivitiesInfoById($where) {

        $query = $this->db->get_where($this->_module, $where);

        if ($query->result()) {
            return $query->row_array();
        } else {
            return false;
        }
    }

}

/* End of file Activities_model.php */
/* Location: ./application/model/Activities_model.php */