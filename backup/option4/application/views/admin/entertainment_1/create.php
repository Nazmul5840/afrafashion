<link rel="stylesheet" type="text/css" href="<?php echo base_url('assets/admin/bootstrap-fileupload/bootstrap-fileupload.css'); ?>" />
<div class="row">
    <div class="col-lg-12">
        <?php if (!empty($error)): ?>
            <div class="alert alert-block alert-danger fade in">
                <button data-dismiss="alert" class="close close-sm" type="button">
                    <i class="fa fa-times"></i>
                </button>
                <strong>Error!</strong> <?php echo $error; ?>
            </div>
        <?php endif; ?>

        <section class="panel">
            <header class="panel-heading">
                Add Entertainment
                <span class="tools pull-right">
                    <a class="btn btn-info" href="<?php echo admin_url('entertainment'); ?>"><span>Manage</span></a>
                </span>
            </header>
            <div class="panel-body">
                <form class="form-horizontal" role="form" action="" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label class="col-lg-2 col-sm-2 control-label">Category Name<span class="req"> * </span></label>
                        <div class="col-lg-9">
                            <select name="category" class="form-control" >
                                <option value="">-- Select Category --</option>
                                <?php
                                $result = get('entertainment_category', array('parent_id' => 0));
                                if (is_array($result) && !empty($result)) {
                                    foreach ($result as $obj) {
                                        $results = get('entertainment_category', array('parent_id' => $obj->id));
                                        ?>
                                        <?php
                                        $checkExist = checkExist('entertainment', array('category_id' => $obj->id));
                                        if ($checkExist == FALSE || $results) {
                                            ?>
                                            <option style="padding: 5px 10px" disabled value="<?php echo $obj->id; ?>"  <?php
                                            if (!empty($category) && $category->parent_id != 0) {
                                                echo (($category->parent_id != 0) && ($category->parent_id == $obj->id)) ? 'selected' : '';
                                            }
                                            ?>><?php echo $obj->category_name; ?>

                                            </option>

                                        <?php } else { ?>
                                            <option style="padding: 5px 10px" <?php echo!empty($results) ? 'disabled' : ''; ?> value="<?php echo $obj->id; ?>"  <?php
                                            if (!empty($category) && $category->parent_id != 0) {
                                                echo (($category->parent_id != 0) && ($category->parent_id == $obj->id)) ? 'selected' : '';
                                            }
                                            ?>><?php echo $obj->category_name; ?>

                                            </option>

                                        <?php } ?>

                                        <?php
                                        $result = get('entertainment_category', array('parent_id' => $obj->id));
                                        if (is_array($result)) {
                                            foreach ($result as $obj) {
                                                ?>

                                                <?php
                                                $checkExist = checkExist('entertainment', array('category_id' => $obj->id));
                                                if ($checkExist == FALSE) {
                                                    ?>

                                                    <option class="sub_cat_options" style="margin-left: 35px" value="<?php echo $obj->id; ?>" > - <?php echo $obj->category_name; ?></option> 
                                                <?php } else { ?>
                                                    <option class="sub_cat_options" style="margin-left: 35px" value="<?php echo $obj->id; ?>" > - <?php echo $obj->category_name; ?></option> 

                                                    <?php
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
                        <label class="col-lg-2 col-sm-2 control-label">Title<span class="req"> * </span></label>
                        <div class="col-lg-9">
                            <input type="text" name="title" value="<?php echo set_value('title'); ?>" placeholder="Title" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 col-sm-2 control-label">Description</label>
                        <div class="col-lg-10">
                            <textarea class="form-control mceEditor" name="description" rows="3"><?php echo set_value('description') ?></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 col-sm-2 control-label">Choose Photos</label>
                        <div class="col-lg-10">
                            <input type="file" style="border:0px; height:auto; padding:0; background-color:unset; margin-bottom: 10px" name="entertainment_images[]" value="" id="" multiple="multiple" onchange="readMultipleURL(this)">
                            <span class="label label-danger">NOTE!</span><span> For best view please upload image 625px X 940px or 495px X 800px.</span>
                            <br>
                            <div class="gallery photo_preview">
                                <div class="thumbview">
                                    <ul id="imageList"> </ul> 
                                    <div class="clear0"></div>
                                </div><!--gridview-->
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-lg-offset-2 col-lg-10">
                            <button type="submit" class="btn btn-danger" name="submit" value="1">Save</button>
                        </div>
                    </div>
                </form>
            </div>
        </section>
    </div>
</div>

<script>

    //For Multiple Image upload
    function readMultipleURL(input) {
        // show the loader
        $('#loader').show();
        var j = 0;
        // removed the existing li
        $('#imageList li').remove();
        for (var i = 0; i < input.files.length; i++) {
            if (input.files && input.files[i]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    var html = "<li><div class='thumb'><img src='" + e.target.result + "'>";
                    html += "<div class='infos'>";
                    html += "<p><input type='text' placeholder='Caption' name='caption[]'></p>";
                    html += "</div><!--info--></div><!--thumb--></li>";
                    $('#imageList').append(html);
                    j++;
                };
                reader.readAsDataURL(input.files[i]);
            }
        }

        $('#loader').show(0).delay(2000).hide(0);
    }
</script>

<script type="text/javascript">
    $(document).ready(function () {
        var maxField = 10; //Input fields increment limitation
        var addButton = $('.add_button'); //Add button selector
        var wrapper = $('.field_wrapper'); //Input field wrapper
        var fieldHTML = '<div style="margin-bottom: 10px"><input style="width: 25%; float: left; margin-right: 5px" type="file" name="file[]" value="" /><a href="javascript:void(0);" class="remove_button" title="Remove field"><img style="margin-top: 10px; width: 18px;" src="<?php echo base_url('assets/admin/img/remove-icon.png') ?>"/></a></div><div class="clearfix"></div>'; //New input field html 
        var x = 1; //Initial field counter is 1
        $(addButton).click(function () { //Once add button is clicked
            if (x < maxField) { //Check maximum number of input fields
                x++; //Increment field counter
                $(wrapper).append(fieldHTML); // Add field html
            }
        });
        $(wrapper).on('click', '.remove_button', function (e) { //Once remove button is clicked
            e.preventDefault();
            $(this).parent('div').remove(); //Remove field html
            x--; //Decrement field counter
        });
    });
</script>