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
                Add <?php echo  $this->_module_name ?>
                <span class="tools pull-right">
                    <a class="btn btn-info" href="<?php echo admin_url('blog'); ?>"><span>Manage</span></a>
                </span>
            </header>
            <div class="panel-body">
                <form class="form-horizontal" role="form" action="" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label class="col-lg-2 col-sm-2 control-label">Title<span class="req"> * </span></label>
                        <div class="col-lg-9">
                            <input type="text" name="title" required value="<?php echo set_value('title'); ?>" placeholder="Title" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 col-sm-2 control-label">Summary<span class="req"> * </span></label>
                        <div class="col-lg-9">
                            <textarea name="summary" rows="3" required placeholder="Summary" class="form-control"><?php echo set_value('summary'); ?></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 col-sm-2 control-label">Description<span class="req"> * </span></label>
                        <div class="col-lg-9">
                            <textarea name="description" required rows="15" placeholder="Description" class="form-control"><?php echo set_value('description'); ?></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 col-sm-2 control-label">Image<span class="req"> * </span></label>
                        <div class="col-lg-9">
                            <input type="file" name="image" class="form-control" required/>
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