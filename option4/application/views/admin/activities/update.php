<link rel="stylesheet" type="text/css" href="<?php echo base_url('assets/admin/bootstrap-fileupload/bootstrap-fileupload.css'); ?>" />

<style type="text/css">

    #videosList {
        max-width: 600px; 
        overflow: hidden;
    }

    .video {
        background-image: url('https://img.youtube.com/vi/nZcejtAwxz4/maxresdefault.jpg');
        height: 330px;
        width: 600px;
        margin-bottom: 50px;
    }

    /* Hide Play button + controls on iOS */
    video::-webkit-media-controls {
        display:none !important;
    }

</style>

<script type="text/javascript">

    var figure = $(".video").hover(hoverVideo, hideVideo);
    function hoverVideo(e) {
    $('video', this).get(0).play();
    }

    function hideVideo(e) {
    $('video', this).get(0).pause();
    }
</script>

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
                Update <?php echo $this->_module_name; ?>
                <span class="tools pull-right">
                    <a class="btn btn-info" href="<?php echo admin_url($this->_module); ?>"><span>Manage</span></a>
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
                                $categories = get('activities_category', array('parent_id' => 0));
                                if (is_array($categories) && !empty($categories)) {

                                    foreach ($categories as $cat) {
                                        ?>
                                        <option style="padding: 5px 10px" <?php echo!empty($categories) ? '' : ''; ?> value="<?php echo $cat->id; ?>" <?php echo ($cat->id == $allData->category_id) ? 'selected' : ''; ?>>
                                            <?php echo $cat->category_name; ?>
                                        </option>
                                        <?php
                                        $secondLevel = get('activities_category', array('parent_id' => $cat->id));
                                        if (is_array($secondLevel) && !empty($secondLevel)) {
                                            foreach ($secondLevel as $second) {
                                                ?>
                                                <option class="sub_cat_options" style="margin-left: 25px" value="<?php echo $second->id; ?>"<?php echo ($second->id == $allData->category_id) ? 'selected' : ''; ?> >- <?php echo $second->category_name; ?></option> 
                                                <?php

                                                $thirdLevel = get('activities_category', array('parent_id' => $second->id));
                                                if (is_array($thirdLevel) && !empty($thirdLevel)) {
                                                    foreach ($thirdLevel as $third) {
                                                        ?>
                                                        <option class="sub_cat_options" style="margin-left: 25px" value="<?php echo $third->id; ?>"<?php echo ($third->id == $allData->category_id) ? 'selected' : ''; ?> >- <?php echo $third->category_name; ?></option>
                                                    <?php
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
                            <input type="text" name="title" value="<?php echo!empty($allData->title) ? $allData->title : '' ?>" placeholder="Title" class="form-control" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-2 col-sm-2 control-label">YouTube URL</label>
                        <div class="col-lg-8">
                            <input type="url" name="youtube_url" value="<?php echo!empty($allData->youtube_url) ? $allData->youtube_url : '' ?>" placeholder="YouTube URL" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 col-sm-2 control-label">Video Upload</label>
                        <div class="col-lg-8">
                            <input type="file" name="video_name" value="<?php echo base_url($this->_moduleVideoPath . $allData->video_name); ?>" style="margin-bottom: 10px"  />
                            <span class="label label-danger">NOTE!</span><span style="color: #f00"> Max upload file size 5 MB or 5120 kb. If video file size greater then 5MB or 5120 kb 's that file will not be upload.</span>

                            <br>
                            <div class="gallery photo_preview">
                                <div class="thumbview">
                                    <?php
                                    if (!empty($allData->video_name)) {
                                        ?>
                                        <ul id="old_imageList" class="catPhotoSortable">
                                            <li id="" style="float:none; display: block; width: 100%;">
                                                <div style="width:100%; overflow: hidden; background: #fff; padding: 5px;">
                                                    <div class='thumb' style="width:160px; overflow: hidden;float: left; background: #fff; padding: 5px; margin-right: 12px;">
                                                        <img src='<?php echo base_url('assets/frontend/images/no-preview.png'); ?>'>

                                                        <a class="delete_info" style="position: absolute;bottom: 6px; left: 5px;" href="<?php echo admin_url($this->_module . '/delete_video/' . $allData->activities_id); ?>" onclick="return confirm('Are you sure?? \n You want to removed this Video!');">
                                                            <span class="btn btn-danger btn-xs" title="Delete this photo"><i class="glyphicon glyphicon-remove"></i></span></a>
                                                    </div><!--thumb-->
                                                </div>

                                            </li>
                                        </ul>
                                        <?php
                                    }
                                    ?>

                                    <div class="clear0"></div>
                                </div><!--gridview-->
                            </div>


                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-2 col-sm-2 control-label">Image Upload</label>
                        <div class="col-lg-10">
                            <input type="file" style="border:0px; height:auto; padding:0; background-color:unset; margin-bottom: 10px" name="activities_images[]" value="" id="" multiple="multiple" onchange="readMultipleURL(this)">
                            <span class="label label-danger">NOTE!</span><span> For best view please upload image 625px X 940px or 495px X 800px.</span>
                            <br>
                            <div class="gallery photo_preview">
                                <div class="thumbview">
                                    <ul id="imageList"> </ul> 
                                    <?php
                                    if (!empty($allData)) {
                                        $photos = getAllMedia('media', $allData->activities_id, 'activities');
                                        ?>
                                        <?php if (!empty($photos)) { ?>
                                            <ul id="old_imageList" class="catPhotoSortable">                                    
                                                <?php foreach ($photos as $key => $photo) { ?>
                                                    <li id="order_<?php echo $photo->id; ?>" style="float:none; display: block; width: 100%;">
                                                        <div style="width:100%; overflow: hidden; background: #fff; padding: 5px;">
                                                            <div class='thumb' style="width:160px; overflow: hidden;float: left; background: #fff; padding: 5px; margin-right: 12px;">
                                                                <img src='<?php echo base_url($this->_moduleImagePath . 'thumbs/' . $photo->images); ?>'>

                                                                <a class="delete_info" style="position: absolute;bottom: 6px; left: 5px;" href="<?php echo admin_url($this->_module . '/delete_photo/' . $photo->id . '/' . $photo->typeid); ?>" onclick="return confirm('Are you Sure??\nYou Want to Removed this Photo!');">
                                                                    <span class="btn btn-danger btn-xs" title="Delete this photo"><i class="glyphicon glyphicon-remove"></i></span></a>

                                                            </div><!--thumb-->
                                                            <div class='infos' style="width:600px; float: left;">
                                                                <p><input style="width: 100%; margin-top: 5px;" type='text' placeholder='Caption' name='caption_old[<?php echo $key; ?>]' value="<?php echo $photo->title; ?>"></p>
                                                                <p><textarea style="width: 100%; padding: 5px;" name='image_details_old[<?php echo $key; ?>]' placeholder='Image Details' rows='4' cols='13'><?php echo $photo->image_details; ?></textarea></p>

                                                            </div><!--info-->
                                                        </div>

                                                    </li>
                                                <?php } ?>
                                            </ul>
                                            <?php
                                        }
                                    }
                                    ?>

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

<script type="text/javascript">

                                                                    var baseurl = '<?php echo base_url(); ?>';
//For Multiple Image upload                                                                     
                                                                    function readMultipleURL(input) {
                                                                    // show the loader
                                                                    $('#loader').show();
                                                                    var j = 0;
                                                                    // removed the existing li
                                                                    $('#imageListli').remove();
                                                                    for (var i = 0; i < input.files.length; i++) {
                                                                            if (input.files && input.files[i]) {
                                                                    var reader = new FileReader();
                                                                    reader.onload = function(e) {
                                                                    var html = "<div style='width:100%; overflow: hidden; background: #fff; pa dding: 5px;'>";
                                                                    html += "<div class='th u mb' style='width:160px; overflow: hidden;float: left; background :  #fff; padding: 5px; margin-right: 12px;'>";
                                                                    html += "<img width='148' height='107' src=' " + e.target.result + " '>";
                                                                        html += "</div><!--thumb-->";
                html += "<div class='infos' style='width :600px; float: left;'>";
                html += "<p><input style='width: 100%; margin-top: 5px;' type='text' placeholder='Caption' name='caption[]' value=''></p>";
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