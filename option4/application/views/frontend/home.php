<?php
$this->load->view('frontend/slider');
//$this->load->view('frontend/product');
?>


<!-- popular section -->
<section id="aa-popular-category">
    <div class="container">
         <h2>Welcome</h2>
        <div class="row">
            <div class="col-md-5 col-sm-5 col-lg-5">
                <img src="<?php echo base_url('assets/frontend/img/welcome.jpg'); ?>"/>
            </div>
            <div class="col-md-6 col-sm-6 col-lg-6">
                <h2>DionesnesCollection</h2> 
                Dionescollection is one of the promising buying/sourcing agent in Dhaka, Bangladesh. Our core products are Fashion apparel, Footwear , accessories, Leather and Jute products. We have own factory and copartner with some well reputed certified factories in the town. We have skilled and experienced professionals to meet with ever changing trends/needs in the market.
                <br/><br/>
                So far we have worked with many retailers and importers around and we have our regular customer who been sourcing their products through us. We are committed for premium quality in most competitive prices. Dionescollection  does not measure the value of clients with their order volume. Every idea is valuable, and welcome here.
                 <br/>
                <a class="aa-browse-btn" href="<?php echo base_url('main/about'); ?>" style="margin-top:50px; ">About Us</a>
            </div>
        </div>
<!--        <br/>-->
<!--        <br/>-->

        <?php
            $this->load->view('frontend/popular_product');
        ?>

    </div>
</section>
<!-- / popular section -->

