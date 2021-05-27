<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="row">
            <div class="aa-popular-category-area">
                <!-- start prduct navigation -->
                <ul class="nav nav-tabs aa-products-tab">
                    <li class="active"><a href="#popular" data-toggle="tab">Popular</a></li>
                    <li><a href="#featured" data-toggle="tab">Featured</a></li>
                    <li><a href="#latest" data-toggle="tab">Latest</a></li>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content">
                    <!-- Start men popular category -->
                    <div class="tab-pane fade in active" id="popular">
                        <?php
                        $popular = getPopularProduct();
                        if(!empty($popular)){

                        ?>
                        <ul class="aa-product-catg aa-popular-slider">
                            <!-- start single product item -->
                            <?php foreach($popular as $item) {
                                echo displayProductCart($item->title,$item->cart_photo,$item->jilancollection_id);

                            } ?>
                        </ul>
                        <a class="aa-browse-btn" href="<?php echo base_url('main/products?tag=popular') ?>">Browse all Product <span
                                class="fa fa-long-arrow-right"></span></a>
                        <?php } ?>
                    </div>
                    <!-- / popular product category -->

                    <!-- start featured product category -->
                    <div class="tab-pane fade" id="featured">
                        <?php
                        $popular = getFeaturedProduct();
                        if(!empty($popular)){

                            ?>
                            <ul class="aa-product-catg aa-popular-slider">
                                <!-- start single product item -->
                                <?php foreach($popular as $item) {
                                    echo displayProductCart($item->title,$item->cart_photo,$item->jilancollection_id);

                                } ?>
                            </ul>
                            <a class="aa-browse-btn" href="<?php echo base_url('main/products?tag=featured') ?>">Browse all Product <span
                                        class="fa fa-long-arrow-right"></span></a>
                        <?php } ?>
                    </div>
                    <!-- / featured product category -->

                    <!-- start latest product category -->
                    <div class="tab-pane fade" id="latest">
                        <?php
                        $popular = getLatestProduct();
                        if(!empty($popular)){

                            ?>
                            <ul class="aa-product-catg aa-popular-slider">
                                <!-- start single product item -->
                                <?php foreach($popular as $item) {
                                    echo displayProductCart($item->title,$item->cart_photo,$item->jilancollection_id);

                                } ?>
                            </ul>
                            <a class="aa-browse-btn" href="<?php echo base_url('main/products?tag=latest') ?>">Browse all Product <span
                                        class="fa fa-long-arrow-right"></span></a>
                        <?php } ?>
                    </div>
                    <!-- / latest product category -->
                </div>
            </div>
        </div>
    </div>
</div>