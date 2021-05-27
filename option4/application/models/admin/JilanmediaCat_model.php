<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class JilanmediaCat_model extends CI_Model {

    public $_module;
    public $_primary_key;

    function __construct() {
        parent::__construct();
        $this->_module = 'jilanmedia_category';
        $this->_primary_key = 'id';
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

    // get the information based on filtaring
    public function getAll($count = false, $params = array(), $num = null, $offset = null) {
        $select = $this->db->select('*')->from($this->_module);
        if ($params) {
            
        }
        $select->order_by($this->_primary_key, 'DESC');
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

    // delete single information
    public function delete($id = 0) {
        $this->db->delete($this->_module, array($this->_primary_key => $id));
        return $this->db->affected_rows();
    }

    // update the information
    public function update($data, $id) {
        if ($this->db->update($this->_module, $data, $this->_primary_key ." = " . $id))
            return TRUE;
        else
            return FALSE;
    }

    public function lookingForParentIds($categoryId) {

        $this->db->select('*');
        $this->db->from($this->_module);
        $this->db->where($this->_primary_key, $categoryId);

        $child = $this->db->get();

        if ($child->num_rows() > 0) {
            $childCat = $child->result();

            $categoriesTree = array();
            foreach ($childCat as $child) {

                $categoriesTree['child_id'] = $child->id;
                $childSubCat = $this->db->get_where($this->_module, array($this->_primary_key => $child->parent_id));

                if ($childSubCat->num_rows() > 0) {
                    foreach ($childSubCat->result() as $childSub) {
                        $categoriesTree['child_sub_id'] = $childSub->id;

                        $childSubSubCat = $this->db->get_where($this->_module, array($this->_primary_key => $childSub->parent_id));

                        if ($childSubSubCat->num_rows() > 0) {
                            foreach ($childSubSubCat->result() as $childSubSub) {
                                $categoriesTree['child_sub_sub_id'] = $childSubSub->id;
                            }
                        }

                    }
                }
            }
            return $categoriesTree;
        }
        return FALSE;
    }

}

/* End of file JilanmediaCat_model.php */
/* Location: ./application/model/admin/JilanmediaCat_model.php */