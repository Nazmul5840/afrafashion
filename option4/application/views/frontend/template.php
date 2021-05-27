<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title><?php echo !empty($pageTitle) ? $pageTitle : $this->config->item('PROJECT_TITLE'); ?></title>
        <!-- Favicon -->
        <link href="<?php echo base_url('assets/frontend/img/favicon.ico'); ?>" rel="icon"/>
        <!-- Font awesome -->
        <link href="<?php echo base_url('assets/frontend/css/font-awesome.css'); ?>" rel="stylesheet">
        <!-- Bootstrap -->
        <link href="<?php echo base_url('assets/frontend/css/bootstrap.css'); ?>" rel="stylesheet">
        <!-- SmartMenus jQuery Bootstrap Addon CSS -->
        <link href="<?php echo base_url('assets/frontend/css/jquery.smartmenus.bootstrap.css'); ?>" rel="stylesheet">
        <!-- Product view slider -->
        <link rel="stylesheet" type="text/css" href="<?php echo base_url('assets/frontend/css/jquery.simpleLens.css') ?>">
        <!-- slick slider -->
        <link rel="stylesheet" type="text/css" href="<?php echo base_url('assets/frontend/css/slick.css'); ?>">
        <!-- price picker slider -->
        <link rel="stylesheet" type="text/css" href="<?php echo base_url('assets/frontend/css/nouislider.css'); ?>">
        <!-- Theme color -->
        <link id="switcher" href="<?php echo base_url('assets/frontend/css/theme-color/black-theme.css') ?>"
              rel="stylesheet">
        <!-- <link id="switcher" href="css/theme-color/bridge-theme.css" rel="stylesheet"> -->
        <!-- Top Slider CSS -->
        <link href="<?php echo base_url('assets/frontend/css/sequence-theme.modern-slide-in.css'); ?>" rel="stylesheet"
              media="all">

        <!-- Main style sheet -->
        <link href="<?php echo base_url('assets/frontend/css/style.css'); ?>" rel="stylesheet">

        <!-- Google Font -->
        <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>


        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->


    </head>
    <body>
        <!-- wpf loader Two -->
<!--        <div id="wpf-loader-two">-->
<!--            <div class="wpf-loader-two-inner">-->
<!--                <span>Loading</span>-->
<!--            </div>-->
<!--        </div>-->
        <!-- / wpf loader Two -->
        <!-- SCROLL TOP BUTTON -->
        <a class="scrollToTop" href="#"><i class="fa fa-chevron-up"></i></a>
        <!-- END SCROLL TOP BUTTON -->


        <!-- Start header section -->
        <header id="aa-header">
        <!-- start header top  -->
        <div class="aa-header-top">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="aa-header-top-area">
                            <!-- start header top left -->
                            <div class="aa-header-top-left">

                                <!-- / currency -->
                                <!-- start cellphone -->
                                <div class="cellphone hidden-xs">
                                    <p><span class="fa fa-envelope"></span><?php echo $this->config->item('EMAIL_ADDRESS'); ?></p>
                                </div>
                                <div class="cellphone hidden-xs">
                                    <p><span class="fa fa-phone"></span><?php echo $this->config->item('MOBILE_NO'); ?></p>
                                </div>
                                <!-- / cellphone -->
                            </div>
                            <!-- / header top left -->
                            <div class="aa-header-top-right">
<!--                                <ul class="aa-head-top-nav-right">-->
<!--                                    <li><a href="javascript:void(0);">My Account</a></li>-->
<!--                                    <li class="hidden-xs"><a href="javascript:void(0);">Wishlist</a></li>-->
<!--                                    <li class="hidden-xs"><a href="javascript:void(0);">My Cart</a></li>-->
<!--                                    <li class="hidden-xs"><a href="javascript:void(0);">Checkout</a></li>-->
<!--                                    <li><a href="" data-toggle="modal" data-target="#login-modal">Login</a></li>-->
<!--                                </ul>-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- / header top  -->

        <!-- start header bottom  -->
        <div class="aa-header-bottom">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="aa-header-bottom-area">
                            <!-- logo  -->
                            <div class="aa-logo">
                                <!-- Text based logo -->
                                <a href="<?php echo base_url(); ?>">
                                    <span class="fa fa-buysellads"></span>
                                    <p>Diones<strong>Collection</strong> <span style="font-family: ">Your Fashioning Life</span></p>
                                </a>
                                <!-- img based logo -->
                                <!-- <a href="index.html"><img src="img/logo.jpg" alt="logo img"></a> -->
                            </div>
                            <!-- / logo  -->
                            <!-- cart box -->
                            <div class="aa-cartbox">
<!--                                <a class="aa-cart-link" href="#">-->
<!--                                    <span class="fa fa-shopping-basket"></span>-->
<!--                                    <span class="aa-cart-title">SHOPPING CART</span>-->
<!--                                </a>-->
<!--                                <div class="aa-cartbox-summary">-->
<!--                                    <ul>-->
<!--                                        <li>-->
<!--                                            <a class="aa-cartbox-img" href="#"><img src="img/woman-small-2.jpg"-->
<!--                                                                                    alt="img"></a>-->
<!--                                            <div class="aa-cartbox-info">-->
<!--                                                <h4><a href="#">Product Name</a></h4>-->
<!--                                                <p>1 x $250</p>-->
<!--                                            </div>-->
<!--                                            <a class="aa-remove-product" href="#"><span class="fa fa-times"></span></a>-->
<!--                                        </li>-->
<!--                                        <li>-->
<!--                                            <a class="aa-cartbox-img" href="#"><img src="img/woman-small-1.jpg"-->
<!--                                                                                    alt="img"></a>-->
<!--                                            <div class="aa-cartbox-info">-->
<!--                                                <h4><a href="#">Product Name</a></h4>-->
<!--                                                <p>1 x $250</p>-->
<!--                                            </div>-->
<!--                                            <a class="aa-remove-product" href="#"><span class="fa fa-times"></span></a>-->
<!--                                        </li>-->
<!--                                        <li>-->
<!--                          <span class="aa-cartbox-total-title">-->
<!--                            Total-->
<!--                          </span>-->
<!--                                            <span class="aa-cartbox-total-price">-->
<!--                            $500-->
<!--                          </span>-->
<!--                                        </li>-->
<!--                                    </ul>-->
<!--                                    <a class="aa-cartbox-checkout aa-primary-btn" href="checkout.html">Checkout</a>-->
<!--                                </div>-->
                            </div>
                            <!-- / cart box -->
                            <!-- search box -->
                            <div class="aa-search-box">
                                <form id="search_form" action="<?php echo base_url('main/products') ?>" method="GET">
                                    <input type="text" name="search" id="search" placeholder="Search here ex. 'man' ">
                                    <button  type="submit" name="submit"><span class="fa fa-search"></span></button>
                                </form>
                            </div>
                            <!-- / search box -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- / header bottom  -->
        </header>
        <!-- / header section -->
        <style>
            #menu ul li a {
                font-size:13px !important;
            }
        </style>
        <!-- menu -->
        <section id="menu">
            <div class="container">
                <div class="menu-area">
                    <!-- Navbar -->
                    <div class="navbar navbar-default" role="navigation">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                        </div>
                        <div class="navbar-collapse collapse">
                            <!-- Left nav -->
                            <ul class="nav navbar-nav">
                                <li><a href="<?php echo base_url() ?>"><span class="fa fa-home"></span> HOME</a></li>
                                <?php
                                    getJilanCollectionMenusNew();
                                ?>

<!--                                <li><a href="#">Mens <span class="caret"></span></a>-->
<!--                                    <ul class="dropdown-menu">-->
<!--                                        <li><a href="--><?php //echo base_url('main/products') ?><!--">Jeans</a></li>-->
<!--                                        <li><a href="--><?php //echo base_url('main/products') ?><!--">Polo Shirts</a></li>-->
<!--                                        <li><a href="--><?php //echo base_url('main/products') ?><!--">T-Shirts</a></li>-->
<!--                                        <li><a href="--><?php //echo base_url('main/products') ?><!--">Shorts & Cargo</a></li>-->
<!--                                        <li><a href="--><?php //echo base_url('main/products') ?><!--">Sweaters</a></li>-->
<!--                                    </ul>-->
<!--                                </li>-->
<!--                                <li><a href="#">Women <span class="caret"></span></a>-->
<!--                                    <ul class="dropdown-menu">-->
<!--                                        <li><a href="--><?php //echo base_url('main/products') ?><!--">T-Shirts</a></li>-->
<!--                                        <li><a href="--><?php //echo base_url('main/products') ?><!--">Tank Top</a></li>-->
<!--                                        <li><a href="--><?php //echo base_url('main/products') ?><!--">Jeans</a></li>-->
<!--                                        <li><a href="--><?php //echo base_url('main/products') ?><!--">Leggings</a></li>-->
<!--                                        <li><a href="--><?php //echo base_url('main/products') ?><!--">Sweaters</a></li>-->
<!--                                    </ul>-->
<!--                                </li>-->
<!--                                <li><a href="#">Girls <span class="caret"></span></a>-->
<!--                                    <ul class="dropdown-menu">-->
<!--                                        <li><a href="--><?php //echo base_url('main/products') ?><!--">Jeans</a></li>-->
<!--                                        <li><a href="--><?php //echo base_url('main/products') ?><!--">T-Shirts</a></li>-->
<!--                                        <li><a href="--><?php //echo base_url('main/products') ?><!--">Leggings</a></li>-->
<!--                                        <li><a href="--><?php //echo base_url('main/products') ?><!--">Shorts & Capri</a></li>-->
<!--                                        <li><a href="--><?php //echo base_url('main/products') ?><!--">Sweaters</a></li>-->
<!--                                        <li><a href="--><?php //echo base_url('main/products') ?><!--">Tank Top</a></li>-->
<!--                                    </ul>-->
<!--                                </li>-->
<!--                                <li><a href="#">Boys <span class="caret"></span></a>-->
<!--                                    <ul class="dropdown-menu">-->
<!--                                        <li><a href="--><?php //echo base_url('main/products') ?><!--">T-Shirt</a></li>-->
<!--                                        <li><a href="--><?php //echo base_url('main/products') ?><!--">Jeans</a></li>-->
<!--                                        <li><a href="--><?php //echo base_url('main/products') ?><!--">Polo Shirts</a></li>-->
<!--                                        <li><a href="--><?php //echo base_url('main/products') ?><!--">Shorts & Cargo</a></li>-->
<!--                                        <li><a href="--><?php //echo base_url('main/products') ?><!--">Sweaters</a></li>-->
<!--                                    </ul>-->
<!--                                </li>-->
<!--                                <li><a href="--><?php //echo base_url('main/products') ?><!--">Jute Products</a></li>-->
<!--                                <li><a href="#">Footwear<span class="caret"></span></a>-->
<!--                                    <ul class="dropdown-menu">-->
<!--                                        <li><a href="--><?php //echo base_url('main/products') ?><!--">Espadrille</a></li>-->
<!--                                        <li><a href="--><?php //echo base_url('main/products') ?><!--">Shoes</a></li>-->
<!--                                        <li><a href="--><?php //echo base_url('main/products') ?><!--">Wallets</a></li>-->
<!--                                    </ul>-->
<!--                                </li>-->

                                <li><a href="<?php echo base_url('main/about') ?>">ABOUT US</a></li>
                            </ul>
                        </div><!--/.nav-collapse -->
                    </div>
                </div>
            </div>
        </section>
        <!-- / menu -->

        <?php
        echo !empty($content) ? $content :'';
        ?>


        <!-- Subscribe section -->
<!--        <section id="aa-subscribe">-->
<!--            <div class="container">-->
<!--                <div class="row">-->
<!--                    <div class="col-md-12">-->
<!--                        <div class="aa-subscribe-area">-->
<!--                            <h3>Subscribe our newsletter </h3>-->
<!--                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ex, velit!</p>-->
<!--                            <form action="" class="aa-subscribe-form">-->
<!--                                <input type="email" name="" id="" placeholder="Enter your Email">-->
<!--                                <input type="submit" value="Subscribe">-->
<!--                            </form>-->
<!--                        </div>-->
<!--                    </div>-->
<!--                </div>-->
<!--            </div>-->
<!--        </section>-->
        <!-- / Subscribe section -->

        <!-- footer -->
        <footer id="aa-footer">
            <!-- footer bottom -->
            <div class="aa-footer-top">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="aa-footer-top-area">
                                <div class="row">
                                    <div class="col-md-4 col-lg-4 col-sm-6 col-xs-12">
                                        <div class="aa-footer-widget">
                                            <h3>Main Menu</h3>
                                            <ul class="aa-footer-nav">
                                                <li><a href="<?php echo base_url(); ?>">Home</a></li>
<!--                                                <li><a href="--><?php //echo base_url('main/products') ?><!--">Our Products</a></li>-->
<!--                                                <li><a href="--><?php //echo base_url('main/terms_condition'); ?><!--">Terms & Condition</a></li>-->
                                                <li><a href="<?php echo base_url('main/about'); ?>">About Us</a></li>
                                                <li><a href="<?php echo base_url('main/contact'); ?>">Contact Us</a></li>
                                            </ul>
                                        </div>
                                    </div>
<!--                                    <div class="col-md-3 col-sm-6">-->
<!--                                        <div class="aa-footer-widget">-->
<!--                                            <div class="aa-footer-widget">-->
<!--                                                <h3>Knowledge Base</h3>-->
<!--                                                <ul class="aa-footer-nav">-->
<!--                                                    <li><a href="--><?php //echo base_url('main/shipping_policy'); ?><!--">Shipping Policy</a></li>-->
<!--                                                    <li><a href="--><?php //echo base_url('main/return_policy'); ?><!--">Return & Refund</a></li>-->
<!--                                                    <li><a href="--><?php //echo base_url('main/privacy_policy'); ?><!--">Privacy Policy</a></li>-->
<!--                                                </ul>-->
<!--                                            </div>-->
<!--                                        </div>-->
<!--                                    </div>-->
                                    <div class="col-md-4 col-lg-4 col-sm-6 col-xs-12">
                                        <div class="aa-footer-widget">
                                            <div class="aa-footer-widget">
                                                <h3>Contact (UK)</h3>
                                                <address>
                                                    <p>Diones collection LLC</p>
                                                    <p>(Registration No- 13035466)</p>
                                                    <p>71-75, Shelton Street . Covent Garden,London
                                                        WC2H9JQ, UK.</p>
                                                </address>

<!--                                                Diones collection LLC-->
<!--                                                ( Registration No- 13035466)-->
<!--                                                71-75, Shelton Street . Covent Garden,London-->
<!--                                                WC2H9JQ, UK.-->


                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-lg-4 col-sm-6 col-xs-12">
                                        <div class="aa-footer-widget">
                                            <div class="aa-footer-widget">
                                                <h3>Contact (Bangladesh)</h3>
                                                <address>
                                                    <p> Tenament #6, Flat #H-5, Road #6, Block #E , Bashundhara, Dhaka , Bangladesh</p>
                                                    <p><span class="fa fa-phone"></span><?php echo $this->config->item('MOBILE_NO'); ?></p>
                                                    <p><span class="fa fa-envelope"></span><?php echo $this->config->item('EMAIL_ADDRESS'); ?></p>
                                                </address>
                                                <div class="aa-footer-social">
<!--                                                    <a href="https://www.facebook.com/dionescollection" target="_blank"><span class="fa fa-facebook"></span></a>-->
                                                    <a target="_blank" href="https://www.linkedin.com/in/diones-collection-5905751bb"><span class="fa fa-linkedin"></span></a>
<!--                                                    <a href="#"><span class="fa fa-twitter"></span></a>-->
<!--                                                    <a href="#"><span class="fa fa-youtube"></span></a>-->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- footer-bottom -->
            <div class="aa-footer-bottom">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="aa-footer-bottom-area">
                                <p>Copyright © <a href="http://www.dionescollection.com">DionesCollection</a>. All Rights Reserved</p>
                                <div class="aa-footer-payment">
                                    <!--<span class="fa fa-cc-mastercard"></span>
                                    <span class="fa fa-cc-visa"></span>
                                    <span class="fa fa-paypal"></span>
                                    <span class="fa fa-cc-discover"></span>--->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- / footer -->

        <!-- Login Modal -->
        <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog  modal-md">
                <div class="modal-content">
                    <div class="modal-body">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4>Login or Register</h4>
                        <form class="aa-login-form" action="">
                            <label for="">Username or Email address<span>*</span></label>
                            <input type="text" placeholder="Username or email">
                            <label for="">Password<span>*</span></label>
                            <input type="password" placeholder="Password">
                            <button class="aa-browse-btn" type="button">Login</button>
                            <label for="rememberme" class="rememberme"><input type="checkbox" id="rememberme"> Remember me
                            </label>
                            <p class="aa-lost-password"><a href="#">Lost your password?</a></p>
                            <div class="aa-register-now">
                                Don't have an account?<a href="javascript:void(0);">Register now!</a>
                            </div>
                        </form>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div>

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="<?php echo base_url('assets/frontend/js/bootstrap.js'); ?>"></script>
        <!-- SmartMenus jQuery plugin -->
        <script type="text/javascript" src="<?php echo base_url('assets/frontend/js/jquery.smartmenus.js'); ?>"></script>
        <!-- SmartMenus jQuery Bootstrap Addon -->
        <script type="text/javascript"
                src="<?php echo base_url('assets/frontend/js/jquery.smartmenus.bootstrap.js'); ?>"></script>
        <!-- To Slider JS -->
        <script src="<?php echo base_url('assets/frontend/js/sequence.js'); ?>"></script>
        <script src="<?php echo base_url('assets/frontend/js/sequence-theme.modern-slide-in.js'); ?>"></script>
        <!-- Product view slider -->
        <script type="text/javascript" src="<?php echo base_url('assets/frontend/js/jquery.simpleGallery.js'); ?>"></script>
        <script type="text/javascript" src="<?php echo base_url('assets/frontend/js/jquery.simpleLens.js'); ?>"></script>
        <!-- slick slider -->
        <script type="text/javascript" src="<?php echo base_url('assets/frontend/js/slick.js'); ?>"></script>
        <!-- Price picker slider -->
        <script type="text/javascript" src="<?php echo base_url('assets/frontend/js/nouislider.js'); ?>"></script>
        <!-- Custom js -->
        <script src="<?php echo base_url('assets/frontend/js/custom.js'); ?>"></script>

    </body>
</html>






