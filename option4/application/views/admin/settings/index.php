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

        <?php if ($this->session->flashdata('success_msg')) { ?>
            <div class="alert alert-success fade in">
                <button data-dismiss="alert" class="close close-sm" type="button">
                    <i class="icon-remove"></i>
                </button>
                <?php echo $this->session->flashdata('success_msg'); ?>
            </div>
        <?php } ?>

        <section class="panel">
            <header class="panel-heading">
                Add <?php echo $this->_module_name; ?>
            </header>
            <div class="panel-body">
                <form class="form-horizontal" role="form" action="" method="post" enctype="multipart/form-data">
                    <?php
                    if(!empty($types)) {
                        foreach($types as $type) {
                    ?>
                    <div class="form-group">
                        <label class="col-lg-2 col-sm-2 control-label"><?php echo ucwords( str_replace('_',' ',$type) ); ?><span class="req"> * </span></label>
                        <div class="col-lg-8">
                            <input type="text" name="<?php echo $type; ?>" value="<?php echo array_key_exists($type,$settingsdata) ? $settingsdata[$type] :''; ?>" placeholder="<?php echo ucwords( str_replace('_',' ',$type) ); ?>" class="form-control" />
                        </div>
                    </div>
                    <?php } } ?>

                    <div class="form-group">
                        <div class="col-lg-offset-2 col-lg-10">
                            <button type="submit" class="btn btn-danger" name="save" value="1">Save</button>
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
            reader.onload = function(e) {

                var html = "<div style='width:100%; overflow: hidden; back g round: #fff; padding: 5px;'>";
                html += "<div class='thumb' style='width:160px; overflow: hidden;float: left; background: #fff; padding: 5px; margin-right: 12px;'>";
                html += "<img width='148' height='107' src=' " + e.target.result + " '>";
                html += "</div><!--thumb-->";
                html += "<div class='infos' style='width :600px; float: left;'>";
                html += "<p><input style='width: 100%; margin-top: 5px;' type='text' name='caption[]' placeholder='Caption' value=''></p>";
                html += "<p><textarea style='width: 100%; padding: 5px;' name='image_details[]' placeholder='Image Details' rows='4' cols='13'></textarea></p>";
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