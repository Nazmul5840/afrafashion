<!--dynamic table-->
<link href="<?php echo base_url('assets/admin/advanced-datatable/media/css/demo_page.css'); ?>" rel="stylesheet" />
<link href="<?php echo base_url('assets/admin/advanced-datatable/media/css/demo_table.css'); ?>" rel="stylesheet" />
<script type="text/javascript" src="<?php echo base_url('assets/admin/jquery-ui/jquery-ui-1.9.2.custom.min.js'); ?>"></script>

<div class="row">
    <div class="col-sm-7">
        <div id="response"></div>
        <section class="panel">

            <header class="panel-heading">
                Manage <?php echo $this->_module_name; ?>
            </header>
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
                                <th width="10%">SL#</th>
                                <th class="text-center" width="20%">Category Name</th>
                                <th class="text-center" width="20%">Action</th>
                            </tr>
                        </thead>
                        <tbody class="">
                            <?php
                            $count = 0;
                            $result = get('activities_category', array('parent_id' => 0));

                            if (is_array($result) && !empty($result)) {
                                foreach ($result as $obj) {
                                    $count++;
                                    ?>
                                    <tr class="gradeX">
                                        <td>
                                            <a title="<?php echo $obj->category_name; ?>" href="<?php echo admin_url($this->_module. '/index/' . $obj->id) ?>"><?php echo $count; ?></a>
                                        </td>
                                        <td>
                                            <a style="color: #000" title="<?php echo $obj->category_name; ?>" href="<?php echo admin_url($this->_module . '/index/' . $obj->id) ?>"><?php echo $obj->category_name; ?></a>
                                        </td>
                                        <td class="text-center">
                                            <a class="btn btn-primary btn-xs" href="<?php echo admin_url($this->_module . '/index/' . $obj->id) ?>"><i class="icon-pencil"></i></a>
                                            <a class="btn btn-danger btn-xs" onclick="return confirm('Are you Sure??\nYou Want to Delete this item!');" href="<?php echo admin_url($this->_module . '/delete/' . $obj->id) ?>">
                                                <i class="icon-trash"></i>
                                            </a>
                                        </td>
                                    </tr>
                                    <?php
                                    $count1 = 1;
                                    $result = get('activities_category', array('parent_id' => $obj->id));
                                    if (is_array($result) && !empty($result)) {
                                        foreach ($result as $obj) {
                                            ?>
                                            <tr class="gradeX">
                                                <td>
                                                    <a title="<?php echo $obj->category_name; ?>" href="<?php echo admin_url($this->_module. '/index/' . $obj->id) ?>"><?php echo $count . '.' . $count1; ?></a>
                                                </td>
                                                <td>
                                                    <a style="margin-left: 20px; color: #777" title="<?php echo $obj->category_name; ?>" href="<?php echo admin_url($this->_module . '/index/' . $obj->id) ?>">- <?php echo $obj->category_name; ?></a>
                                                </td>
                                                <td class="text-center">
                                                    <a class="btn btn-primary btn-xs" href="<?php echo admin_url($this->_module . '/index/' . $obj->id) ?>"><i class="icon-pencil"></i></a>
                                                    <a class="btn btn-danger btn-xs" onclick="return confirm('Are you Sure??\nYou Want to Delete this item!');" href="<?php echo admin_url($this->_module . '/delete/' . $obj->id) ?>">
                                                        <i class="icon-trash"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                            <?php
                                            $count1++;
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
            <header class="panel-heading"><?php echo isset($category_id) && !empty($category) ? 'Modify' : 'Add'; ?> Entertainment Category</header>
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
                        <label class="col-lg-4 col-sm-4 control-label">Category Name </label>
                        <div class="col-lg-8">
                            <input type="text" name="category" value="<?php
                            echo!empty($category) && $category->parent_id != 0 ? $category->category_name : set_value('category');
                            if (!empty($category_id)) {
                                if (empty($subCategory) && $category->parent_id == 0) {
                                    echo $category->category_name;
                                }
                            }
                            ?>" placeholder="Category Name" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-4 col-sm-4 control-label">Parent Category</label>
                        <div class="col-lg-8">
                            <select name="parent_id" class="form-control" >
                                <option value="">-- Select Parent Category --</option>
                                <?php
                                $result = get('activities_category', array('parent_id' => 0));

                                if (is_array($result) && !empty($result)) {

                                    foreach ($result as $obj) {
                                        ?>
                                        <option style="padding: 5px 10px" value="<?php echo $obj->id; ?>"  <?php
                                        if (!empty($category) && $category->parent_id != 0) {
                                            echo (($category->parent_id != 0) && ($category->parent_id == $obj->id)) ? 'selected' : '';
                                        }
                                        ?>><?php echo $obj->category_name; ?></option> 
                                                <?php
                                                $result = get('activities_category', array('parent_id' => $obj->id));
                                                if (is_array($result)) {
                                                    foreach ($result as $obj) {
                                                        ?>
                                                <option class="sub_cat_options" style="margin-left: 25px" value="<?php echo $obj->id; ?>" > - <?php echo $obj->category_name; ?></option>
                                                <?php
                                                        $result = get('activities_category', array('parent_id' => $obj->id));
                                                        if (is_array($result)) {
                                                            foreach ($result as $obj) { ?>
                                                                <option class="sub_cat_options" style="margin-left: 25px" value="<?php echo $obj->id; ?>" disabled > - <?php echo $obj->category_name; ?></option>
                                                            <?php }
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
                        <div class="col-lg-offset-4 col-lg-8">
                            <button type="submit" class="btn btn-danger" name="submit" value="1"><?php echo isset($category_id) && !empty($category) ? 'Update' : 'Save'; ?></button>
                        </div>
                    </div>
                </form>
            </div>
        </section>
    </div>
</div>


