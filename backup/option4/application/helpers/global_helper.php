<?php
defined('BASEPATH') OR exit('No direct script access allowed');

// check admin user login return true or false
if (!function_exists('loginCheck')) {

    function loginCheck() {
        // get the codeigniter instance
        $CI = &get_instance();
        // check if user data to the session
        if ($CI->session->userdata('user_id')) {
            // load the specific model
            $CI->load->model('admin/user_model');
            // get the specific user information
            $userInfo = $CI->user_model->getSingleUserInfo($CI->session->userdata('user_id'));
            // if found then set the user data to the session
            if ($userInfo) {
                $user_data = array(
                    'user_id' => $userInfo->user_id,
                    'user_name' => $userInfo->user_name,
                    'first_name' => $userInfo->first_name,
                    'last_name' => $userInfo->last_name,
                    'user_level' => $userInfo->level_id,
                    'status' => $userInfo->status,
                    'email' => $userInfo->email,
                    'photo' => $userInfo->photo
                );
                $CI->session->set_userdata($user_data);

                return TRUE;
            } else {
                return FALSE;
            }
        } else {
            return FALSE;
        }
    }

}

if (!function_exists('pr')) {

    function pr($data) {
        echo "<pre>";
        print_r($data);
        echo "</pre>";
        exit;
    }

}

if (!function_exists('admin_url')) {

    function admin_url($uri = '') {
        $CI = & get_instance();
        return $CI->config->base_url('admin/' . $uri);
    }

}

// generate the password and secret
if (!function_exists('geneSecurePass')) {

    function geneSecurePass($password, $secret = FALSE) {
        if ($secret) {
            // create the salt using secret
            list( $salt1, $salt2 ) = str_split($secret, ceil(strlen($secret) / 2));
            $code = md5($salt1 . $password . $salt2);
        } else {
            // generate the randomcode
            $code['secret'] = $secret = rand(100000, 999999);
            // create the salt using secret
            list( $salt1, $salt2 ) = str_split($secret, ceil(strlen($secret) / 2));
            // generate the password
            $code['password'] = md5($salt1 . $password . $salt2);
        }
        return $code;
    }

}

if (!function_exists('get')) {

    function get($table, $where = FALSE, $limit = FALSE, $order_by = FALSE) {
        $CI = &get_instance();
        return $CI->global_model->get($table, $where, $limit, $order_by);
    }

}

//get Existance of data 
if (!function_exists('checkExist')) {

    function checkExist($table, $where) {
        $CI = &get_instance();
        $query = $CI->db->get_where($table, $where);
        if ($query->num_rows() > 0) {
            return FALSE;
        } else {
            return TRUE;
        }
    }

}


if (!function_exists('getCategoryName')) {

    function getCategoryName($id) {
        $CI = & get_instance();
        $query = $CI->db->get_where('idea_category', array('id' => $id));
        $data = $query->row_array();
        if (!empty($data)) {
            return $data['cat_name'];
        } else {
            return FALSE;
        }
    }

}

if (!function_exists('displayProductCart')) {

    function displayProductCart($title,$photoName,$id) {
        $photo = base_url('assets/media/jilancollection/original/'.$photoName);
        $url = base_url('main/productDetails/'.$id);

//        <li>
//                    <figure>
/*                        <a class="aa-product-img" href="#"><img src="<?php echo base_url('assets/frontend/img/man/1.jpg');?>"*/
//                                                                alt="polo shirt img"></a>
//                        <a class="aa-add-card-btn" href="#"><span
//                                    class="fa fa-eye"></span>View</a>
//                        <figcaption>
//                            <h4 class="aa-product-title"><a href="#">Casual Tee Female</a></h4>
//                        </figcaption>
//                    </figure>
//                </li>

        $li = '<li>
                                <figure>
                                    <a class="aa-product-img" href="#"><img style="height: 300px;width:250px;" src="'.$photo.'"
                                                                            alt="polo shirt img"></a>
                                    <a class="aa-add-card-btn" href="'.$url.'"><span
                                                class="fa fa-eye"></span>View</a>
                                    <figcaption>
                                        <h4 class="aa-product-title"><a href="#">'.$title.'</a></h4>
                                    </figcaption>
                                </figure>
                            </li>';
        return $li;
    }

}

// image resize
function img_resize($ini_path, $dest_path, $params = array()) {

    $width = !empty($params['width']) ? $params['width'] : null;
    $height = !empty($params['height']) ? $params['height'] : null;
    $constraint = !empty($params['constraint']) ? $params['constraint'] : FALSE;
    $rgb = !empty($params['rgb']) ? $params['rgb'] : 0xFFFFFF;
    $quality = !empty($params['quality']) ? $params['quality'] : 100;
    $aspect_ratio = isset($params['aspect_ratio']) ? $params['aspect_ratio'] : TRUE;
    $crop = isset($params['crop']) ? $params['crop'] : TRUE;

    if (!file_exists($ini_path)) {
        return FALSE;
    }

    if (!is_dir($dir = dirname($dest_path))) {
        mkdir($dir);
    }

    $img_info = getimagesize($ini_path);

    if ($img_info === FALSE) {
        return FALSE;
    }

    $ini_p = $img_info[0] / $img_info[1];
    if ($constraint) {
        $con_p = $constraint['width'] / $constraint['height'];
        $calc_p = $constraint['width'] / $img_info[0];

        if ($ini_p < $con_p) {
            $height = $constraint['height'];
            $width = $height * $ini_p;
        } else {
            $width = $constraint['width'];
            $height = $img_info[1] * $calc_p;
        }
    } else {
        if (!$width && $height) {
            $width = ( $height * $img_info[0] ) / $img_info[1];
        } else if (!$height && $width) {
            $height = ( $width * $img_info[1] ) / $img_info[0];
        } else if (!$height && !$width) {
            $width = $img_info[0];
            $height = $img_info[1];
        }
    }

    preg_match('/\.([^\.]+)$/i', basename($dest_path), $match);
    $ext = strtolower($match[1]);
    $output_format = ( $ext == 'jpg' ) ? 'jpeg' : $ext;

    $format = strtolower(substr($img_info['mime'], strpos($img_info['mime'], '/') + 1));
    $icfunc = "imagecreatefrom" . $format;

    $iresfunc = "image" . $output_format;

    if (!function_exists($icfunc)) {
        return FALSE;
    }

    $dst_x = $dst_y = 0;
    $src_x = $src_y = 0;
    $res_p = $width / $height;
    if ($crop && !$constraint) {
        $dst_w = $width;
        $dst_h = $height;
        if ($ini_p > $res_p) {
            $src_h = $img_info[1];
            $src_w = $img_info[1] * $res_p;
            $src_x = ( $img_info[0] >= $src_w ) ? floor(( $img_info[0] - $src_w ) / 2) : $src_w;
        } else {
            $src_w = $img_info[0];
            $src_h = $img_info[0] / $res_p;
            $src_y = ( $img_info[1] >= $src_h ) ? floor(( $img_info[1] - $src_h ) / 2) : $src_h;
        }
    } else {
        if ($ini_p > $res_p) {
            $dst_w = $width;
            $dst_h = $aspect_ratio ? floor($dst_w / $img_info[0] * $img_info[1]) : $height;
            $dst_y = $aspect_ratio ? floor(( $height - $dst_h ) / 2) : 0;
        } else {
            $dst_h = $height;
            $dst_w = $aspect_ratio ? floor($dst_h / $img_info[1] * $img_info[0]) : $width;
            $dst_x = $aspect_ratio ? floor(( $width - $dst_w ) / 2) : 0;
        }
        $src_w = $img_info[0];
        $src_h = $img_info[1];
    }

    $isrc = $icfunc($ini_path);
    $idest = imagecreatetruecolor($width, $height);
    if (( $format == 'png' || $format == 'gif' ) && $output_format == $format) {
        imagealphablending($idest, FALSE);
        imagesavealpha($idest, TRUE);
        imagefill($idest, 0, 0, IMG_COLOR_TRANSPARENT);
        imagealphablending($isrc, TRUE);
        $quality = 0;
    } else {
        imagefill($idest, 0, 0, $rgb);
    }
    imagecopyresampled($idest, $isrc, $dst_x, $dst_y, $src_x, $src_y, $dst_w, $dst_h, $src_w, $src_h);
    $res = $iresfunc($idest, $dest_path, $quality);


    //imagedestroy($isrc);
    //imagedestroy($idest);

    return $res;
}

//Add http with given url
if (!function_exists('addhttp')) {

    function addhttp($url) {
        if (!preg_match("~^(?:f|ht)tps?://~i", $url)) {
            $url = "http://" . $url;
        }
        return $url;
    }

}

/**
 * Set Email protocol
 */
if (!function_exists('email_protocol')) {

    function email_protocol() {

        $CI = &get_instance();
        $CI->load->library('email');
        $config = Array(
            'protocol' => 'smtp',
            'smtp_host' => 'info@jilanfashion.com',
            'smtp_port' => '25',
            'smtp_user' => 'info@jilanfashion.com',
            'smtp_pass' => 'ZA{xcT=H9T;T',
            'charset' => 'iso-8859-1',
            'newline' => '\r\n',
            'mailtype' => 'html',
            'smtp_timeout' => 15,
            'validation' => TRUE
        );
        return $CI->email->initialize($config);
    }

}

//get total photos
if (!function_exists('getTotalPhotoById')) {

    function getTotalPhotoById($table, $where) {
        $CI = &get_instance();
        $query = $CI->db->get_where($table, $where);
        if ($data = $query->row_array()) {
            return $data['total_photo'];
        } else {
            return 0;
        }
    }

}

if (!function_exists('limit_text')) {

    function limit_text($text, $limit) {
        $summary = substr(strip_tags($text), 0, $limit);
        $pos = strrpos($summary, " ");
        return substr($summary, 0, $pos) . '...';
    }

}

//Get all media images
if (!function_exists('getAllMedia')) {

    function getAllMedia($table, $id, $type = FALSE) {
        // get the CI instanse
        $CI = &get_instance();
        //Get image
        $results = $CI->global_model->get($table, array('typeid' => $id, 'type' => $type));
        return $results;
    }

}

//Get all media images
if (!function_exists('getPopularProduct')) {
    function getPopularProduct() {
        // get the CI instanse
        $CI = &get_instance();
        //Get image
        $results = $CI->global_model->get('jilancollection', array('is_popular' =>'yes'));
        return $results;
    }
}

//Get all media images
if (!function_exists('getFeaturedProduct')) {
    function getFeaturedProduct() {
        // get the CI instanse
        $CI = &get_instance();
        //Get image
        $results = $CI->global_model->get('jilancollection', array('is_featured' =>'yes'));
        return $results;
    }
}

if (!function_exists('getLatestProduct')) {
    function getLatestProduct() {
        // get the CI instanse
        $CI = &get_instance();
        //Get image
        $results = $CI->global_model->get('jilancollection', array('is_latest' =>'yes'));
        return $results;
    }
}

if (!function_exists('getEntertainmentMenus')) {

    function getEntertainmentMenus($styleClass, $secondLevelStyleClass) {

        // get the CI instanse
        $CI = &get_instance();

        $count = 0;
        $menuList = '';
        $categories = get('entertainment_category', array('parent_id' => 0));

        if (is_array($categories) && !empty($categories)) {
            foreach ($categories as $cat) {

                if ($cat->id == 2 && $cat->category_name == "The One") {
                    $url = site_url('world-of-jilan/the-one');
                    $menuList .='<li ' . $buttonClass . '> <a href="' . $url . '" >' . $cat->category_name . '</a>';
                } else if ($cat->id == 4 && $cat->category_name == "One Memory") {
                    $url = site_url('world-of-jilan/one-memory');
                    $menuList .='<li ' . $buttonClass . '> <a href="' . $url . '" >' . $cat->category_name . '</a>';
                } else {
                    $secondLevel = get('entertainment_category', array('parent_id' => $cat->id));
                    $count++;
                    $buttonClass = !empty($secondLevel) ? 'class=" ' . $styleClass . '"' : '';

                    $url = site_url('world-of-jilan/entertainment-details' . '/' . $cat->id . '/' . url_title($cat->category_name, 'dash', true)); // site_url('world-of-jilan/entertainment/' . $cat->id . '/' . url_title($cat->category_name, 'dash', true));
                    $menuList .='<li ' . $buttonClass . '> <a href="' . $url . '" >' . $cat->category_name . '</a>';

                    //Sub Menu
                    $thirdLevel = get('entertainment_category', array('parent_id' => $cat->id));
                    if (is_array($thirdLevel) && !empty($thirdLevel)) {
                        $menuList .= '<ul class=" ' . $secondLevelStyleClass . ' ">';
                        foreach ($thirdLevel as $third) {
                            $menuList .='<li> <a href="' . site_url('world-of-jilan/entertainment-details' . '/' . $third->id . '/' . url_title($third->category_name, 'dash', true)) . '">' . $third->category_name . '</a> </li>';
                        }
                        $menuList .= '</ul>';
                    }
                    $menuList .='</li>';
                }
            }
        }
        return $menuList;
    }

}

if (!function_exists('getMediaMenus')) {

    function getMediaMenus($styleClass, $secondLevelStyleClass, $categoryId = FALSE) {

        // get the CI instanse
        $CI = &get_instance();

        $count = 0;
        $menuList = '';
        $categories = get('jilanmedia_category', array('parent_id' => 0));

        if (is_array($categories) && !empty($categories)) {
            foreach ($categories as $cat) {
                $secondLevel = get('jilanmedia_category', array('parent_id' => $cat->id));

                $count++;
                $buttonClass = !empty($secondLevel) ? 'class=" ' . $styleClass . '"' : '';

                $url = site_url('media-details' . '/' . $cat->id . '/' . url_title($cat->category_name, 'dash', true)); // site_url('world-of-jilan/entertainment/' . $cat->id . '/' . url_title($cat->category_name, 'dash', true));

                $activeClass = ( isset($categoryId) && !empty($cat->id == $categoryId) ) ? 'class="active"' : ''; // set active menu class
                $menuList .='<li ' . $buttonClass . '> <a  ' . $activeClass . ' href="' . $url . '" >' . $cat->category_name . '</a>';

                //Sub Menu
                $thirdLevel = get('jilanmedia_category', array('parent_id' => $cat->id));
                if (is_array($thirdLevel) && !empty($thirdLevel)) {
                    $menuList .= '<ul class=" ' . $secondLevelStyleClass . ' ">';
                    foreach ($thirdLevel as $third) {

                        $activeClass = ( isset($categoryId) && !empty($third->id == $categoryId) ) ? 'class="active"' : '';
                        $menuList .='<li> <a ' . $activeClass . ' href="' . site_url('media-details' . '/' . $third->id . '/' . url_title($third->category_name, 'dash', true)) . '">' . $third->category_name . '</a>';


                        $fourthLevel = get('jilanmedia_category', array('parent_id' => $third->id));
                        if (is_array($fourthLevel) && !empty($fourthLevel)) {
                            $menuList .= '<ul class=" ' . $secondLevelStyleClass . ' ">';
                            foreach ($fourthLevel as $fourth) {

                                $activeClass = ( isset($categoryId) && !empty($fourth->id == $categoryId) ) ? 'class="active"' : '';
                                $menuList .='<li> <a ' . $activeClass . ' href="' . site_url('media-details' . '/' . $fourth->id . '/' . url_title($fourth->category_name, 'dash', true)) . '">' . $fourth->category_name . '</a> </li>';
                            }
                            $menuList .= '</ul>';
                        }

                        $menuList .= '</li>';

                    }
                    $menuList .= '</ul>';
                }
                $menuList .='</li>';
            }
        }
        return $menuList;
    }

}


if (!function_exists('getMediaMenusNew')) {

    function getMediaMenusNew() {

        // get the CI instanse
        $CI = &get_instance();

        $count = 0;
        $menuList = '';
        $categories = get('jilanmedia_category', array('parent_id' => 0));
        if (is_array($categories) && !empty($categories)) {
            foreach ($categories as $cat) {

                $secondLevel = get('jilanmedia_category', array('parent_id' => $cat->id));
                $count++;
                $liClass = !empty($secondLevel) ? 'class="current"' : '';
                $linkClass = !empty($secondLevel) ? 'class="sf-with-ul"' : '';

                $url = site_url('media-details' . '/' . $cat->id . '/' . url_title($cat->category_name, 'dash', true));
                $menuList .='<li ' . $liClass . '> <a href="' . $url . '"  '.$linkClass.'>' . $cat->category_name . '</a>';

                //Sub Menu
                $thirdLevel = get('jilanmedia_category', array('parent_id' => $cat->id));

                if (is_array($thirdLevel) && !empty($thirdLevel)) {
                    $menuList .= '<ul>';
                    foreach ($thirdLevel as $third) {
                        $fourthLevel = get('jilanmedia_category', array('parent_id' => $third->id));
                        $liClass = !empty($fourthLevel) ? 'class="current"' : '';
                        $linkClass = !empty($fourthLevel) ? 'class="sf-with-ul"' : '';

                        $menuList .='<li ' . $liClass . '> <a '.$linkClass.'  href="' . site_url('media-details' . '/' . $third->id . '/' . url_title($third->category_name, 'dash', true)) . '">' . $third->category_name . '</a>';

                        if (is_array($fourthLevel) && !empty($fourthLevel)) {
                            $menuList .= '<ul>';
                            foreach ($fourthLevel as $fourth) {

                                $fifthLevel = get('jilanmedia_category', array('parent_id' => $fourth->id));
                                $liClass = !empty($fifthLevel) ? 'class="current"' : '';
                                $linkClass = !empty($fifthLevel) ? 'class="sf-with-ul"' : '';

                                $menuList .='<li '.$liClass.'> <a '.$linkClass.'  href="' . site_url('media-details' . '/' . $fourth->id . '/' . url_title($fourth->category_name, 'dash', true)) . '">' . $fourth->category_name . '</a> </li>';
                            }
                            $menuList .= '</ul>';
                        }

                        $menuList .= '</li>';
                    }
                    $menuList .= '</ul>';
                }
                $menuList .='</li>';
            }
        }
        return $menuList;
    }

}

if (!function_exists('getActivitiesMenus')) {

    function getActivitiesMenus($styleClass, $secondLevelStyleClass) {

        // get the CI instanse
        $CI = &get_instance();

        $count = 0;
        $menuList = '';
        $categories = get('activities_category', array('parent_id' => 0));

        if (is_array($categories) && !empty($categories)) {
            foreach ($categories as $cat) {

                $secondLevel = get('activities_category', array('parent_id' => $cat->id));
                $count++;
                $buttonClass = !empty($secondLevel) ? 'class=" ' . $styleClass . '"' : '';

                $url = site_url('activities-details' . '/' . $cat->id . '/' . url_title($cat->category_name, 'dash', true));
                $menuList .='<li ' . $buttonClass . '> <a href="' . $url . '" >' . $cat->category_name . '</a>';

                //Sub Menu
                $thirdLevel = get('activities_category', array('parent_id' => $cat->id));
                if (is_array($thirdLevel) && !empty($thirdLevel)) {
                    $menuList .= '<ul class=" ' . $secondLevelStyleClass . ' ">';
                    foreach ($thirdLevel as $third) {
                        $menuList .='<li> <a href="' . site_url('activities-details' . '/' . $third->id . '/' . url_title($third->category_name, 'dash', true)) . '">' . $third->category_name . '</a>';

                        $fourthLevel = get('activities_category', array('parent_id' => $third->id));
                        if (is_array($fourthLevel) && !empty($fourthLevel)) {
                            $menuList .= '<ul class=" ' . $secondLevelStyleClass . ' ">';
                            foreach ($fourthLevel as $fourth) {
                                $menuList .='<li> <a href="' . site_url('activities-details' . '/' . $fourth->id . '/' . url_title($fourth->category_name, 'dash', true)) . '">' . $fourth->category_name . '</a> </li>';
                            }
                            $menuList .= '</ul>';
                        }

                        $menuList .= '</li>';
                    }
                    $menuList .= '</ul>';
                }
                $menuList .='</li>';
            }
        }
        return $menuList;
    }

}


if (!function_exists('getActivitiesMenusNew')) {


    function getActivitiesMenusNew() {

        // get the CI instanse
        $CI = &get_instance();

        $count = 0;
        $menuList = '';
        $categories = get('activities_category', array('parent_id' => 0));
        if (is_array($categories) && !empty($categories)) {
            foreach ($categories as $cat) {

                $secondLevel = get('activities_category', array('parent_id' => $cat->id));
                $count++;
                $liClass = !empty($secondLevel) ? 'class="current"' : '';
                $linkClass = !empty($secondLevel) ? 'class="sf-with-ul"' : '';

                $url = site_url('activities-details' . '/' . $cat->id . '/' . url_title($cat->category_name, 'dash', true));
                $menuList .='<li ' . $liClass . '> <a href="' . $url . '"  '.$linkClass.'>' . $cat->category_name . '</a>';

                //Sub Menu
                $thirdLevel = get('activities_category', array('parent_id' => $cat->id));

                if (is_array($thirdLevel) && !empty($thirdLevel)) {
                    $menuList .= '<ul>';
                    foreach ($thirdLevel as $third) {
                        $fourthLevel = get('activities_category', array('parent_id' => $third->id));
                        $liClass = !empty($fourthLevel) ? 'class="current"' : '';
                        $linkClass = !empty($fourthLevel) ? 'class="sf-with-ul"' : '';

                        $menuList .='<li ' . $liClass . '> <a '.$linkClass.'  href="' . site_url('activities-details' . '/' . $third->id . '/' . url_title($third->category_name, 'dash', true)) . '">' . $third->category_name . '</a>';

                        if (is_array($fourthLevel) && !empty($fourthLevel)) {
                            $menuList .= '<ul>';
                            foreach ($fourthLevel as $fourth) {

                                $fifthLevel = get('activities_category', array('parent_id' => $fourth->id));
                                $liClass = !empty($fifthLevel) ? 'class="current"' : '';
                                $linkClass = !empty($fifthLevel) ? 'class="sf-with-ul"' : '';

                                $menuList .='<li '.$liClass.'> <a '.$linkClass.'  href="' . site_url('activities-details' . '/' . $fourth->id . '/' . url_title($fourth->category_name, 'dash', true)) . '">' . $fourth->category_name . '</a> </li>';
                            }
                            $menuList .= '</ul>';
                        }

                        $menuList .= '</li>';
                    }
                    $menuList .= '</ul>';
                }
                $menuList .='</li>';
            }
        }
        return $menuList;
    }

}


if (!function_exists('getJilanCollectionMenus')) {

    function getJilanCollectionMenus($activeId=0) {
        // get the CI instanse
        $CI = &get_instance();

        $count1 = 0;
        $categories = get('jilancollection_category', array('parent_id' => 0));

        if (is_array($categories) && !empty($categories)) {
            foreach ($categories as $cat) {
                $count1++;
                ?>
                <li class="has_sub_child mens-wear-class"> <a href="javascript:void(0)"><?php echo $cat->category_name; /* Men's Wear */ ?></a>
                    <ul class=" has_sub_child_menu ">
                        <?php
                        $count2 = 1;
                        $subCategories = get('jilancollection_category', array('parent_id' => $cat->id));

                        if (is_array($subCategories) && !empty($subCategories)) {

                            foreach ($subCategories as $subCategory) {

                                $count2++;
                                $count3 = 0;
                                $getSubCategoryRelatedProduct = $CI->global_model->getAllProductRelationIdByCatId($subCategory->id);

                                $url = site_url('jilan-collection-details' . '/' . $subCategory->id . '/' . url_title($subCategory->category_name, 'dash', true));
                                ?>
                                <li class="summer-class"> <a href="<?php echo $url; ?>"><?php echo $subCategory->category_name; /* Summer */ ?> </a>

                                    <ul class="">
                                        <?php
                                        $subSubCategories = get('jilancollection_category', array('parent_id' => $subCategory->id));
                                        if (is_array($subSubCategories) && !empty($subSubCategories)) {
                                            foreach ($subSubCategories as $subSubCategory) {
                                                $count3++;

                                                $url = site_url('jilan-collection-details' . '/' . $subSubCategory->id . '/' . url_title($subSubCategory->category_name, 'dash', true));
                                                ?>
                                                <li class=""> <a href="<?php echo $url; ?>"><?php echo $subSubCategory->category_name; ?></a>
                                                    <ul>
                                                        <?php
                                                        $count4 = 1;
                                                        $subSubSubCategories = get('jilancollection_category', array('parent_id' => $subSubCategory->id));

                                                        if (is_array($subSubSubCategories) && !empty($subSubSubCategories)) {
                                                            foreach ($subSubSubCategories as $subSubSubCategory) {

                                                                $count4++;
                                                                $url = site_url('jilan-collection-details' . '/' . $subSubSubCategory->id . '/' . url_title($subSubSubCategory->category_name, 'dash', true));
                                                                ?>
                                                                <li class="tshirt-perfume-class"> <a href="<?php echo!empty($url) ? $url : 'javascript:void(0)'; ?>"><?php echo $subSubSubCategory->category_name; ?></a> </li>
                                                                <?php } ?>

                                                        <?php } ?>
                                                    </ul>
                                                </li>
                                            <?php } ?>
                                        <?php } ?>
                                    </ul>
                                </li>
                            <?php } ?>
                        <?php } ?>
                    </ul>
                </li>
                <?php
            }
        }
    }

}

if (!function_exists('getJilanCollectionMenusNew')) {

    function getJilanCollectionMenusNew($activeId=0) {
        // get the CI instanse
        $CI = &get_instance();
        $count1 = 0;
        $categories = get('jilancollection_category', array('parent_id' => 0),false,['filed'=>'id','order'=>'asc']);

        if (is_array($categories) && !empty($categories)) {
            foreach ($categories as $cat) {
                $count1++;
                $activelink = $cat->id==$activeId ? 'active':'';
                $count2 = 1;
                $subCategories = get('jilancollection_category', array('parent_id' => $cat->id));
                ?>
                <li>
                        <a href="javascript:void(0)" class="<?php echo $activelink; ?>">
                            <?php echo $cat->category_name; /* Men's Wear */
                            echo is_array($subCategories) && !empty($subCategories) ? '<span class="caret"></span>' : '';
                            ?>

                        </a>

                        <?php
                        if (is_array($subCategories) && !empty($subCategories)) {
                            echo "<ul class='dropdown-menu'>";
                            foreach ($subCategories as $subCategory) {

                                $count2++;
                                $count3 = 0;
                                $url = site_url('main/products' . '/' . $subCategory->id . '/' . url_title($subCategory->category_name, 'dash', true));
                                $subSubCategories = get('jilancollection_category', array('parent_id' => $subCategory->id));
                                $activelink = $subCategory->id==$activeId ? 'active':'';
                                ?>
                                <li class="<?php echo is_array($subSubCategories) && !empty($subSubCategories)?'':'' ?>">
                                <a href="<?php echo $url; ?>" class="<?php echo is_array($subSubCategories) && !empty($subSubCategories)?'':'' ?> <?php echo $activelink; ?>"><?php echo $subCategory->category_name; /* Summer */ ?> </a>


                                        <?php
                                        if (is_array($subSubCategories) && !empty($subSubCategories)) {
                                            echo "<ul class='dropdown-menu'>";
                                            foreach ($subSubCategories as $subSubCategory) {
//                                                pr($subSubCategory);
                                                $count3++;

                                                $url = site_url('main/products' . '/' . $subSubCategory->id . '/' . url_title($subSubCategory->category_name, 'dash', true));
                                                $activelink = $subSubCategory->id==$activeId ? 'active':'';
                                                $subSubSubCategories = get('jilancollection_category', array('parent_id' => $subSubCategory->id));
                                                ?>
                                                <li class="<?php echo is_array($subSubSubCategories) && !empty($subSubSubCategories)?'':'' ?>">
                                                <a href="<?php echo $url; ?>" class="<?php echo is_array($subSubSubCategories) && !empty($subSubSubCategories)?'':'' ?>  <?php echo $activelink; ?>"><?php echo $subSubCategory->category_name; ?></a>

                                                        <?php
                                                        $count4 = 1;
                                                        if (is_array($subSubSubCategories) && !empty($subSubSubCategories)) {
                                                            echo "<ul class='dropdown-menu'>";
                                                            foreach ($subSubSubCategories as $subSubSubCategory) {
                                                                $count4++;
                                                                $url = site_url('main/products' . '/' . $subSubSubCategory->id . '/' . url_title($subSubSubCategory->category_name, 'dash', true));
                                                                $activelink = $subSubSubCategory->id==$activeId ? 'active':'';
                                                                ?>
                                                                <li> <a class="<?php echo $activelink; ?>" href="<?php echo!empty($url) ? $url : 'javascript:void(0)'; ?>"><?php echo $subSubSubCategory->category_name; ?></a> </li>
                                                            <?php } ?>

                                                        <?php
                                                        echo "</ul>";
                                                        }
                                                        ?>

                                                </li>
                                            <?php } ?>
                                        <?php
                                        echo "</ul>";
                                        } ?>

                                </li>
                            <?php } ?>
                        <?php
                        echo "</ul>";
                        } ?>

                </li>
                <?php
            }
        }
    }

}


if (!function_exists('getJilanCollectionNewArrivalMenusNew')) {

    function getJilanCollectionNewArrivalMenusNew($activeId=0) {
        // get the CI instanse
        $CI = &get_instance();
        $count1 = 0;
        $categories = get('jilancollection_category', array('parent_id' => 0),false,['filed'=>'id','order'=>'desc']);

        if (is_array($categories) && !empty($categories)) {
            foreach ($categories as $cat) {
                $count1++;
                $activelink = $cat->id==$activeId ? 'active':'';
                ?>
                <li class="current">
                        <a href="javascript:void(0)" class="sf-with-ul <?php echo $activelink; ?>"><?php echo $cat->category_name; /* Men's Wear */ ?></a>

                        <?php
                        $count2 = 1;
                        $subCategories = get('jilancollection_category', array('parent_id' => $cat->id));

                        if (is_array($subCategories) && !empty($subCategories)) {
                            echo "<ul>";
                            foreach ($subCategories as $subCategory) {

                                $count2++;
                                $count3 = 0;
                                $url = site_url('jilan-collection-details-new-arrival' . '/' . $subCategory->id . '/' . url_title($subCategory->category_name, 'dash', true));
                                $subSubCategories = get('jilancollection_category', array('parent_id' => $subCategory->id));
                                $activelink = $subCategory->id==$activeId ? 'active':'';
                                ?>
                                <li class="<?php echo is_array($subSubCategories) && !empty($subSubCategories)?'current':'' ?>">
                                <a href="<?php echo $url; ?>" class="<?php echo is_array($subSubCategories) && !empty($subSubCategories)?'sf-with-ul':'' ?> <?php echo $activelink; ?>"><?php echo $subCategory->category_name; /* Summer */ ?> </a>


                                        <?php
                                        if (is_array($subSubCategories) && !empty($subSubCategories)) {
                                            echo "<ul>";
                                            foreach ($subSubCategories as $subSubCategory) {
//                                                pr($subSubCategory);
                                                $count3++;

                                                $url = site_url('jilan-collection-details-new-arrival' . '/' . $subSubCategory->id . '/' . url_title($subSubCategory->category_name, 'dash', true));
                                                $activelink = $subSubCategory->id==$activeId ? 'active':'';
                                                $subSubSubCategories = get('jilancollection_category', array('parent_id' => $subSubCategory->id));
                                                ?>
                                                <li class="<?php echo is_array($subSubSubCategories) && !empty($subSubSubCategories)?'current':'' ?>">
                                                <a href="<?php echo $url; ?>" class="<?php echo is_array($subSubSubCategories) && !empty($subSubSubCategories)?'sf-with-ul':'' ?>  <?php echo $activelink; ?>"><?php echo $subSubCategory->category_name; ?></a>

                                                        <?php
                                                        $count4 = 1;
                                                        if (is_array($subSubSubCategories) && !empty($subSubSubCategories)) {
                                                            echo "<ul>";
                                                            foreach ($subSubSubCategories as $subSubSubCategory) {
                                                                $count4++;
                                                                $url = site_url('jilan-collection-details' . '/' . $subSubSubCategory->id . '/' . url_title($subSubSubCategory->category_name, 'dash', true));
                                                                $activelink = $subSubSubCategory->id==$activeId ? 'active':'';
                                                                ?>
                                                                <li> <a class="<?php echo $activelink; ?>" href="<?php echo!empty($url) ? $url : 'javascript:void(0)'; ?>"><?php echo $subSubSubCategory->category_name; ?></a> </li>
                                                            <?php } ?>

                                                        <?php
                                                        echo "</ul>";
                                                        }
                                                        ?>

                                                </li>
                                            <?php } ?>
                                        <?php
                                        echo "</ul>";
                                        } ?>

                                </li>
                            <?php } ?>
                        <?php
                        echo "</ul>";
                        } ?>

                </li>
                <?php
            }
        }
    }

}

if (!function_exists('getMediaByTypeAndId')) {

    function getMediaByTypeAndId($id, $type = FALSE) {
        // get the CI instanse
        $CI = &get_instance();
        //Get image
        $results = $CI->global_model->get('media', array('typeid' => $id, 'type' => $type));
        return $results;
    }

}

if (!function_exists('getVideoById')) {

    function getVideoById($id) {
        // get the CI instanse
        $CI = &get_instance();
        //Get image
        $results = $CI->global_model->get('activities', array('activities_id' => $id));
        return $results;
    }

}

if (!function_exists('isVideoAvailableByProductId')) {

    function isVideoAvailableByProductId($productId) {
        // get the CI instanse
        $CI = &get_instance();
        //Get image
        $results = $CI->global_model->get('activities', array('activities_id' => $productId));

        foreach ($results as $video) {

            if (!empty($video->video_name) && NULL != $video->video_name) {
                return $video->video_name;
            } elseif (!empty($video->youtube_url) && NULL != $video->youtube_url) {
                return $video->youtube_url;
            } else {
                return FALSE;
            }
        }
    }

}


// function for get Photo
if (!function_exists('getPhotoUrl')) {

    function getPhotoUrl($photoName, $type, $imageSize = 'thumbs') {

        // get the CI instanse
        $CI = &get_instance();
        $basePath = $CI->config->base_url() . 'assets/media/';

        if (!empty($photoName)) {
            return $basePath . $type . "/" . $imageSize . "/" . $photoName;
        } else {
            return $basePath . $type . "/" . $imageSize . "/" . '';
        }
    }

}

// function for get Photo
if (!function_exists('getCartPhoto')) {

    function getCartPhoto($photoName, $type, $imageSize = 'cart') {

        // get the CI instanse
        $CI = &get_instance();
//        $basePath = FCPATH . 'assets/media/';
        $basePath = $CI->config->base_url() . 'assets/media/';
//        pr(FCPATH);
        if (!empty($photoName)) {
            $path =  $basePath . $type . "/" . $imageSize . "/" . $photoName;
        } else {
            $path =  $basePath . $type . "/" . $imageSize . "/" . 'no-photo.jpg';
        }
        return $path;
//        return file_exists($path) ? $path : $basePath . $type .'/'. $imageSize. "/no-photo.png";
    }

}

// get the facebook share link
if (!function_exists('facebookShare')) {

    function facebookShare($url) {

        $shareUrl = 'https://www.facebook.com/sharer/sharer.php?' . http_build_query(array('u' => $url));
        return $shareUrl;
    }

}

// get the Twitter share link
if (!function_exists('twitterShare')) {

    function twitterShare($url, $text, $twitter_user = '') {

        $shareUrl = 'https://twitter.com/intent/tweet?';
        $params = array(
            'url' => $url,
            'via' => $twitter_user,
            'text' => $text
        );
        $shareUrl .=http_build_query($params);
        return $shareUrl;
    }

}

// get the google share link
if (!function_exists('googlePlusShare')) {

    function googlePlusShare($url) {
        $shareUrl = 'https://plus.google.com/share?' . http_build_query(array('url' => $url));
        return $shareUrl;
    }

}
// get the LinkedIn share link
if (!function_exists('linkedinShare')) {

    function linkedinShare($url, $title, $summary = '', $source = '') {

        $shareUrl = 'https://www.linkedin.com/shareArticle?';
        $params = array(
            'mini' => true,
            'url' => $url,
            'title' => $title,
            'summary' => $summary,
            'source' => $source
        );
        $shareUrl .= http_build_query($params);
        return $shareUrl;
    }

}

// return human readable date time
if (!function_exists('longDateHuman')) {

    function longDateHuman($dateTime, $format = 'datetime') {
        $intTime = (!ctype_digit($dateTime)) ? strtotime($dateTime) : $dateTime;
        if ($intTime) {
            switch ($format) {
                case 'datetime':
                    return date('jS M, Y \a\t h:i:s a', $intTime);
                case 'date_time':
                    return date('j M y, h:i A', $intTime);
                case 'date':
                    return date('jS F, Y', $intTime);
                case 'time':
                    return date('h:i', $intTime);
                case 'short':
                    return date('jS M, y', $intTime);
                case 'MY':
                    return date('F Y', $intTime);
                case 'Y':
                    return date('Y', $intTime);
                case 'M':
                    return date('F', $intTime);
                case 'full':
                    return date('j M Y, h:i A', $intTime);
                case 'md':
                    return date('j M, h:i A', $intTime);

                default:
                    break;
            }
        } else
            return "Not yet";
    }

}

if (!function_exists('statusCheck')) {

    function statusCheck($status) {
        if ($status) {
            return '<span class="label label-success">Active</span>';
        } else {
            return '<span class="action label label-danger">Inactive</span>';
        }
    }

}

if (!function_exists('getCategoryOrder')) {

    function getCategoryOrder($productId) {

        // get the CI instanse
        $CI = &get_instance();
        //Get image
        $results = $CI->global_model->getCategoryNameInOrderById($productId);

        return $results;
    }

}

if (!function_exists('getEntertainmentCategoryOrder')) {

    function getEntertainmentCategoryOrder($productId) {

        // get the CI instanse
        $CI = &get_instance();
        //Get image
        $results = $CI->global_model->getEntertainmentCategoryNameInOrder($productId);
        return $results;
    }

}

if (!function_exists('getActivitiesCategoryOrder')) {

    function getActivitiesCategoryOrder($productId) {

        // get the CI instanse
        $CI = &get_instance();
        //Get image
        $results = $CI->global_model->getActivitiesCategoryNameInOrder($productId);

        return $results;
    }

}

if (!function_exists('getYouTubeVideoThumbnail')) {

    function getYouTubeVideoThumbnail($src) {

        if (!empty($src)) {
            $fetch = explode("v=", $src);
            $videoId = $fetch[1];
            $thumbnail = '<img src="http://img.youtube.com/vi/' . $videoId . '/0.jpg"  />';
        }

        return $thumbnail;
    }

}

if (!function_exists('getJilanmediaCategoryOrder')) {

    function getJilanmediaCategoryOrder($productId) {

        // get the CI instanse
        $CI = &get_instance();
        //Get image
        $results = $CI->global_model->getJilanmediaCategoryNameInOrder($productId);

        return $results;
    }

}

if (!function_exists('convertAmount')) {

    function convertAmount($amount) {
       return number_format($amount,2);
    }

}

if (!function_exists('currencyConvert')) {

    function currencyConvert($amount) {
        $CI = &get_instance();
        //Get image
        $results = $CI->global_model->getOnlyRow('settings', array('type' => 'dollar_rate'));
        if(!empty($results->value) && $amount>0) {
            return number_format(round($amount/$results->value),2);
        }
        else {
            return number_format(0,2);
        }
    }

}




/* End of file global_helper.php */
/* Location: ./application/helpers/global_helper.php */