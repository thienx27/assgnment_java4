<%-- 
    Document   : product
    Created on : Nov 14, 2018, 9:04:33 AM
    Author     : 500PING-PC
--%>

<%@page import="ktt.dao.SanPhamDAO"%>
<%@page import="ktt.model.SanPham"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Product</title>
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
        <%
            String masp = request.getParameter("MaSP");
            SanPham sp = SanPhamDAO.getSP(masp);
        %>

        <jsp:include page="header.jsp"></jsp:include>

            <section id="advertisement">
                <div class="container">
                    <img src="images/shop/advertisement.jpg" alt="" />
                </div>
            </section>

            <section>
                <div class="container">
                    <div class="row">
                        <div class="col-sm-3">
                        <jsp:include page="sidebar.jsp"></jsp:include>
                        </div>

                        <div class="col-sm-9 padding-right">
                            <div class="product-details"><!--product-details-->
                                <div class="col-sm-5">
                                    <div class="view-product">
                                        <img src="images/shop/<%= sp.getImage()%>" alt="" />
                                    <h3 style="cursor: pointer">ZOOM</h3>
                                    </div>
                                </div>
                                <div class="col-sm-7">
                                    <form class="product-information" action="CartController" method="get"><!--/product-information-->
                                        <h2><%= sp.getTenSP()%></h2>
                                        <p>Product ID: <%= sp.getMaSP()%></p>
                                        <img src="images/product-details/rating.png" alt="" />
                                        <span>
                                            <span>US $<%= sp.getDonGia()%></span>
                                            <label>Quantity:</label>
                                            <input type="number" value="1" min="1" max="10" name="txtQuantity" required=""/>
                                            <input type="hidden" value="<%= sp.getMaSP()%>" name="txtMaSP"/>
                                            <button type="submit" name="action" value="Add to cart3" class="btn btn-fefault cart">
                                                <i class="fa fa-shopping-cart"></i>
                                                Add to cart
                                            </button>
                                        </span>
                                        <p><b>Availability:</b> <%= sp.getTrangThai()%></p>
                                        <p><b>Condition:</b> New</p>
                                        <p><b>Brand:</b> <%= sp.getNhanHieu()%></p>
                                        <a href=""><img src="images/product-details/share.png" class="share img-responsive"  alt="" /></a>
                                    </form><!--/product-information-->
                                </div>
                            </div><!--/product-details-->

                            <div class="category-tab shop-details-tab"><!--category-tab-->
                                <div class="col-sm-12">
                                    <ul class="nav nav-tabs">
                                        <li><a href="#details" data-toggle="tab">Details</a></li>
                                        <li class="active"><a href="#reviews" data-toggle="tab">Reviews (5)</a></li>
                                    </ul>
                                </div>
                                <div class="tab-content">
                                    <div class="tab-pane fade" id="details" >
                                        <div style="margin-left: 30px;">
                                            <h1 style="color: #ff9966"><b><%= sp.getTenSP()%></b></h1>
                                            <h3><p><b>- Brand:</b> <%= sp.getNhanHieu()%></p></h3>
                                            <h3><p><b>- Category:</b> <%= sp.getMaLoai()%></p></h3>
                                            <h3><p><b>- Describe:</b> <%= sp.getMoTa()%></p></h3>
                                        </div>                                      
                                    </div>

                                    <div class="tab-pane fade active in" id="reviews" >
                                        <div class="col-sm-12">
                                            <ul>
                                                <li><a href=""><i class="fa fa-user"></i>Thắng</a></li>
                                                <li><a href=""><i class="fa fa-clock-o"></i>08:41 PM</a></li>
                                                <li><a href=""><i class="fa fa-calendar-o"></i>31 DEC 2017</a></li>
                                            </ul>
                                            <p>Đẹp vcl.</p>
                                            <hr>
                                            <ul>
                                                <li><a href=""><i class="fa fa-user"></i>Khánh</a></li>
                                                <li><a href=""><i class="fa fa-clock-o"></i>05:41 PM</a></li>
                                                <li><a href=""><i class="fa fa-calendar-o"></i>31 DEC 2017</a></li>
                                            </ul>
                                            <p>ngon vcl.</p>
                                            <hr>
                                            <ul>
                                                <li><a href=""><i class="fa fa-user"></i>Thành</a></li>
                                                <li><a href=""><i class="fa fa-clock-o"></i>11:41 AM</a></li>
                                                <li><a href=""><i class="fa fa-calendar-o"></i>31 DEC 2017</a></li>
                                            </ul>
                                            <p>Trất vcl.</p>
                                            <hr>
                                            <p><b>Write Your Review</b></p>

                                            <form action="#">
                                                <span>
                                                    <input type="text" placeholder="Your Name"/>
                                                    <input type="email" placeholder="Email Address"/>
                                                </span>
                                                <textarea name="" ></textarea>
                                                <b>Rating: </b> <img src="images/product-details/rating.png" alt="" />
                                                <button type="button" class="btn btn-default pull-right">
                                                    Submit
                                                </button>
                                            </form>
                                        </div>
                                    </div>

                                </div>
                            </div><!--/category-tab-->

                            <div class="recommended_items"><!--recommended_items-->
                                <h2 class="title text-center">recommended items</h2>

                                <div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
                                    <div class="carousel-inner">
                                        <div class="item active">	
                                            <div class="col-sm-4">
                                                <div class="product-image-wrapper">
                                                    <div class="single-products">
                                                        <div class="productinfo text-center">
                                                            <img src="images/home/recommend1.jpg" alt="" />
                                                            <h2>$96</h2>
                                                            <p>Em gái tóc vàng</p>
                                                            <a href="shop.jsp?&MaLoai=null&NhanHieu=null" class="btn btn-default add-to-cart"><i class="fa"></i>Wanna more?</a>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="product-image-wrapper">
                                                    <div class="single-products">
                                                        <div class="productinfo text-center">
                                                            <img src="images/home/recommend2.jpg" alt="" />
                                                            <h2>$69</h2>
                                                            <p>Em gái áo đỏ</p>
                                                            <a href="shop.jsp?&MaLoai=null&NhanHieu=null" class="btn btn-default add-to-cart"><i class="fa"></i>Wanna more?</a>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="product-image-wrapper">
                                                    <div class="single-products">
                                                        <div class="productinfo text-center">
                                                            <img src="images/home/recommend3.jpg" alt="" />
                                                            <h2>$96</h2>
                                                            <p>Em gái áo hồng</p>
                                                            <a href="shop.jsp?&MaLoai=null&NhanHieu=null" class="btn btn-default add-to-cart"><i class="fa"></i>Wanna more?</a>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="item">	
                                            <div class="col-sm-4">
                                                <div class="product-image-wrapper">
                                                    <div class="single-products">
                                                        <div class="productinfo text-center">
                                                            <img src="images/home/recommend1.jpg" alt="" />
                                                            <h2>$69</h2>
                                                            <p>Em gái tóc vàng</p>
                                                            <a href="shop.jsp?&MaLoai=null&NhanHieu=null" class="btn btn-default add-to-cart"><i class="fa"></i>Wanna more?</a>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="product-image-wrapper">
                                                    <div class="single-products">
                                                        <div class="productinfo text-center">
                                                            <img src="images/home/recommend2.jpg" alt="" />
                                                            <h2>$96</h2>
                                                            <p>Em gái áo đỏ</p>
                                                            <a href="shop.jsp?&MaLoai=null&NhanHieu=null" class="btn btn-default add-to-cart"><i class="fa"></i>Wanna more?</a>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="product-image-wrapper">
                                                    <div class="single-products">
                                                        <div class="productinfo text-center">
                                                            <img src="images/home/recommend3.jpg" alt="" />
                                                            <h2>$69</h2>
                                                            <p>Em gái áo hồng</p>
                                                            <a href="shop.jsp?&MaLoai=null&NhanHieu=null" class="btn btn-default add-to-cart"><i class="fa"></i>Wanna more?</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <a class="left recommended-item-control" href="#recommended-item-carousel" data-slide="prev">
                                        <i class="fa fa-angle-left"></i>
                                    </a>
                                    <a class="right recommended-item-control" href="#recommended-item-carousel" data-slide="next">
                                        <i class="fa fa-angle-right"></i>
                                    </a>			
                                </div>
                            </div><!--/recommended_items-->

                        </div>
                    </div>
                </div>
            </section>

        <jsp:include page="footer.jsp"></jsp:include>

        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/price-range.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
