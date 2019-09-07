<%-- 
    Document   : index
    Created on : Nov 11, 2018, 4:02:36 PM
    Author     : 500PING-PC
--%>

<%@page import="ktt.dao.SanPhamDAO"%>
<%@page import="ktt.model.SanPham"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Home | E-Shopper</title>
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
        <!--        <link rel="shortcut icon" href="images/ico/favicon.ico">-->
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
    </head><!--/head-->
    <body>

        <jsp:include page="header.jsp"></jsp:include>

        <jsp:include page="banner.jsp"></jsp:include>

            <section>
                <div class="container">
                    <div class="row">
                        <div class="col-sm-3">
                        <jsp:include page="sidebar.jsp"></jsp:include>
                        </div>

                        <div class="col-sm-9 padding-right">
                            <div class="features_items"><!--features_items-->
                                <h2 class="title text-center">Features Items</h2>
                                <%
                                    ArrayList <SanPham> ls = SanPhamDAO.getAll();
                                    int i = 1;
                                    for (SanPham sp : ls){
                                %>
                                <div class="col-sm-4">
                                    <div class="product-image-wrapper">
                                        <div class="single-products">
                                            <div class="productinfo text-center">
                                                <img src="images/shop/<%= sp.getImage()%>" width="249px" height="268px" alt="" />
                                                <h2>$<%= sp.getDonGia()%></h2>
                                                <p><%= sp.getTenSP()%></p>
                                                <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-info-circle"></i>Show info</a>
                                            </div>
                                            <div class="product-overlay">
                                                <div class="overlay-content">
                                                    <h2>$56</h2>
                                                    <p>Easy Polo Black Edition</p>
                                                    <a href="CartController?action=Add to cart 2&MaSP=<%= sp.getMaSP()%>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                    <a href="product.jsp?MaSP=<%= sp.getMaSP()%>" class="btn btn-default add-to-cart"><i class="fa fa-info-circle"></i>Show info</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%
                                        i++;
                                        if (i == 7){
                                            break;
                                        }
                                    }
                                %>

                            </div><!--features_items-->

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
