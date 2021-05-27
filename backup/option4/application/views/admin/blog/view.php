<link rel="stylesheet" type="text/css" href="<?php echo base_url('assets/admin/bootstrap-fileupload/bootstrap-fileupload.css'); ?>" />

<div class="row">
    <div class="col-lg-12">
        <section class="panel">
            <header class="panel-heading">
                <?php echo $pageTitle; ?>
                <span class="tools pull-right">
                    <a class="iconlink btn btn-info" href="<?php echo admin_url('blog'); ?>"><span>Manage</span></a>
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
                            <td> <?php echo $blog->title; ?>  </td>
                        </tr>
                        <tr>
                            <td>Summary</td>
                            <td> : </td>
                            <td> <?php echo nl2br($blog->summary); ?>  </td>
                        </tr>
                        <tr>
                            <td>Description</td>
                            <td> : </td>
                            <td> <?php echo nl2br($blog->description); ?>  </td>
                        </tr>

                        <tr>
                            <td>Created</td>
                            <td> : </td>
                            <td> <?php echo longDateHuman($blog->created, 'full'); ?>  </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        $(".fancybox").fancybox();
    });
</script>