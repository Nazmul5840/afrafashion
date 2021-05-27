
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
                                        <h4 style="font-weight: bold;">Office</h4>
                                        <p>Afra Fashion House</p>
                                        <p style="font-weight: bold;">(Registration No- 13035466)</p>
                                        <p>Kodam Ali Madrasha Road, Dhaka, Dhaka Division, Bangladesh</p>
                                        <p><span class="fa fa-phone"></span>+8801842080688</p>
                                        <p><span class="fa fa-envelope"></span>Email: info@dionescollection.com</p>
                                    </address>

                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- contact map -->
                    <div class="aa-contact-map">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7304.414203636865!2d90.42359953660636!3d23.73999305510485!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755b84021a27441%3A0xeb353a7f06a7ad40!2sBashabo%20Balur%20Math!5e0!3m2!1sen!2sbd!4v1621836074721!5m2!1sen!2sbd" width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>