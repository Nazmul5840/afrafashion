<!--dynamic table-->
<link href="<?php echo base_url('assets/admin/advanced-datatable/media/css/demo_page.css'); ?>" rel="stylesheet" />
<link href="<?php echo base_url('assets/admin/advanced-datatable/media/css/demo_table.css'); ?>" rel="stylesheet" />

<div class="row">
    <div class="col-sm-12">
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
                Manage Jilan Blogs
                <span class="tools pull-right">
                    <a class="btn btn-info" href="<?php echo admin_url('blog/add'); ?>"><span>Add New</span></a>
                </span>
            </header>
            <div class="panel-body">
                <div class="adv-table">
                    <table class="display table table-bordered" id="hidden-table-info">
                        <thead>
                            <tr>
                                <th width="5%">SL#</th>
                                <th class="" width="15%">Image</th>
                                <th class="" width="15%">Title</th>
                                <th class="" width="50%">Summary</th>
                                <th class="" width="15%">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            if (!empty($allData)) {
                                foreach ($allData as $key => $data) {
                                    ?>

                                    <tr class="gradeX">
                                        <td><?php echo $key + 1; ?></td>
                                        <td>
                                            <?php
                                            $photos = getAllMedia('media', $data->id, 'blog');
                                            if (!empty($photos)) {
                                                ?>
                                                <?php foreach ($photos as $key => $photo) { ?>
                                                    <div class='thumb' style="">
                                                        <a title="<?php echo $photo->title; ?>" class="fancybox" href="<?php echo base_url('assets/media/blog/original/' . $photo->images); ?>" data-fancybox-group="gallery">
                                                            <img src='<?php echo base_url('assets/media/blog/original/' . $photo->images); ?>' style=" width: 100px; height: 100px;">
                                                        </a>
                                                    </div><!--thumb-->
                                                    <?php
                                                    break;
                                                }
                                                ?>
                                            <?php } ?>
                                        </td>
                                        <td>
                                            <a title="Summary" href="<?php echo admin_url('blog/view/' . $data->id) ?>">
                                            <?php
                                            echo $data->title;
                                            ?>
                                            </a>
                                        </td>
                                        <td class="">
                                            <?php echo $data->summary; ?>
                                        </td>

                                        <td class="">
                                            <a class="btn btn-success btn-xs" href="<?php echo admin_url('blog/view/' . $data->id); ?>"><i class="icon-eye-open"></i></a>
                                            <a class="btn btn-primary btn-xs" href="<?php echo admin_url('blog/update/' . $data->id) ?>"><i class="icon-pencil"></i></a>
                                            <a class="btn btn-danger btn-xs" onclick="return confirm('Are you Sure??\nYou Want to Delete this item!');" href="<?php echo admin_url('blog/delete/' . $data->id) ?>">
                                                <i class="icon-trash"></i>
                                            </a>
                                        </td>
                                    </tr>
                                    <?php
                                }
                            }
                            ?>
                        </tbody>
                    </table>

                </div>
            </div>
        </section>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        $(".fancybox").fancybox();
    });
</script>