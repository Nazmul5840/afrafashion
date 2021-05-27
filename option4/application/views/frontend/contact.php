
<section id="aa-contact">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="aa-contact-area">
                    <div class="aa-contact-top">
                        <h2>Contact US</h2>
                    </div>
                    <!-- Contact address -->
                    <div class="aa-contact-address">
                        <div class="row">
                            <div class="col-md-8">
                                <?php if($this->input->post('email')) {  ?>
                                <div class="alert alert-success">
                                    <strong>Success!</strong> Your Message Sent Successfully
                                </div>
                                <?php } ?>
                                <div class="aa-contact-address-left">
                                    <form class="comments-form contact-form" method="post" action="<?php echo base_url('main/contact') ?>">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <input type="text" placeholder="Your Name" required class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <input type="email" name="email" placeholder="Email" required class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <input type="text" placeholder="Subject" required class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <input type="text" placeholder="Company" required class="form-control">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12 col-lg-12 col-sm-12">
                                                <div class="form-group">
                                                    <textarea style="width:100%;" required class="form-control" rows="3" placeholder="Message"></textarea>
                                                </div>
                                            </div>
                                        </div>

                                        <button type="submit" class="aa-secondary-btn">Send</button>
                                    </form>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="aa-contact-address-right">
                                    <address>
                                        <h4 style="font-weight: bold;">DionesCollection (UK)</h4>
                                        <p>Diones collection LLC</p>
                                        <p style="font-weight: bold;">(Registration No- 13035466)</p>
                                        <p>71-75, Shelton Street . Covent Garden,London
                                            WC2H9JQ, UK.</p>
                                    </address>

                                    <address>
                                        <h4 style="font-weight: bold;">DionesCollection (Bangladesh)</h4>
                                        <!--                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rerum modi dolor facilis! Nihil error, eius.</p>-->
                                        <p><span class="fa fa-home"></span>Tenament #6, Flat #H-5, Road #6, Block #E , Bashundhara, Dhaka , Bangladesh</p>
                                        <p><span class="fa fa-phone"></span>+8801714080688</p>
                                        <p><span class="fa fa-envelope"></span>Email: info@dionescollection.com</p>
                                    </address>

                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- contact map -->
                    <div class="aa-contact-map">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3650.1986003156644!2d90.4308364491746!3d23.811535892282286!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755c6353cff0fe5%3A0xb499d70a98ea02cf!2sTenement%206%2C%20Plot-301%2FA%2C%206%20Bashundhara%20Rd%2C%20Dhaka%201229!5e0!3m2!1sen!2sbd!4v1605361551951!5m2!1sen!2sbd" width="100%" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>