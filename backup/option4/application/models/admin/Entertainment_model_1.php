<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Entertainment_model extends CI_Model {

    public $_module;

    function __construct() {
        parent::__construct();
        $this->_module = 'entertainment';
        $this->_primary_key = 'entertainment_id';
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

    public function getAll($count = false, $params = array(), $num = null, $offset = null) {
        //$this->db->group_by('network.category_id');
        $select = $this->db->select('entertainment.*,entertainment_category.*')
                ->from('entertainment')
                ->join('entertainment_category', 'entertainment_category.id = entertainment.category_id', 'left');
        if ($params) {
            
        }
        //$select->order_by('entertainment.id ', 'DESC');
        if ($num) {
            $select->limit($num, $offset);
        }
        if ($count) {
            return $select->count_all_results();
        } else {
            $query = $this->db->get();
            return $query->result();
        }
    }

    public function getAllEntertainmentData() {

        $this->db->select('entertainment.*,entertainment_category.*');
        $this->db->from('entertainment');
        $this->db->join('entertainment_category', 'entertainment_category.id = entertainment.category_id');
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

/* End of file Entertainment_model.php */
/* Location: ./application/model/admin/Entertainment_model.php */