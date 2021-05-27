<link href="<?php echo base_url('assets/admin/css/gallery.css'); ?>" rel="stylesheet">
<link href="<?php echo base_url('assets/admin/css/slidebars.css'); ?>" rel="stylesheet">

<style type="text/css">
    .grid li {
        width: 24%;
    }

    figcaption{
        text-align: center;

    }
    .cs-style-3 figcaption a {
        position: relative !important;
        bottom: inherit;
        right: inherit;
        margin: 0 2px;
    }
    .grid figcaption a.green{
        background: #5cb85c !important;

    }
    .grid figcaption a.red{
        background: #d9534f !important;

    }
</style>

<?php if ($this->session->flashdata('success_msg')) { ?>
    <div class="alert alert-success fade in">
        <button data-dismiss="alert" class="close close-sm" type="button">
            <i class="icon-remove"></i>
        </button>
        <?php echo $this->session->flashdata('success_msg'); ?>
    </div>
<?php } ?>

<!--state overview start-->
<div class="row state-overview">

    <div class="col-lg-3 col-sm-6">
        <a href="<?php echo admin_url('jilancollection'); ?>">
            <section class="panel">
                <div class="symbol red">
                    <i class="icon-shopping-cart"></i>
                </div>
                <div class="value">
                    <h1 class=" count3">
                        <?php echo $totalJilanCollection; ?>
                    </h1>
                    <p>Diones Collection</p>
                </div>
            </section>
        </a>
    </div>
<!--    <div class="col-lg-3 col-sm-6">-->
<!--        <a href="--><?php //echo admin_url('entertainment'); ?><!--">-->
<!--            <section class="panel">-->
<!--                <div class="symbol blue">-->
<!--                    <i class="icon-youtube-play"></i>-->
<!--                </div>-->
<!--                <div class="value">-->
<!--                    <h1 class=" count4">-->
<!--                        --><?php //echo $totalEntertainment; ?>
<!--                    </h1>-->
<!--                    <p>Entertainment</p>-->
<!--                </div>-->
<!--            </section>-->
<!--        </a>-->
<!--    </div>-->
<!--    <div class="col-lg-3 col-sm-6">-->
<!--        <a href="--><?php //echo admin_url('jilanmedia'); ?><!--">-->
<!--            <section class="panel">-->
<!--                <div class="symbol yellow">-->
<!--                    <i class="icon-camera"></i>-->
<!--                </div>-->
<!--                <div class="value">-->
<!--                    <h1 class=" count2">-->
<!--                        --><?php //echo $totalJilanMedia; ?>
<!--                    </h1>-->
<!--                    <p>Jilan Media</p>-->
<!--                </div>-->
<!--            </section>-->
<!--        </a>-->
<!--    </div>-->
<!--    <div class="col-lg-3 col-sm-6">-->
<!--        <a href="--><?php //echo admin_url('activities'); ?><!--">-->
<!--            <section class="panel">-->
<!--                <div class="symbol terques">-->
<!--                    <i class="icon-bullhorn"></i>-->
<!--                </div>-->
<!--                <div class="value">-->
<!--                    <h1 class="count">-->
<!--                        --><?php //echo $totalActivities; ?>
<!--                    </h1>-->
<!--                    <p>Activities</p>-->
<!--                </div>-->
<!--            </section>-->
<!--        </a>-->
<!--    </div>-->
</div>
<!--state overview end-->

<!--gallery start-->
<section class="panel gallery_new">
<!--    <header class="panel-heading">-->
<!--        Latest Collection Items-->
<!--    </header>-->
<!---->
<!--    <div class="panel-body">-->
<!--    </div>-->
</section>
<!--gallery end-->


<script src="<?php echo base_url('assets/admin/js/modernizr.custom.js'); ?>"></script>
<script src="<?php echo base_url('assets/admin/js/toucheffects.js'); ?>"></script>