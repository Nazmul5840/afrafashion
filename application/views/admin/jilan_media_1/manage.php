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
                Manage Jilan Media
                <span class="tools pull-right">
                    <a class="btn btn-info" href="<?php echo admin_url('jilanmedia/add'); ?>"><span>Add New</span></a>
                </span>
            </header>
            <div class="panel-body">
                <div class="adv-table">
                    <table class="display table table-bordered" id="hidden-table-info">
                        <thead>
                            <tr>
                                <th width="8%">SL#</th>
                                <th class="" width="10%">Photo</th>
                                <th class="" width="12%">Category</th>
                                <th class="" width="12%">Sub-Category</th>
                                <th class="" width="20%">Title</th>
                                <th class="" width="8%">Status</th>
                                <th class="" width="8%">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            if (!empty($allData)) {
                                foreach ($allData as $key => $data) {
                                    $result = $this->global_model->get_data('jilanmedia_category', array('id' => $data->parent_id));
                                    ?>

                                    <tr class="gradeX">
                                        <td><a title="Edit" href="<?php echo admin_url('jilanmedia/update/' . $data->jilanmedia_id) ?>"><?php echo $key + 1; ?></a></td>

                                        <td class="">
                                            <?php
                                            $photos = getAllMedia('media', $data->jilanmedia_id, 'jilanmedia');
                                            if (!empty($photos)) {
                                                ?>                                  
                                                <?php foreach ($photos as $key => $photo) { ?>
                                                    <div class='thumb' style="">
                                                        <a title="<?php echo $photo->title; ?>" class="fancybox" href="<?php echo base_url('assets/media/jilanmedia/original/' . $photo->images); ?>" data-fancybox-group="gallery">
                                                            <img src='<?php echo base_url('assets/media/jilanmedia/original/' . $photo->images); ?>' style=" width: 100px; height: 100px;">
                                                        </a>
                                                    </div><!--thumb-->
                                                    <?php
                                                    break;
                                                }
                                                ?>
                                            <?php } ?>
                                        </td>

                                        <td>
                                            <?php if ($data->parent_id == 0) { ?>
                                                <a title="Edit" href="<?php echo admin_url('jilanmedia/update/' . $data->jilanmedia_id) ?>"><?php echo $data->category_name; ?></a>
                                            <?php } else { ?>
                                                <a title="Edit" href="<?php echo admin_url('jilanmedia/update/' . $data->jilanmedia_id) ?>"><?php echo $result['category_name']; ?></a>
                                            <?php } ?>

                                        </td>
                                        <td>
                                            <?php if ($data->parent_id != 0) { ?>
                                                <a title="Edit" href="<?php echo admin_url('jilanmedia/update/' . $data->jilanmedia_id) ?>"><?php echo $data->category_name; ?></a>
                                            <?php } ?>
                                        </td>
                                        <td class="">
                                            <a title="Edit" href="<?php echo admin_url('jilanmedia/update/' . $data->jilanmedia_id) ?>"><?php echo $data->title ?></a>
                                        </td>
                                        <td class="">
                                            <?php echo statusCheck($data->status); ?>
                                        </td>                                                            

                                        <td class=""> 
                                            <a class="btn btn-success btn-xs" href="<?php echo admin_url('jilanmedia/view/' . $data->jilanmedia_id); ?>"><i class="icon-eye-open"></i></a>
                                            <a class="btn btn-primary btn-xs" href="<?php echo admin_url('jilanmedia/update/' . $data->jilanmedia_id) ?>"><i class="icon-pencil"></i></a>
                                            <a class="btn btn-danger btn-xs" onclick="return confirm('Are you Sure??\nYou Want to Delete this item!');" href="<?php echo admin_url('jilanmedia/delete/' . $data->jilanmedia_id) ?>">
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