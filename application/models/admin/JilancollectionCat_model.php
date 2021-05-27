<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class JilancollectionCat_model extends CI_Model {

    public $_module;
    public $_primary_key;

    function __construct() {
        parent::__construct();
        $this->_module = 'jilancollection_category';
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
        $select->where('id ', $id);

        $query = $this->db->get();
        return $query->row();
    }

    // get the information based on filtaring
    public function getAll($count = false, $params = array(), $num = null, $offset = null) {
        $select = $this->db->select('*')->from($this->_module);
        if ($params) {
            
        }
        $select->order_by('id ', 'DESC');
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
        $this->db->delete($this->_module, array('id' => $id));
        return $this->db->affected_rows();
    }

    // update the information
    public function update($data, $id) {
        if ($this->db->update($this->_module, $data, "id = " . $id))
            return TRUE;
        else
            return FALSE;
    }

    public function getCategories() {

        $this->db->select('*');
        $this->db->from($this->_module);
        $this->db->where('parent_id', 0);
        $parent = $this->db->get();

        $categories = $parent->result();
        $i = 0;
        foreach ($categories as $parent_cat) {

            $categories[$i]->sub = $this->subCategories($parent_cat->id);
            $i++;
        }
        return $categories;
    }

    public function subCategories($id) {

        $this->db->select('*');
        $this->db->from($this->_module);
        $this->db->where('parent_id', $id);

        $child = $this->db->get();
        $categories = $child->result();
        $i = 0;
        foreach ($categories as $parent_cat) {

            $categories[$i]->sub = $this->subCategories($parent_cat->id);
            $i++;
        }
        return $categories;
    }

    public function getCategoryForParentId($parentId = 0) {

        $categories = array();
        $this->db->select('id,parent_id,category_name');
        $this->db->from($this->_module);
        $this->db->where('parent_id', $parentId);
        $parent = $this->db->get();

        if ($parent->num_rows() > 0) {
            $result = $parent->result_array();
            foreach ($result as $mainCategory) {
                $category = array();
                $category['id'] = $mainCategory['id'];
                $category['category_name'] = $mainCategory['category_name'];
                $category['parent_id'] = $mainCategory['parent_id'];
                $category['sub_categories'] = $this->getCategoryForParentId($category['id']);
                $categories[$mainCategory['id']] = $category;
            }
            return $categories;
        }
        return FALSE;
    }

    public function getAllCategories() {

        $this->db->select('*');
        $this->db->from($this->_module);
        $parent = $this->db->get();

        if ($parent->num_rows() > 0) {
            return $parent->result();
        }
        return FALSE;
    }

    public function lookingForParentIds($categoryId) {

        $this->db->select('*');
        $this->db->from($this->_module);
        $this->db->where('id', $categoryId);

        $child = $this->db->get();
        if ($child->num_rows() > 0) {

            $childCat = $child->result();
            $categoriesTree = array();
            foreach ($childCat as $child) {

                $categoriesTree['child_id'] = $child->id;
                $childSubCat = $this->db->get_where($this->_module, array($this->_primary_key => $child->parent_id));

                foreach ($childSubCat->result() as $childSub) {
                    $categoriesTree['child_sub_id'] = $childSub->id;
                    $childSubSubCat = $this->db->get_where($this->_module, array($this->_primary_key => $childSub->parent_id));

                    foreach ($childSubSubCat->result() as $childSubSub) {
                        $categoriesTree['child_sub_sub_id'] = $childSubSub->id;
                        $childSubSubSubCat = $this->db->get_where($this->_module, array($this->_primary_key => $childSubSub->parent_id));

                        foreach ($childSubSubSubCat->result() as $childSubSubSub) {

                            $categoriesTree['child_sub_sub_sub_id'] = $childSubSubSub->id;
                            $childSubSubSubSubCat = $this->db->get_where($this->_module, array($this->_primary_key => $childSubSubSub->parent_id));

                            foreach($childSubSubSubSubCat->result() as $childSubSubSubSub) {
                                $categoriesTree['child_sub_sub_sub_sub_id'] = $childSubSubSubSub->id;
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

/* End of file JilancollectionCat_model.php */
/* Location: ./application/model/admin/JilancollectionCat_model.php */