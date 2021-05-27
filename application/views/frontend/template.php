<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title><?php echo !empty($pageTitle) ? $pageTitle : $this->config->item('PROJECT_TITLE'); ?></title>
        <!-- Favicon -->
        <link href="<?php echo base_url('assets/frontend/img/favicon.png'); ?>" rel="icon"/>
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
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>


        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->


        <style>
            body > .skiptranslate {
            //display: none;
            }

            .goog-te-banner-frame.skiptranslate {
                display: none !important;
            }
            body {
                top: 0px !important;
            }

            @media print {
                #google_translate_element {display: none;}
            }

        </style>

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
                                    <p><span class="fa fa-envelope"></span>rtrlokman@gmail.com</p>
                                </div>
                                <div class="cellphone hidden-xs">
                                    <p>
                                        <span class="fa fa-phone"></span>01781-163434
                                    </p>
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
                                <div id="google_translate_element"></div>
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
<!--                                <a href="--><?php //echo base_url(); ?><!--">-->
<!--                                    <span class="fa fa-buysellads"></span>-->
<!--                                    <p>Diones<strong>Collection</strong> <span style="font-family: ">Your Fashioning Life</span></p>-->
<!--                                </a>-->
                                <!-- img based logo -->
                                 <a href="<?php echo base_url(); ?>"><img style="background: transparent; height:200px; width:200px;" src="<?php echo base_url("assets/frontend/img/afra_fashion.jpeg"); ?>" alt="logo img"></a>
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
                            <div class="aa-search-box" style="margin-top:50px;">
                                <form id="search_form" action="<?php echo base_url('main/products') ?>" method="GET">
                                    <input type="text" name="search" id="search" placeholder="Search here ex. 'man' ">
                                    <button  type="submit" name="submit"><span class="fa fa-search" ></span></button>
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
                                <li><a href="<?php echo base_url('main/contact') ?>">CONTACT US</a></li>
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
        <style>
            #player_control {
                bottom: 60px;
                /*color: #fff;*/
                /*display: none;*/
                /*font-size: 23px;*/
                /*height: 50px;*/
                /*line-height: 45px;*/
                position: fixed;
                left: 20px;
                text-align: center;
                text-decoration: none;
                -webkit-transition: all 0.5s ease 0s;
                -moz-transition: all 0.5s ease 0s;
                -ms-transition: all 0.5s ease 0s;
                -o-transition: all 0.5s ease 0s;
                transition: all 0.5s ease 0s;
                width: 50px;
                z-index: 999;
            }
        </style>

        <div id="player_control">
            <button id="button" class="btn btn-default btn-lg btn-flat"><i class="fa fa-play"></i></button>
        </div>

        <audio id="player" autoplay>
            <source src='<?php echo base_url('assets/media/audio/music.mp3') ?>' type='audio/mpeg' />
        </audio>

        <!--
  This code will translate page contents automatically (without user input)
  Settings located at line 9, current script will translate english to estonian
-->

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
                                            <h4 style="color:white;">Main Menu</h4>
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
                                                <h4 style="color:white;">Office</h4>
                                                <address>
                                                    <p>Afra Fashion House</p>
                                                    <p>(Registration No- 13035466)</p>
                                                    <p>Kodam Ali Madrasha Road, Dhaka, Dhaka Division, Bangladesh</p>
                                                    <p><span class="fa fa-envelope"></span>Email: info@afrafashionbd.com</p>
                                                    <p><span class="fa fa-envelope"></span>afrafashionbd.com</p>
                                                </address>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-lg-4 col-sm-6 col-xs-12">
                                        <div class="aa-footer-widget">
                                            <div class="aa-footer-widget">
                                                <h4 style="color:white;">Location</h4>
                                                <address>
                                                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7304.414203636865!2d90.42359953660636!3d23.73999305510485!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755b84021a27441%3A0xeb353a7f06a7ad40!2sBashabo%20Balur%20Math!5e0!3m2!1sen!2sbd!4v1621836074721!5m2!1sen!2sbd" width="400" height="300" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                                                </address>
                                                <div class="aa-footer-social">
<!--                                                    <a href="https://www.facebook.com/dionescollection" target="_blank"><span class="fa fa-facebook"></span></a>-->
                                                    <a target="_blank" href="https://www.facebook.com/Afra-Fashion-105564098169865/?ref=page_internal"><i class="fab fa-facebook-square"></i>
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
                                <p>Copyright © <a href="http://www.dionescollection.com">dionescollection.com</a>| All Rights Reserved</p>
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

        <script type="text/javascript">
            function googleTranslateElementInit() {
                // new google.translate.TranslateElement({pageLanguage: 'en'}, 'google_translate_element');
                new google.translate.TranslateElement({pageLanguage: 'en',includedLanguages: 'en,fr,bn,ja,ko,de', layout: google.translate.TranslateElement.InlineLayout.SIMPLE}, 'google_translate_element');
            }
        </script>

        <script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>

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

        <script>
            var button = document.getElementById("button");
            var audio = document.getElementById("player");
            button.addEventListener("click", function() {
                if (audio.paused) {
                    audio.play();
                    button.innerHTML = "<i class='fa fa-pause'></i>";
                } else {
                    audio.pause();
                    button.innerHTML = "<i class='fa fa-play'></i>";
                }
            });
            button.innerHTML = "<i class='fa fa-pause'></i>";
        </script>

    </body>
</html>






