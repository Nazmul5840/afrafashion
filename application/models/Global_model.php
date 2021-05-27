<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Global_model extends CI_Model {

    public function __construct() {
        $this->load->database();
    }

    /**
     * @param $table
     * @param $data
     *
     * @return mixed
     */
    public function insert($table, $data) {
        $this->db->insert($table, $data);

        return $this->db->affected_rows();
    }

    public function insertData($table, $data) {
        $this->db->insert($table, $data);
        return $this->db->insert_id();
    }

    public function saveNewMedia($data = array()) {
        $this->db->insert('media', $data);
        return $this->db->affected_rows();
    }

    /**
     * @param $table
     * @param $where
     *
     * @return bool
     */
    public function get_data($table, $where) {

        $query = $this->db->get_where($table, $where);

        if ($query->result()) {
            return $query->row_array();
        } else {
            return false;
        }
    }

    /**
     * @param $table
     * @param $data
     * @param $where
     *
     * @return mixed
     */
    public function update($table, $data, $where) {
        $this->db->where($where);

        return $this->db->update($table, $data);
    }

    /**
     * @param $table
     * @param $where
     * @return mixed
     */
    public function delete($table, $where) {
        return $this->db->delete($table, $where);
    }

    /**
     * @param $table
     *
     * @return bool
     */
    public function get($table, $where = false, $limit = false, $order_by = false, $pagination = FALSE) {
        $this->db->select('*')->from($table);

        if (!empty($where)) {
            $this->db->where($where);
        }

        if ($pagination && $limit) {
            $this->db->limit($limit['item'], $limit['start']);
        } else {
            if (!empty($limit)) {
                $this->db->limit($limit);
            }
        }

        if (!empty($order_by)) {
            $this->db->order_by($order_by['filed'], $order_by['order']);
        }

        $query = $this->db->get();

        if ($query->num_rows() > 0) {
            return $query->result();
        } else {
            return false;
        }
    }

    /**
     * @param $table
     * @param $where
     *
     * @return bool
     */
    public function get_row($table, $where) {
        $query = $this->db->get_where($table, $where);

        if ($result = $query->result()) {
            return true;
        } else {
            return false;
        }
    }

    public function getOnlyRow($table, $where) {
        $query = $this->db->get_where($table, $where);

        if ($query->num_rows() > 0) {
            return $query->row();
        } else {
            return false;
        }
    }

    public function countRow($table, $where = false) {
        if ($where) {
            $this->db->where($where);
        }
        $this->db->from($table);
        return $this->db->count_all_results();
    }

    public function getCategoryForParentId($parentId = 0) {

        $categories = array();
        $this->db->select('id,parent_id,category_name');
        $this->db->from('jilancollection_category');
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

    public function getMediaDataRandomlyByType($type) {

        $this->db->select('id,images,type');
        $this->db->where('type', $type);
        $this->db->order_by('rand()');
        $this->db->limit(2);
        $queryBuilder = $this->db->get('media');

        if ($queryBuilder->num_rows() > 0) {
            return $queryBuilder->result();
        } else {
            return false;
        }
    }

    public function getCategoryNameByProductRelationIds($productId) {
        $this->db->select('product_id,category_ids');
        $this->db->where('product_id', $productId);
        $this->db->order_by('category_ids', 'ASC');

        $queryBuilder = $this->db->get('product_relation');

        if ($queryBuilder->num_rows() > 0) {
            $idsArr = array();
            foreach ($queryBuilder->result() as $key => $result) {
                $idsArr[] = $result->category_ids;
            }

            $this->db->select('category_name');
            $this->db->where_in('id', $idsArr);
            $queryBuilder2 = $this->db->get('jilancollection_category');

            if ($queryBuilder2->num_rows() > 0) {

                $catArr = array();
                foreach ($queryBuilder2->result() as $key => $catname) {
                    $catArr[] = $catname->category_name;
                }
                if (!empty($catArr)) {
                    return implode(" > ", $catArr);
                }
            }
        }
        return false;
    }

    public function getProductRelationsByProductId($productId) {

        $this->db->select('product_id,category_ids');
        $this->db->where('product_id', $productId);
        $queryBuilder = $this->db->get('product_relation');

        if ($queryBuilder->num_rows() > 0) {
            return true;
        }
        return false;
    }

    public function getCategoryNameByEntertainmentRelationIds($productId) {

        $this->db->select('product_id,category_ids');
        $this->db->where('product_id', $productId);
        $this->db->order_by('category_ids', 'ASC');

        $queryBuilder = $this->db->get('entertainment_relation');

        if ($queryBuilder->num_rows() > 0) {
            $idsArr = array();
            foreach ($queryBuilder->result() as $key => $result) {
                $idsArr[] = $result->category_ids;
            }

            $this->db->select('category_name');
            $this->db->where_in('id', $idsArr);
            $queryBuilder2 = $this->db->get('entertainment_category');

            if ($queryBuilder2->num_rows() > 0) {

                $catArr = array();
                foreach ($queryBuilder2->result() as $key => $catname) {
                    $catArr[] = $catname->category_name;
                }
                if (!empty($catArr)) {
                    return implode(" > ", $catArr);
                }
            }
        }
        return false;
    }

    public function getCategoryNameByActivitiesRelationIds($productId) {

        $this->db->select('product_id,category_ids');
        $this->db->where('product_id', $productId);
        $this->db->order_by('category_ids', 'ASC');

        $queryBuilder = $this->db->get('activities_relation');

        if ($queryBuilder->num_rows() > 0) {
            $idsArr = array();
            foreach ($queryBuilder->result() as $key => $result) {
                $idsArr[] = $result->category_ids;
            }

            $this->db->select('category_name');
            $this->db->where_in('id', $idsArr);
            $queryBuilder2 = $this->db->get('activities_category');

            if ($queryBuilder2->num_rows() > 0) {

                $catArr = array();
                foreach ($queryBuilder2->result() as $key => $catname) {
                    $catArr[] = $catname->category_name;
                }
                if (!empty($catArr)) {
                    return implode(" > ", $catArr);
                }
            }
        }
        return false;
    }

    public function getCategoryNameByJilanMediaRelationIds($productId) {

        $this->db->select('product_id,category_ids');
        $this->db->where('product_id', $productId);
        $this->db->order_by('category_ids', 'ASC');

        $queryBuilder = $this->db->get('jilanmedia_relation');

        if ($queryBuilder->num_rows() > 0) {
            $idsArr = array();
            foreach ($queryBuilder->result() as $key => $result) {
                $idsArr[] = $result->category_ids;
            }

            $this->db->select('category_name');
            $this->db->where_in('id', $idsArr);
            $queryBuilder2 = $this->db->get('jilanmedia_category');

            if ($queryBuilder2->num_rows() > 0) {

                $catArr = array();
                foreach ($queryBuilder2->result() as $key => $catname) {
                    $catArr[] = $catname->category_name;
                }
                if (!empty($catArr)) {
                    return implode(" > ", $catArr);
                }
            }
        }
        return false;
    }

    public function getEntertainmentRelationsByProductId($productId) {

        $this->db->select('product_id,category_ids');
        $this->db->where('product_id', $productId);
        $queryBuilder = $this->db->get('entertainment_relation');

        if ($queryBuilder->num_rows() > 0) {
            return true;
        }
        return false;
    }

    public function getActivitiesRelationsByProductId($productId) {

        $this->db->select('product_id,category_ids');
        $this->db->where('product_id', $productId);
        $queryBuilder = $this->db->get('activities_relation');

        if ($queryBuilder->num_rows() > 0) {
            return true;
        }
        return false;
    }

    public function getJilanmediaRelationsByProductId($productId) {

        $this->db->select('product_id,category_ids');
        $this->db->where('product_id', $productId);
        $queryBuilder = $this->db->get('jilanmedia_relation');

        if ($queryBuilder->num_rows() > 0) {
            return true;
        }
        return false;
    }

    public function getProductInfoByCategoryId($categoryId) {

        $this->db->select('jilancollection_id,title,category_id');
        $this->db->where('category_id', $categoryId);
        $queryBuilder = $this->db->get('jilancollection');

        if ($queryBuilder->num_rows() > 0) {
            return true;
        }
        return false;
    }

    public function getAllProductRelationIdByCatId($catId,$searchtext = false,$newarrival=false) {

        $this->db->select('product_id,category_ids');
        $this->db->where('category_ids', $catId);
        $queryBuilder = $this->db->get('product_relation');

        if ($queryBuilder->num_rows() > 0) {

            $productIdsArr = array();
            foreach ($queryBuilder->result() as $key => $result) {
                $productIdsArr[] = $result->product_id;
            }

            $this->db->select('title,price,jilancollection_id,category_id,cart_photo,new_arrival');
            $this->db->where_in('jilancollection_id', $productIdsArr);
            if(!empty($searchtext)) {
                $this->db->like('title', $searchtext);
            }
            if(!empty($newarrival)) {
                $this->db->where('new_arrival', 'yes');
            }
            $queryBuilder2 = $this->db->get('jilancollection');

            if ($queryBuilder2->num_rows() > 0) {
                return $queryBuilder2->result();
            }
        }
        return false;
    }

    public function getAllEntertainmentRelationIdByCatId($catId) {

        $this->db->select('product_id,category_ids');
        $this->db->where('category_ids', $catId);
        $queryBuilder = $this->db->get('entertainment_relation');

        if ($queryBuilder->num_rows() > 0) {

            $productIdsArr = array();
            foreach ($queryBuilder->result() as $key => $result) {
                $productIdsArr[] = $result->product_id;
            }

            $this->db->select('title,entertainment_id,category_id');
            $this->db->where_in('entertainment_id', $productIdsArr);
            $queryBuilder2 = $this->db->get('entertainment');

            if ($queryBuilder2->num_rows() > 0) {
                return $queryBuilder2->result();
            }
        }
        return false;
    }

    public function getAllActivitiesRelationIdByCatId($catId) {

        $this->db->select('product_id,category_ids');
        $this->db->where('category_ids', $catId);
        $queryBuilder = $this->db->get('activities_relation');

        if ($queryBuilder->num_rows() > 0) {

            $productIdsArr = array();
            foreach ($queryBuilder->result() as $key => $result) {
                $productIdsArr[] = $result->product_id;
            }

            $this->db->select('title,activities_id,category_id');
            $this->db->where_in('activities_id', $productIdsArr);
            $queryBuilder2 = $this->db->get('activities');

            if ($queryBuilder2->num_rows() > 0) {
                return $queryBuilder2->result();
            }
        }
        return false;
    }

    public function getAllJilanmediaRelationIdByCatId($catId) {

        $this->db->select('product_id,category_ids');
        $this->db->where('category_ids', $catId);
        $queryBuilder = $this->db->get('jilanmedia_relation');

        if ($queryBuilder->num_rows() > 0) {

            $productIdsArr = array();
            foreach ($queryBuilder->result() as $key => $result) {
                $productIdsArr[] = $result->product_id;
            }

            $this->db->select('title,jilanmedia_id,category_id');
            $this->db->where_in('jilanmedia_id', $productIdsArr);
            $queryBuilder2 = $this->db->get('jilanmedia');

            if ($queryBuilder2->num_rows() > 0) {
                return $queryBuilder2->result();
            }
        }
        return false;
    }

    public function getJilanCollectionInfoById($categoryIds) {

        $this->db->select('jilancollection_id,category_id,title,description,status');
        $this->db->where_in('jilancollection_id', $categoryIds);
        $queryBuilder = $this->db->get('jilancollection');

        if ($queryBuilder->num_rows() > 0) {
            return $queryBuilder->result();
        }

        return false;
    }

    public function getCollectionCategoryNameById($categoryId) {

        $this->db->select('category_name,id')
                ->from('jilancollection_category')
                ->where('id', $categoryId);
        $query = $this->db->get();

        if ($query->num_rows() != 0) {
            return $query->row();
        } else {
            return false;
        }
    }

    public function getEntertainmentCategoryNameById($categoryId) {

        $this->db->select('category_name,id')
                ->from('entertainment_category')
                ->where('id', $categoryId);
        $query = $this->db->get();

        if ($query->num_rows() != 0) {
            return $query->row();
        } else {
            return false;
        }
    }

    public function getActivitiesCategoryNameById($categoryId) {

        $this->db->select('category_name,id')
                ->from('activities_category')
                ->where('id', $categoryId);
        $query = $this->db->get();

        if ($query->num_rows() != 0) {
            return $query->row();
        } else {
            return false;
        }
    }

    public function getJilanmediaCategoryNameById($categoryId) {

        $this->db->select('category_name,id')
                ->from('jilanmedia_category')
                ->where('id', $categoryId);
        $query = $this->db->get();

        if ($query->num_rows() != 0) {
            return $query->row();
        } else {
            return false;
        }
    }

    public function getHisParentName($categoryId) {

        $this->db->select('category_name,id,parent_id')
                ->from('jilancollection_category')
                ->where('id', $categoryId);
        $query = $this->db->get();

        if ($query->num_rows() != 0) {
            return $query->row();
        } else {
            return false;
        }
    }

    public function getCategoryNameInOrderById($productId) {

        $this->db->select('*');
        $this->db->where('id', $productId);
        $queryBuilder1 = $this->db->get('jilancollection_category');

        if ($queryBuilder1->num_rows() > 0) {
            $result1 = $queryBuilder1->row(); // first stage result

            $this->db->select('*');
            $this->db->where('id', $result1->parent_id);
            $queryBuilder2 = $this->db->get('jilancollection_category');

            if ($queryBuilder2->num_rows() > 0) {
                $result2 = $queryBuilder2->row(); // second stage result

                $this->db->select('*');
                $this->db->where('id', $result2->parent_id);
                $queryBuilder3 = $this->db->get('jilancollection_category');

                if ($queryBuilder3->num_rows() > 0) {
                    $result3 = $queryBuilder3->row(); // third stage result

                    $this->db->select('*');
                    $this->db->where('id', $result3->parent_id);
                    $queryBuilder4 = $this->db->get('jilancollection_category');

                    if ($queryBuilder4->num_rows() > 0) {
                        $result4 = $queryBuilder4->row(); // fourth stage result
                    }
                }
            }

            $firstArr = !empty($result1->category_name) ? $result1->category_name : NULL;
            $firstId = !empty($result1->id) ? $result1->id : NULL;
            $url1 = site_url('main/products' . '/' . $firstId . '/' . url_title($firstArr, 'dash', true));
            $first = !empty($firstArr) ? "<a href=" . $url1 . "> " . $firstArr . " </a>" : NULL; // first stage

            $secondArr = !empty($result2->category_name) ? $result2->category_name : NULL;
            $secondId = !empty($result2->id) ? $result2->id : NULL;
            $url2 = site_url('main/products' . '/' . $secondId . '/' . url_title($secondArr, 'dash', true));
            $second = !empty($secondArr) ? "<a href=" . $url2 . "> " . $secondArr . " </a>" : NULL; // second stage

            $thirdArr = !empty($result3->category_name) ? $result3->category_name : NULL;
            $thirdId = !empty($result3->id) ? $result3->id : NULL;
            $url3 = site_url('main/products' . '/' . $thirdId . '/' . url_title($thirdArr, 'dash', true));
            $third = !empty($thirdArr) ? "<a href=" . $url3 . "> " . $thirdArr . " </a>" : NULL; // third stage

            $fourthArr = !empty($result4->category_name) ? $result4->category_name : NULL;
            $fourthId = !empty($result4->id) ? $result4->id : NULL;
            $url4 = site_url('main/products' . '/' . $fourthId . '/' . url_title($fourthArr, 'dash', true));
            $fourth = !empty($fourthArr) ? "<a href=" . $url4 . "> " . $fourthArr . " </a>" : NULL; // fourth stage

            $final = array($first, $second, $third, $fourth); // store every value in a array

            $reverse = array_reverse(array_filter($final), true); // sort that array with reverse position, array_filter = for blank array
            return implode(" / ", $reverse); // implode with back slash
        }
        return FALSE;
    }

    public function getEntertainmentCategoryNameInOrder($productId) {

        $this->db->select('*');
        $this->db->where('id', $productId);
        $queryBuilder1 = $this->db->get('entertainment_category');

        if ($queryBuilder1->num_rows() > 0) {
            $result1 = $queryBuilder1->row(); // first stage result

            $this->db->select('*');
            $this->db->where('id', $result1->parent_id);
            $queryBuilder2 = $this->db->get('entertainment_category');

            if ($queryBuilder2->num_rows() > 0) {
                $result2 = $queryBuilder2->row(); // second stage result
            }

            $firstArr = !empty($result1->category_name) ? $result1->category_name : NULL;
            $firstId = !empty($result1->id) ? $result1->id : NULL;
            $url1 = site_url('world-of-jilan/entertainment-details' . '/' . $firstId . '/' . url_title($firstArr, 'dash', true));
            $first = !empty($firstArr) ? "<a href=" . $url1 . "> " . $firstArr . " </a>" : NULL; // first stage

            $secondArr = !empty($result2->category_name) ? $result2->category_name : NULL;
            $secondId = !empty($result2->id) ? $result2->id : NULL;
            $url2 = site_url('world-of-jilan/entertainment-details' . '/' . $secondId . '/' . url_title($secondArr, 'dash', true));
            $second = !empty($secondArr) ? "<a href=" . $url2 . "> " . $secondArr . " </a>" : NULL; // second stage
            //$first = !empty($result1->category_name) ? $result1->category_name : NULL;
            //$url1 = site_url('jilan-collection-details' . '/' . $result1->id . '/' . url_title($result1->category_name, 'dash', true));
            //$first = !empty($result1->category_name) ? "<a href=" . $url1 . "> " . $result1->category_name . " </a>" : NULL;
            //$second = !empty($result2->category_name) ? $result2->category_name : NULL;
            //$url2 = site_url('jilan-collection-details' . '/' . $result2->id . '/' . url_title($result2->category_name, 'dash', true));
            //$second = !empty($result2->category_name) ? "<a href=" . $url2 . "> " . $result2->category_name . " </a>" : NULL;

            $final = array($first, $second); // store every value in a array
            $reverse = array_reverse(array_filter($final), true); // sort that array with reverse position, array_filter for blank array
            return implode(" / ", $reverse); // implode with back slash
        }
        return FALSE;
    }

    public function getActivitiesCategoryNameInOrder($productId) {

        $this->db->select('*');
        $this->db->where('id', $productId);
        $queryBuilder1 = $this->db->get('activities_category');

        if ($queryBuilder1->num_rows() > 0) {
            $result1 = $queryBuilder1->row(); // first stage result

            $this->db->select('*');
            $this->db->where('id', $result1->parent_id);
            $queryBuilder2 = $this->db->get('activities_category');

            if ($queryBuilder2->num_rows() > 0) {
                $result2 = $queryBuilder2->row(); // second stage result
            }

            $firstArr = !empty($result1->category_name) ? $result1->category_name : NULL;
            $firstId = !empty($result1->id) ? $result1->id : NULL;
            $url1 = site_url('activities-details' . '/' . $firstId . '/' . url_title($firstArr, 'dash', true));
            $first = !empty($firstArr) ? "<a href=" . $url1 . "> " . $firstArr . " </a>" : NULL; // first stage

            $secondArr = !empty($result2->category_name) ? $result2->category_name : NULL;
            $secondId = !empty($result2->id) ? $result2->id : NULL;
            $url2 = site_url('activities-details' . '/' . $secondId . '/' . url_title($secondArr, 'dash', true));
            $second = !empty($secondArr) ? "<a href=" . $url2 . "> " . $secondArr . " </a>" : NULL; // second stage


            $final = array($first, $second); // store every value in a array
            $reverse = array_reverse(array_filter($final), true); // sort that array with reverse position, array_filter for blank array
            return implode(" / ", $reverse); // implode with back slash
        }
        return FALSE;
    }

    public function getJilanmediaCategoryNameInOrder($productId) {

        $this->db->select('*');
        $this->db->where('id', $productId);
        $queryBuilder1 = $this->db->get('jilanmedia_category');

        if ($queryBuilder1->num_rows() > 0) {
            $result1 = $queryBuilder1->row(); // first stage result

            $this->db->select('*');
            $this->db->where('id', $result1->parent_id);
            $queryBuilder2 = $this->db->get('jilanmedia_category');

            if ($queryBuilder2->num_rows() > 0) {
                $result2 = $queryBuilder2->row(); // second stage result
            }

            $firstArr = !empty($result1->category_name) ? $result1->category_name : NULL;
            $firstId = !empty($result1->id) ? $result1->id : NULL;
            $url1 = site_url('media-details' . '/' . $firstId . '/' . url_title($firstArr, 'dash', true));
            $first = !empty($firstArr) ? "<a href=" . $url1 . "> " . $firstArr . " </a>" : NULL; // first stage

            $secondArr = !empty($result2->category_name) ? $result2->category_name : NULL;
            $secondId = !empty($result2->id) ? $result2->id : NULL;
            $url2 = site_url('media-details' . '/' . $secondId . '/' . url_title($secondArr, 'dash', true));
            $second = !empty($secondArr) ? "<a href=" . $url2 . "> " . $secondArr . " </a>" : NULL; // second stage
            //$first = !empty($result1->category_name) ? $result1->category_name : NULL;
            //$url1 = site_url('jilan-collection-details' . '/' . $result1->id . '/' . url_title($result1->category_name, 'dash', true));
            //$first = !empty($result1->category_name) ? "<a href=" . $url1 . "> " . $result1->category_name . " </a>" : NULL;
            //$second = !empty($result2->category_name) ? $result2->category_name : NULL;
            //$url2 = site_url('jilan-collection-details' . '/' . $result2->id . '/' . url_title($result2->category_name, 'dash', true));
            //$second = !empty($result2->category_name) ? "<a href=" . $url2 . "> " . $result2->category_name . " </a>" : NULL;

            $final = array($first, $second); // store every value in a array
            $reverse = array_reverse(array_filter($final), true); // sort that array with reverse position, array_filter for blank array
            return implode(" / ", $reverse); // implode with back slash
        }
        return FALSE;
    }

    public function getActivitiesVideosById($activitiesId) {

        $this->db->select('*')
                ->from('activities')
                ->where('activities_id', $activitiesId);
        $query = $this->db->get();

        if ($query->num_rows() != 0) {
            return $query->result();
        } else {
            return false;
        }
    }

    public function getMediaVideosById($activitiesId) {

        $this->db->select('*')
                ->from('jilanmedia')
                ->where('jilanmedia_id', $activitiesId);
        $query = $this->db->get();

        if ($query->num_rows() != 0) {
            return $query->result();
        } else {
            return false;
        }
    }
    
    public function getJilanCollectionContentDashboard($limit = 0) {

        $select = $this->db->select('*')->from('media');
        $select->order_by('created', 'DESC');
        $select->where(array('type' => 'jilancollection'));
        $this->db->limit($limit); // limit 4
        $query = $this->db->get();

        if ($query->num_rows() > 0) {
            return $query->result();
        } else {
            return FALSE;
        }
    }

}
