<link rel="stylesheet" type="text/css" href="<?php echo base_url('assets/admin/bootstrap-fileupload/bootstrap-fileupload.css'); ?>" />

<div class="row">
    <div class="col-lg-12">
        <section class="panel">
            <header class="panel-heading">
                <?php echo $pageTitle; ?>
                <span class="tools pull-right">
                    <a class="iconlink btn btn-info" href="<?php echo admin_url('jilancollection'); ?>"><span>Manage</span></a>
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
                                $productRelation = $this->global_model->getCategoryNameByProductRelationIds($get_info->jilancollection_id);
                                echo!empty($productRelation) ? $productRelation : "";
                                ?>
                            </td>
                        </tr>
                        <tr>
                            <td>Price</td>
                            <td> : </td>
                            <td> <?php echo convertAmount($get_info->price); ?>  </td>
                        </tr>
                        <tr>
                            <td>Description</td>
                            <td> : </td>
                            <td> <?php echo nl2br($get_info->description); ?>  </td>
                        </tr>

                        <tr>
                            <td>Created</td>
                            <td> : </td>
                            <td> <?php echo longDateHuman($get_info->created, 'full'); ?>  </td>
                        </tr>
                    </tbody>
                </table>

                <?php
                $photos = getAllMedia('media', $get_info->jilancollection_id, 'jilancollection');
                if (!empty($photos)) {
                    ?>
                    <div class="gallery photo_preview">
                        <div class="thumbview">
                            <ul class="catPhotoSortable">                                    
                                <?php foreach ($photos as $key => $photo) { ?>
                                    <li style="width: 15%">
                                        <div class='thumb' style="width: 100%">
                                            <a title="<?php echo $photo->title; ?>" class="fancybox" href="<?php echo base_url('assets/media/jilancollection/original/' . $photo->images); ?>" data-fancybox-group="gallery">
                                                <img src='<?php echo base_url('assets/media/jilancollection/thumbs/' . $photo->images); ?>' style="height: auto">
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