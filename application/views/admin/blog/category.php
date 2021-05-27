<!--dynamic table-->
<link href="<?php echo base_url('assets/admin/advanced-datatable/media/css/demo_page.css'); ?>" rel="stylesheet" />
<link href="<?php echo base_url('assets/admin/advanced-datatable/media/css/demo_table.css'); ?>" rel="stylesheet" />
<script type="text/javascript" src="<?php echo base_url('assets/admin/jquery-ui/jquery-ui-1.9.2.custom.min.js'); ?>"></script>

<div class="row">
    <div class="col-sm-7">
        <div id="response"></div>
        <section class="panel">

            <header class="panel-heading">
                Manage Jilan Collection Category
            </header>

            <?php if (isset($category_id) && !empty($category)) { ?>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="btn-group pull-right">
                            <a href="<?php echo admin_url('jilancollectionCat'); ?>" class="btn btn-success btn-info">
                                Add New <i class="fa fa-plus"></i>
                            </a>
                        </div>
                    </div>
                </div>
            <?php } ?>

            <div class="panel-body">
                <?php if ($this->session->flashdata('success_msg')) { ?>
                    <div class="alert alert-success fade in">
                        <button data-dismiss="alert" class="close close-sm" type="button">
                            <i class="icon-remove"></i>
                        </button>
                        <?php echo $this->session->flashdata('success_msg'); ?>
                    </div>
                <?php } ?>

                <div class="adv-table">
                    <table class="display table table-bordered">
                        <thead>
                            <tr>
                                <th width="6%">SL#</th>
                                <th class="text-center" width="34%">Category Name</th>
                                <th class="text-center" width="10%">Status</th>
                                <th class="text-center" width="10%">Action</th>
                            </tr>
                        </thead>
                        <tbody class="">
                            <?php
                            $count1 = 0;
                            $categories = get('jilancollection_category', array('parent_id' => 0));

                            if (is_array($categories) && !empty($categories)) {
                                foreach ($categories as $cat) {
                                    $count1++;
                                    ?>

                                    <tr class="gradeX">
                                        <td>
                                            <a title="<?php echo $cat->category_name; ?>" href="<?php echo admin_url('jilancollectionCat/index/' . $cat->id) ?>"><?php echo $count1; ?></a>
                                        </td>
                                        <td>
                                            <a style="color: #000" title="<?php echo $cat->category_name; ?>" href="<?php echo admin_url('jilancollectionCat/index/' . $cat->id) ?>"><?php echo $cat->category_name; ?></a>
                                        </td>
                                        <td class="text-center"><?php echo $cat->status == 1 ? 'Active' : 'Inactive'; ?></td>
                                        <td class="text-center">
                                            <a class="btn btn-primary btn-xs" href="<?php echo admin_url('jilancollectionCat/index/' . $cat->id) ?>"><i class="icon-pencil"></i></a>
                                            <a class="btn btn-danger btn-xs" onclick="return confirm('Are you Sure??\nYou Want to Delete this item!');" href="<?php echo admin_url('jilancollectionCat/delete/' . $cat->id) ?>">
                                                <i class="icon-trash"></i>
                                            </a>
                                        </td>
                                    </tr>
                                    <?php
                                    $count2 = 1;
                                    $subCategories = get('jilancollection_category', array('parent_id' => $cat->id));
                                    if (is_array($subCategories) && !empty($subCategories)) {
                                        foreach ($subCategories as $subCategory) {
                                            ?>
                                            <tr class="gradeX">
                                                <td>
                                                    <a title="<?php echo $subCategory->category_name; ?>" href="<?php echo admin_url('jilancollectionCat/index/' . $subCategory->id) ?>"><?php echo $count1 . '.' . $count2; ?></a>
                                                </td>
                                                <td>
                                                    <a style="margin-left: 20px; color: #777" title="<?php echo $subCategory->category_name; ?>" href="<?php echo admin_url('jilancollectionCat/index/' . $subCategory->id) ?>">- <?php echo $subCategory->category_name; ?></a>
                                                </td>
                                                <td class="text-center"><?php echo $subCategory->status == 1 ? 'Active' : 'Inactive'; ?></td>
                                                <td class="text-center">
                                                    <a class="btn btn-primary btn-xs" href="<?php echo admin_url('jilancollectionCat/index/' . $subCategory->id) ?>"><i class="icon-pencil"></i></a>
                                                    <a class="btn btn-danger btn-xs" onclick="return confirm('Are you Sure??\nYou Want to Delete this item!');" href="<?php echo admin_url('jilancollectionCat/delete/' . $subCategory->id) ?>">
                                                        <i class="icon-trash"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                            <?php
                                            $count2++;
                                            $count3 = 0;

                                            $subSubCategories = get('jilancollection_category', array('parent_id' => $subCategory->id));
                                            if (is_array($subSubCategories) && !empty($subSubCategories)) {

                                                foreach ($subSubCategories as $subSubCategory) {
                                                    $count3++;
                                                    ?>

                                                    <tr class="gradeX">
                                                        <td>
                                                            <a title="<?php echo $subSubCategory->category_name; ?>" href="<?php echo admin_url('jilancollectionCat/index/' . $subSubCategory->id) ?>"><?php echo $count1 . '.' . $count2 . '.' . $count3; ?></a>
                                                        </td>
                                                        <td>
                                                            <a style="margin-left: 35px; color: #777" title="<?php echo $subSubCategory->category_name; ?>" href="<?php echo admin_url('jilancollectionCat/index/' . $subSubCategory->id) ?>">-- <?php echo $subSubCategory->category_name; ?></a>
                                                        </td>
                                                        <td class="text-center"><?php echo $subSubCategory->status == 1 ? 'Active' : 'Inactive'; ?></td>
                                                        <td class="text-center">
                                                            <a class="btn btn-primary btn-xs" href="<?php echo admin_url('jilancollectionCat/index/' . $subSubCategory->id) ?>"><i class="icon-pencil"></i></a>
                                                            <a class="btn btn-danger btn-xs" onclick="return confirm('Are you Sure??\nYou Want to Delete this item!');" href="<?php echo admin_url('jilancollectionCat/delete/' . $subSubCategory->id) ?>">
                                                                <i class="icon-trash"></i>
                                                            </a>
                                                        </td>
                                                    </tr>

                                                    <?php
                                                    $count4 = 1;
                                                    $subSubSubCategories = get('jilancollection_category', array('parent_id' => $subSubCategory->id));
                                                    if (is_array($subSubSubCategories) && !empty($subSubSubCategories)) {

                                                        foreach ($subSubSubCategories as $subSubSubCategory) {
                                                            $count4++;
                                                            ?>

                                                            <tr class="gradeX">
                                                                <td>
                                                                    <a title="<?php echo $subSubSubCategory->category_name; ?>" href="<?php echo admin_url('jilancollectionCat/index/' . $subSubSubCategory->id) ?>"><?php echo $count1 . '.' . $count2 . '.' . $count3 . '.' . $count4; ?></a>
                                                                </td>
                                                                <td>
                                                                    <a style="margin-left: 50px; color: #777" title="<?php echo $subSubSubCategory->category_name; ?>" href="<?php echo admin_url('jilancollectionCat/index/' . $subSubSubCategory->id) ?>">--- <?php echo $subSubSubCategory->category_name; ?></a>
                                                                </td>
                                                                <td class="text-center"><?php echo $subSubSubCategory->status == 1 ? 'Active' : 'Inactive'; ?></td>
                                                                <td class="text-center">
                                                                    <a class="btn btn-primary btn-xs" href="<?php echo admin_url('jilancollectionCat/index/' . $subSubSubCategory->id) ?>"><i class="icon-pencil"></i></a>
                                                                    <a class="btn btn-danger btn-xs" onclick="return confirm('Are you Sure??\nYou Want to Delete this item!');" href="<?php echo admin_url('jilancollectionCat/delete/' . $subSubSubCategory->id) ?>">
                                                                        <i class="icon-trash"></i>
                                                                    </a>
                                                                </td>
                                                            </tr>

                                                            <?php
                                                            $count5 = 1;
                                                            $subSubSubSubCategories = get('jilancollection_category', array('parent_id' => $subSubSubCategory->id));
                                                            if (is_array($subSubSubSubCategories) && !empty($subSubSubSubCategories)) {
                                                                foreach ($subSubSubSubCategories as $subSubSubSubCategory) {
                                                                    $count5++;
                                                                    ?>
                                                                    <tr class="gradeX">
                                                                        <td>
                                                                            <a title="<?php echo $subSubSubSubCategory->category_name; ?>" href="<?php echo admin_url('jilancollectionCat/index/' . $subSubSubSubCategory->id) ?>"><?php echo $count1 . '.' . $count2 . '.' . $count3.'.'.$count4.'.'.$count5; ?></a>
                                                                        </td>
                                                                        <td>
                                                                            <a style="margin-left: 60px; color: #777" title="<?php echo $subSubSubSubCategory->category_name; ?>" href="<?php echo admin_url('jilancollectionCat/index/' . $subSubSubSubCategory->id) ?>">-- <?php echo $subSubSubSubCategory->category_name; ?></a>
                                                                        </td>
                                                                        <td class="text-center"><?php echo $subSubSubSubCategory->status == 1 ? 'Active' : 'Inactive'; ?></td>
                                                                        <td class="text-center">
                                                                            <a class="btn btn-primary btn-xs" href="<?php echo admin_url('jilancollectionCat/index/' . $subSubSubSubCategory->id) ?>"><i class="icon-pencil"></i></a>
                                                                            <a class="btn btn-danger btn-xs" onclick="return confirm('Are you Sure??\nYou Want to Delete this item!');" href="<?php echo admin_url('jilancollectionCat/delete/' . $subSubSubSubCategory->id) ?>">
                                                                                <i class="icon-trash"></i>
                                                                            </a>
                                                                        </td>
                                                                    </tr>
                                                                <?php
                                                                }
                                                            }

                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            ?>
                        </tbody>
                    </table>

                </div>
            </div>
        </section>
    </div>

    <div class="col-lg-5">
        <section class="panel">
            <header class="panel-heading"><?php echo isset($category_id) && !empty($category) ? 'Modify' : 'Add'; ?> Jilan Collection Category</header>

            <div class="panel-body">

                <?php if (!empty($error)): ?>
                    <div class="alert alert-block alert-danger fade in">
                        <button data-dismiss="alert" class="close close-sm" type="button">
                            <i class="fa fa-times"></i>
                        </button>
                        <strong>Error!</strong> <?php echo $error; ?>
                    </div>
                <?php endif; ?>
                <?php if (validation_errors()) { ?>
                    <div class="alert alert-warning fade in">
                        <button type="button" class="close close-sm" data-dismiss="alert">
                            <i class="icon-remove"></i>
                        </button>
                        <?php echo validation_errors(); ?>
                    </div>
                <?php } ?>

                <form class="form-horizontal" role="form" action="" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label class="col-lg-4 col-sm-4 control-label">Category Name</label>
                        <div class="col-lg-8">

                            <?php
                            $setValue = "";
                            if (!empty($category) && $category->parent_id != 0) {
                                $setValue = $category->category_name;
                            }

                            if (!empty($category_id)) {
                                /* if (empty($subCategory) && $category->parent_id == 0) { */
                                if ($category->parent_id == 0) {
                                    $setValue = $category->category_name;
                                }
                            }
                            ?>

                            <input type="text" name="category" value="<?php echo set_value('category', $setValue); ?>" placeholder="Category Name" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-4 col-sm-4 control-label">Parent Category</label>
                        <div class="col-lg-8">
                            <select name="parent_id" class="form-control" >
                                <option value="">-- Select Parent Category --</option>
                                <?php
                                $categories = get('jilancollection_category', array('parent_id' => 0));
                                if (is_array($categories) && !empty($categories)) {
                                    foreach ($categories as $cat) {
                                        ?>
                                        <option style="padding: 5px 10px" value="<?php echo $cat->id; ?>"  <?php
                                        if (!empty($category) && $category->parent_id != 0) {
                                            echo (($category->parent_id != 0) && ($category->parent_id == $cat->id)) ? 'selected' : '';
                                        }
                                        ?>><?php echo $cat->category_name; ?>
                                        </option> 
                                        <?php
                                        $secondLevelParent = get('jilancollection_category', array('parent_id' => $cat->id));
                                        if (is_array($secondLevelParent)) {
                                            foreach ($secondLevelParent as $second) {
                                                ?>
                                                <option class="sub_cat_options" style="margin-left: 25px" value="<?php echo $second->id; ?>" 
                                                <?php
                                                if (!empty($category) && $category->parent_id != 0) {
                                                    echo (($category->parent_id != 0) && ($category->parent_id == $second->id)) ? 'selected' : '';
                                                }
                                                ?>>- <?php echo $second->category_name; ?></option> 

                                                <?php
                                                $thirdLevelParent = get('jilancollection_category', array('parent_id' => $second->id));

                                                if (is_array($thirdLevelParent)) {
                                                    foreach ($thirdLevelParent as $third) {
                                                        ?>
                                                        <option class="sub_cat_options" style="margin-left: 25px" value="<?php echo $third->id; ?>" 
                                                        <?php
                                                        if (!empty($category) && $category->parent_id != 0) {
                                                            echo (($category->parent_id != 0) && ($category->parent_id == $third->id)) ? 'selected' : '';
                                                        }
                                                        ?>
                                                                >-- <?php echo $third->category_name; ?></option> 
                                                                <?php
                                                                $fourthLevelParent = get('jilancollection_category', array('parent_id' => $third->id));
                                                                if (is_array($fourthLevelParent)) {

                                                                    foreach ($fourthLevelParent as $fourth) {
                                                                        ?>
                                                                <option class="sub_cat_options" style="margin-left: 25px" value="<?php echo $fourth->id; ?>" 
                                                                <?php
                                                                if (!empty($category) && $category->parent_id != 0) {
                                                                    echo (($category->parent_id != 0) && ($category->parent_id == $fourth->id)) ? 'selected' : '';
                                                                }
                                                                ?>
                                                                        >--- <?php echo $fourth->category_name; ?></option> 
                                                                        <?php
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-4">Status</label>
                        <div class="col-lg-8">
                            <label class="checkbox-inline">
                                <input type="radio" checked="checked" name="status" value="1" <?php echo!empty($category) && $category->status == 1 ? 'checked' : set_radio('status', 1); ?>> Active
                            </label>
                            <label class="checkbox-inline">
                                <input type="radio" name="status" value="0" <?php echo!empty($category) && $category->status == 0 ? 'checked' : set_radio('status', 0); ?>> Inactive
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-offset-4 col-lg-8">
                            <button type="submit" class="btn btn-danger" name="submit" value="1"><?php echo isset($banner_id) && !empty($banner) ? 'Update' : 'Save'; ?></button>
                        </div>
                    </div>
                </form>
            </div>
        </section>
    </div>
</div>