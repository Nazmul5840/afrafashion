<link rel="stylesheet" type="text/css" href="<?php echo base_url('assets/admin/bootstrap-fileupload/bootstrap-fileupload.css'); ?>" />

<div class="row">
    <div class="col-lg-12">
        <section class="panel">
            <header class="panel-heading">
                <?php echo $pageTitle; ?>
                <span class="tools pull-right">
                    <a class="iconlink btn btn-info" href="<?php echo admin_url($this->_module); ?>"><span>Manage</span></a>
                </span>
            </header>
            <div class="panel-body">
                <table class="table">
                    <colgroup>
                        <col width="20%">
                        <col width="3%">
                        <col width="70%">
                    </colgroup>
                    <tbody>
                        <tr>
                            <td>Title</td>
                            <td> : </td>
                            <td> <?php echo $get_info->title; ?>  </td>
                        </tr>

                        <tr>
                            <td>Category</td>
                            <td> : </td>
                            <td> 
                                <?php
                                $activitiesRelation = $this->global_model->getCategoryNameByActivitiesRelationIds($get_info->activities_id);
                                echo!empty($activitiesRelation) ? $activitiesRelation : "";
                                ?>
                            </td>
                        </tr>

                        <tr>
                            <td>Video</td>
                            <td> : </td>
                            <td> 
                                <?php
                                if (!empty($get_info->video_name)) {
                                    $videoUrl = base_url($this->_moduleVideoPath . $get_info->video_name);
                                    ?>
                                    <a title="Video" href="<?php echo $videoUrl; ?>" >Play</a>
                                    <?php
                                } else {
                                    echo "N/a";
                                }
                                ?>
                            </td>
                        </tr>

                        <tr>
                            <td>YouTube URL</td>
                            <td> : </td>
                            <td> 
                                <?php echo!empty($get_info->youtube_url) ? trim($get_info->youtube_url) : "N/a"; ?>
                            </td>
                        </tr>
                        <tr>
                            <td>Created</td>
                            <td> : </td>
                            <td> <?php echo longDateHuman($get_info->created, 'full'); ?>  </td>
                        </tr>
                    </tbody>
                </table>

                <?php
                $photos = getAllMedia('media', $get_info->activities_id, 'activities');
                if (!empty($photos)) {
                    ?>
                    <div class="gallery photo_preview">
                        <div class="thumbview">
                            <ul class="catPhotoSortable">                                    
                                <?php foreach ($photos as $key => $photo) { ?>
                                    <li style="width: 15%">
                                        <div class='thumb' style="width: 100%">
                                            <a title="<?php echo $photo->title; ?>" class="fancybox" href="<?php echo base_url($this->_moduleImagePath . 'original/' . $photo->images); ?>" data-fancybox-group="gallery">
                                                <img src='<?php echo base_url($this->_moduleImagePath . 'thumbs/' . $photo->images); ?>' style="height: auto">
                                            </a>
                                            <div class='infos'>
                                                <p><strong><?php echo $photo->title; ?></strong></p>
                                            </div><!--info-->
                                        </div><!--thumb-->
                                    </li>
                                <?php } ?>
                            </ul>
                        </div>
                    </div>
                <?php } ?>
            </div>
        </section>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        $(".fancybox").fancybox();
    });
</script>