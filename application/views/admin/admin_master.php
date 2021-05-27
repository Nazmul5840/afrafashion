<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="<?php echo base_url('assets/frontend/images/favicon.ico'); ?>">

        <title><?php echo (isset($pageTitle) && !empty($pageTitle)) ? $pageTitle : 'Admin Panel'; ?>  |  <?php echo $this->config->item('PROJECT_TITLE'); ?></title>

        <!-- Bootstrap core CSS -->
        <link href="<?php echo base_url('assets/admin/css/bootstrap.min.css'); ?>" rel="stylesheet">
        <link href="<?php echo base_url('assets/admin/css/bootstrap-reset.css'); ?>" rel="stylesheet">
        <!--external css-->
        <link href="<?php echo base_url('assets/admin/font-awesome/css/font-awesome.css'); ?>" rel="stylesheet" />
        <link href="<?php echo base_url('assets/admin/fancybox/source/jquery.fancybox.css'); ?>" rel="stylesheet" />

        <!-- Custom styles for this template -->
        <link href="<?php echo base_url('assets/admin/css/style.css'); ?>" rel="stylesheet">
        <link href="<?php echo base_url('assets/admin/css/style-responsive.css'); ?>" rel="stylesheet" />

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
        <!--[if lt IE 9]>
          <script src="<?php echo base_url('assets/admin/js/html5shiv.js'); ?>"></script>
          <script src="<?php echo base_url('assets/admin/js/respond.min.js'); ?>"></script>
        <![endif]-->

        <!-- js placed at the end of the document so the pages load faster -->
        <script src="<?php echo base_url('assets/admin/js/jquery.js'); ?>"></script>
        <script src="<?php echo base_url('assets/admin/js/jquery-1.8.3.min.js'); ?>"></script>
        <script src="<?php echo base_url('assets/admin/js/bootstrap.min.js'); ?>"></script>
        <script class="include" type="text/javascript" src="<?php echo base_url('assets/admin/js/jquery.dcjqaccordion.2.7.js'); ?>"></script>
        <script src="<?php echo base_url('assets/admin/js/jquery.scrollTo.min.js'); ?>"></script>
        <script src="<?php echo base_url('assets/admin/js/jquery.nicescroll.js'); ?>" type="text/javascript"></script>
        <script src="<?php echo base_url('assets/admin/js/jquery.sparkline.js'); ?>" type="text/javascript"></script>
        <script src="<?php echo base_url('assets/admin/jquery-easy-pie-chart/jquery.easy-pie-chart.js'); ?>"></script>
        <script src="<?php echo base_url('assets/admin/js/owl.carousel.js'); ?>" ></script>
        <script src="<?php echo base_url('assets/admin/fancybox/source/jquery.fancybox.js'); ?>"></script>
        <script src="<?php echo base_url('assets/admin/js/jquery.customSelect.min.js'); ?>" ></script>

        <link rel="stylesheet" type="text/css" href="<?php echo base_url('assets/admin/bootstrap-datepicker/css/datepicker.css'); ?>" />
        <script type="text/javascript" src="<?php echo base_url('assets/admin/bootstrap-datepicker/js/bootstrap-datepicker.js'); ?>"></script>
        <script type="text/javascript" src="<?php echo base_url('assets/admin/ckeditor/ckeditor.js'); ?>"></script>
        <script type="text/javascript" src="<?php echo base_url('assets/admin/bootstrap-fileupload/bootstrap-fileupload.js'); ?>"></script>
        <script type="text/javascript" language="javascript" src="<?php echo base_url('assets/admin/advanced-datatable/media/js/jquery.dataTables.js'); ?>"></script>

        <script src="<?php echo base_url('assets/admin/js/respond.min.js'); ?>" ></script>
        <link rel="stylesheet" type="text/css" href="<?php echo base_url('assets/admin/bootstrap-fileupload/bootstrap-fileupload.css'); ?>" />

        <script class="include" type="text/javascript" src="<?php echo base_url('assets/admin/js/jquery.dcjqaccordion.2.7.js'); ?>"></script>
        <script type="text/javascript" src="<?php echo base_url('assets/admin/tinymce/tinymce.min.js'); ?>"></script>

        <script type="text/javascript">
            tinymce.init({
                selector: "textarea.mceEditor",
                theme: "modern",
                width: 800,
                height: 300,
                plugins: [
                    "advlist autolink link image lists charmap print preview anchor",
                    "searchreplace visualblocks code fullscreen",
                    "table insertdatetime contextmenu media paste responsivefilemanager"
                ],
                toolbar: "undo redo | styleselect | fontsizeselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist | responsivefilemanager | image | media | link | preview code | table",
                menubar: false,
                image_advtab: true,
                relative_urls: false,
                browser_spellcheck: true,
                convert_urls: false, // relative URl removed
                // deaful p removed
                force_br_newlines: true,
                force_p_newlines: false,
                forced_root_block: '', // Needed for 3.x

                //filemanager_crossdomain: true,
                filemanager_title: "Responsive Filemanager",
                /* external_filemanager_path: "<?php /* echo base_url('filemanager'); */ ?>/", */
                /* external_plugins: {"filemanager": "<?php /* echo base_url('filemanager/plugin.min.js'); */ ?>"} */
            });

            function open_popup(url) {
                var w = 900;
                var h = 600;
                var l = Math.floor((screen.width - w) / 2);
                var t = Math.floor((screen.height - h) / 2);
                var win = window.open(url, 'ResponsiveFilemanager', "width=" + w + ",height=" + h + ",top=" + t + ",left=" + l);
                return false;
            }

        </script>

    </head>

    <body>

        <section id="container" >
            <!--header start-->
            <header class="header white-bg">
                <div class="sidebar-toggle-box">
                    <div data-original-title="Toggle Navigation" data-placement="right" class="icon-reorder tooltips"></div>
                </div>
                <!--logo start-->
                <a href="<?php echo admin_url(); ?>" class="logo" style="margin-top: 0px">
<!--                    <img style="height: 45px;margin-top: 5px" data-retina src="--><?php //echo base_url('assets/admin/img/logo.png'); ?><!--" alt="Logo" /></a>-->
<!--                    Dionescollection-->
                <!--logo end-->

                <div class="top-nav ">
                    <!--search & user info start-->
                    <ul class="nav pull-right top-menu">
                        <!-- user login dropdown start-->
                        <li class="dropdown">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <?php $photoSrc1 = $this->session->userdata('photo') ? base_url('assets/media/admin_user/' . $this->session->userdata('photo')) : base_url('assets/media/admin_user/nophoto.jpg'); ?>
                                <img alt="" src="<?php echo $photoSrc1; ?>" height="35">
                                <span class="username"><?php echo $this->session->userdata('first_name') . ' ' . $this->session->userdata('last_name') ?></span>
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu extended logout">
                                <div class="log-arrow-up"></div>
                                <li><a href="<?php echo admin_url('profile/edit'); ?>"><i class="icon-cog"></i> Settings</a></li>
                                <li><a href="<?php echo admin_url('auth/logout'); ?>"><i class="icon-key"></i> Log Out</a></li>
                            </ul>
                        </li>
                        <!-- user login dropdown end -->
                    </ul>
                    <!--search & user info end-->
                </div>
            </header>
            <!--header end-->

            <?php $this->load->view('admin/sidebar_menu'); ?>

            <!--main content start-->
            <section id="main-content">
                <section class="wrapper site-min-height">
                    <!-- page start-->
                    <?php
                    if (isset($required_contents)) {
                        echo $required_contents;
                    }
                    ?>
                    <!-- page end-->
                </section>
            </section>
            <!--main content end-->
            <!--footer start-->
            <footer class="site-footer">
                <div class="text-center">
                    <?php echo date('Y'); ?> &copy; <?php echo $this->config->item('PROJECT_TITLE') ?>
                    <a href="#" class="go-top">
                        <i class="icon-angle-up"></i>
                    </a>
                </div>
            </footer>
            <!--footer end-->

            <script type="text/javascript">
                $(document).ready(function () {
                    // call fancybox
                    $(".fancybox").fancybox();
                });
            </script>
        </section>

        <!--common script for all pages-->
        <script src="<?php echo base_url('assets/admin/js/common-scripts.js'); ?>"></script>
    </body>
</html>
