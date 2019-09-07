<%-- 
    Document   : contact
    Created on : Nov 11, 2018, 6:50:06 PM
    Author     : 500PING-PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Contact</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/prettyPhoto.css" rel="stylesheet">
        <link href="css/price-range.css" rel="stylesheet">
        <link href="css/animate.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->       
        <link rel="shortcut icon" href="images/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
    </head><!--/head-->
    <body>
        <jsp:include page="header.jsp"></jsp:include>

            <div id="contact-page" class="container">
                <div class="bg"> 	
                    <div class="row">    		
                        <div class="col-sm-12">    			   			
                            <h2 class="title text-center">Contact <strong>Us</strong></h2>    			    				    				
                            <div id="gmap" class="contact-map">
                                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3723.827504537848!2d105.80170781538106!3d21.03958689278332!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ab3e6416efc7%3A0x808741175914b86b!2zMTUgxJDDtG5nIFF1YW4sIFF1YW4gSG9hLCBD4bqndSBHaeG6pXksIEjDoCBO4buZaSwgVmlldG5hbQ!5e0!3m2!1sen!2sin!4v1541947619556" width="600" height="385" frameborder="0" style="border:0" allowfullscreen></iframe>
                            </div>
                        </div>			 		
                    </div>  
                    <div class="row">  	
                        <div class="col-sm-8">
                            <div class="contact-form">
                                <h2 class="title text-center">Get In Touch</h2>
                                <div class="status alert alert-success" style="display: none"></div>
                                <form id="main-contact-form" class="contact-form row" name="contact-form" method="post">
                                    <div class="form-group col-md-6">
                                        <input type="text" name="name" class="form-control" required placeholder="Name">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <input type="email" name="email" class="form-control" required placeholder="Email">
                                    </div>
                                    <div class="form-group col-md-12">
                                        <input type="text" name="subject" class="form-control" required placeholder="Subject">
                                    </div>
                                    <div class="form-group col-md-12">
                                        <textarea name="message" id="message" required class="form-control" rows="8" placeholder="Your Message Here"></textarea>
                                    </div>                        
                                    <div class="form-group col-md-12">
                                        <input type="submit" name="submit" class="btn btn-primary pull-right" value="Submit">
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="contact-info">
                                <h2 class="title text-center">Contact Info</h2>
                                <address>
                                    <p>KTT - group.</p>
                                    <p>FPT Polytechic, 15 Đông Quan, Cầu Giấy, Hà Nội</p>
                                    <p>hà Nội VN</p>
                                    <p>Mobile: +94 696 969 696</p>
                                    <p>Fax: 1-234-567-8910</p>
                                    <p>Email: ktt69@xvideo.com</p>
                                </address>
                                <div class="social-networks">
                                    <h2 class="title text-center">Social Networking</h2>
                                    <ul>
                                        <li>
                                            <a href="https://www.facebook.com/" target="_blank"><i class="fa fa-facebook"></i></a>
                                        </li>
                                        <li>
                                            <a href="https://twitter.com/?lang=vi" target="_blank"><i class="fa fa-twitter"></i></a>
                                        </li>
                                        <li>
                                            <a href="https://plus.google.com/discover" target="_blank"><i class="fa fa-google-plus"></i></a>
                                        </li>
                                        <li>
                                            <a href="https://www.youtube.com/" target="_blank"><i class="fa fa-youtube"></i></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>    
                    </div>  
                </div>	
            </div><!--/#contact-page-->

        <jsp:include page="footer.jsp"></jsp:include>

        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/price-range.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
