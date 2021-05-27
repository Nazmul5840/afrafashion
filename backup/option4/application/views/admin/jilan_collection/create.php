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
                Add Diones Collection
                <span class="tools pull-right">
                    <a class="btn btn-info" href="<?php echo admin_url('jilancollection'); ?>"><span>Manage</span></a>
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
                                $categories = get('jilancollection_category', array('parent_id' => 0));
                                if (is_array($categories) && !empty($categories)) {
                                    foreach ($categories as $cat) {
                                        $checkExist = checkExist('jilancollection', array('category_id' => $cat->id));
                                        if ($checkExist == FALSE) {
                                            ?>
                                            <option style="padding: 5px 10px"  value="<?php echo $cat->id; ?>"><?php echo $cat->category_name; ?></option>
                                        <?php } else {
                                            ?>
                                            <option style="padding: 5px 10px" <?php echo!empty($categories) ? 'disabled' : ''; ?> value="<?php echo $cat->id; ?>">
                                                <?php echo $cat->category_name; ?>
                                            </option>

                                            <?php
                                            $secondLevel = get('jilancollection_category', array('parent_id' => $cat->id));
                                            if (is_array($secondLevel) && !empty($secondLevel)) {
                                                foreach ($secondLevel as $second) {
                                                    ?>
                                                    <option class="sub_cat_options"  style="margin-left: 25px" value="<?php echo $second->id; ?>" <?php echo set_select('category', $second->id); ?> >- <?php echo $second->category_name; ?></option>
                                                    <?php
                                                    $thirdLevel = get('jilancollection_category', array('parent_id' => $second->id));
                                                    if (is_array($thirdLevel) && !empty($thirdLevel)) {
                                                        foreach ($thirdLevel as $third) {
                                                            ?>
                                                            <option class="sub_cat_options"  style="margin-left: 25px" value="<?php echo $third->id; ?>" <?php echo set_select('category', $third->id); ?> >-- <?php echo $third->category_name; ?></option>
                                                            <?php
                                                            $fourthLevel = get('jilancollection_category', array('parent_id' => $third->id));
                                                            if (is_array($fourthLevel) && !empty($fourthLevel)) {
                                                                foreach ($fourthLevel as $fourth) {
                                                                    ?>
                                                                    <option class="sub_cat_options"  style="margin-left: 25px" value="<?php echo $fourth->id; ?>" <?php echo set_select('category', $fourth->id); ?> >--- <?php echo $fourth->category_name; ?></option>
                                                                    <?php
                                                                    $fifthLevel = get('jilancollection_category', array('parent_id' => $fourth->id));
                                                                    if (is_array($fifthLevel) && !empty($fifthLevel)) {
                                                                        foreach ($fifthLevel as $fifth) {
                                                                        ?>
                                                                            <option class="sub_cat_options" style="margin-left: 40px" value="<?php echo $fifth->id; ?>" <?php echo set_select('category', $fifth->id); ?> >--- <?php echo $fifth->category_name; ?></option>
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
                        <label class="col-lg-2 col-sm-2 control-label">Price</label>
                        <div class="col-lg-9">
                            <input type="number" name="price" min="0" value="<?php echo set_value('price'); ?>" placeholder="Price" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 col-sm-2 control-label">Description</label>
                        <div class="col-lg-9">
                            <textarea name="description" rows="10" required class="form-control"><?php echo set_value('description'); ?></textarea>
                        </div>
                    </div>
<!--                    <div class="form-group">-->
<!--                        <label class="col-lg-2 col-sm-2 control-label">Dimention</label>-->
<!--                        <div class="col-lg-9">-->
<!--                            <textarea name="dimention" class="form-control">--><?php //echo set_value('dimention'); ?><!--</textarea>-->
<!--                        </div>-->
<!--                    </div>-->
<!--                    <div class="form-group">-->
<!--                        <label class="col-lg-2 col-sm-2 control-label">Featured</label>-->
<!--                        <div class="col-lg-9">-->
<!--                            <input type="text" name="featured" value="--><?php //echo set_value('featured'); ?><!--" placeholder="Featured" class="form-control" />-->
<!--                        </div>-->
<!--                    </div>-->
<!--                    <div class="form-group">-->
<!--                        <label class="col-lg-2 col-sm-2 control-label">Model Size</label>-->
<!--                        <div class="col-lg-9">-->
<!--                            <input type="text" name="model_size" value="--><?php //echo set_value('model_size'); ?><!--" placeholder="S,M,XL,XXL,L" class="form-control" />-->
<!--                        </div>-->
<!--                    </div>-->
                    <div class="form-group">
                        <label class="col-lg-2 col-sm-2 control-label">Popular</label>
                        <div class="col-lg-9">
                            <select name="is_popular" class="form-control" required>
                                <option <?php echo  set_select('is_popular', 'no'); ?> value="no">No</option>
                                <option <?php echo  set_select('is_popular', 'yes'); ?> value="yes">Yes</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-2 col-sm-2 control-label">Featured</label>
                        <div class="col-lg-9">
                            <select name="is_featured" class="form-control" required>
                                <option <?php echo  set_select('is_featured', 'no'); ?> value="no">No</option>
                                <option <?php echo  set_select('is_featured', 'yes'); ?> value="yes">Yes</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-2 col-sm-2 control-label">Latest</label>
                        <div class="col-lg-9">
                            <select name="is_latest" class="form-control" required>
                                <option <?php echo  set_select('is_latest', 'no'); ?> value="no">No</option>
                                <option <?php echo  set_select('is_latest', 'yes'); ?> value="yes">Yes</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-2 col-sm-2 control-label">Photo</label>
                        <div class="col-lg-10">
                            <input type="file" required style="border:0px; height:auto; padding:0; background-color:unset; margin-bottom: 10px" name="cart_photo"  value="" id=""/>
                            <span class="label label-danger">NOTE!</span><span> For best view please upload image 400px X 250px.</span>
                        </div>
                    </div>

<!--                    <div class="form-group">-->
<!--                        <label class="col-lg-2 col-sm-2 control-label">Photo</label>-->
<!--                        <div class="col-lg-10">-->
<!--                            <input type="file" style="border:0px; height:auto; padding:0; background-color:unset; margin-bottom: 10px" name="jilancollection_images[]" multiple="multiple" value="" id="" onchange="readMultipleURL(this)">-->
<!--                            <span class="label label-danger">NOTE!</span><span> For best view please upload image 625px X 940px or 495px X 800px.</span>-->
<!--                            <br>-->
<!--                            <div class="gallery photo_preview">-->
<!--                                <div class="thumbview">-->
<!--                                    <ul id="imageList"> </ul>-->
<!--                                    <div class="clear0"></div>-->
<!--                                </div>
                            </div>-->
<!---->
<!--                        </div>-->
<!---->
<!--                    </div>-->

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

<script type="text/javascript">

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


    var html = "<div style='width:100%; overflow: hidden; background: #fff; padding: 5px;'>";
    html += "<div class='thumb' style='width:160px; overflow: hidden;float: left; background: #fff; padding: 5px; margin-right: 12px;'>";
    html += "<img width='148' height='107' src=' " + e.target.result + " '>";
    html += "</div><!--thumb-->";
    html += "<div class='infos' style='width :600px; float: left;'>";
    html += "<p><input style='width: 100%; margin-top: 5px;' type='text' placeholder='Caption' name='caption' value=''></p>";
    html += "<p><textarea style='width: 100%; padding: 5px;' name='image_details' placeholder='Image Details' rows='4' cols='13'></textarea></p>";
    html += "</div><!--info-->";                                          
    html += "</div>";
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