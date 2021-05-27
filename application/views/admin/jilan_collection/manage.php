<!--dynamic table-->
<link href="<?php echo base_url('assets/admin/advanced-datatable/media/css/demo_page.css'); ?>" rel="stylesheet" />
<link href="<?php echo base_url('assets/admin/advanced-datatable/media/css/demo_table.css'); ?>" rel="stylesheet" />
<style>
    .zoom:hover {
        -ms-transform: scale(2.5); /* IE 9 */
        -webkit-transform: scale(2.5); /* Safari 3-8 */
        transform: scale(2.5);
    }
</style>
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
                Manage Diones Collection
                <span class="tools pull-right">
                    <a class="btn btn-info" href="<?php echo admin_url('jilancollection/add'); ?>"><span>Add New</span></a>
                </span>
            </header>
            <div class="panel-body">
                <div class="adv-table">
                    <table class="display table table-bordered" id="hidden-table-info">
                        <thead>
                            <tr>
                                <th width="5%">SL#</th>
                                <th class="" width="10%">Photo</th>
                                <th class="" width="20%">Category</th>
                                <th class="" width="10%">Title</th>
                                <th class="" width="10%">Price</th>
                                <th class="" width="8%">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            if (!empty($allData)) {
                                foreach ($allData as $key => $data) {
                                    $result = $this->global_model->get_data('jilancollection_category', array('id' => $data->parent_id));
                                    ?>
                                    <tr class="gradeX">
                                        <td class=""><a title="Edit of <?php echo $data->category_name; ?>" href="<?php echo admin_url('jilancollection/update/' . $data->jilancollection_id) ?>"><?php echo $key + 1; ?></a></td>

                                        <td class="">
                                            <?php
                                            $imageUrl = !empty(getCartPhoto($data->cart_photo, 'jilancollection', 'cart')) ? getCartPhoto($data->cart_photo, 'jilancollection', 'cart') : "";
                                          //  $photos = getAllMedia('media', $data->jilancollection_id, 'jilancollection');
                                           // if (!empty($photos)) {
                                                ?>                                  
                                                <?php //foreach ($photos as $key => $photo) { ?>
                                                    <div class='thumb zoom' style="">
                                                        <a title="<?php echo $data->cart_photo; ?>" class="fancybox_" href="<?php echo $imageUrl; ?>" data-fancybox-group="gallery">
                                                            <img src='<?php echo $imageUrl; ?>' style=" width: 100px; height: 100px;">
                                                        </a>
                                                    </div><!--thumb-->
                                                    <?php
//                                                    break;
                                              //  }
                                                ?>
                                            <?php //} ?>
                                        </td>

                                        <td class="">
                                            <?php
                                            $productRelation = $this->global_model->getCategoryNameByProductRelationIds($data->jilancollection_id);
                                            echo!empty($productRelation) ? $productRelation : "";
                                            ?>
                                        </td>
                                        <td class="">
                                            <a title="<?php echo $data->title; ?>" href="<?php echo admin_url('jilancollection/update/' . $data->jilancollection_id) ?>"><?php echo $data->title; ?></a>
                                        </td>

                                        <td class="">
                                            <a title="<?php echo $data->price; ?>" href="javascript:void(0);"><?php echo 'BDT '.convertAmount($data->price).' '.'/ USD '.currencyConvert($data->price); ?></a>
                                        </td>

                                        <td class="">
                                            <a class="btn btn-success btn-xs" href="<?php echo admin_url('jilancollection/view/' . $data->jilancollection_id); ?>"><i class="icon-eye-open"></i></a>
                                            <a class="btn btn-primary btn-xs" href="<?php echo admin_url('jilancollection/update/' . $data->jilancollection_id) ?>"><i class="icon-pencil"></i></a>
                                            <a class="btn btn-danger btn-xs" onclick="return confirm('Are you Sure??\nYou Want to Delete this item!');" href="<?php echo admin_url('jilancollection/delete/' . $data->jilancollection_id) ?>">
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