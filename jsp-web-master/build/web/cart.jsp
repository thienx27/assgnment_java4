<%-- 
    Document   : cart
    Created on : Nov 11, 2018, 6:50:41 PM
    Author     : 500PING-PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Cart</title>
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
        <c:set var="shop" value="${sessionScope.SHOP}"/>
        <jsp:include page="header.jsp"></jsp:include>

            <section id="cart_items">
                <div class="container">
                    <div class="table-responsive cart_info">
                        <table class="table table-condensed">
                            <thead>
                                <tr class="cart_menu">
                                    <td class="image">Item</td>
                                    <td class="description"></td>
                                    <td class="price">Price</td>
                                    <td class="quantity">Quantity</td>
                                    <td class="total">Total</td>
                                    <td></td>
                                </tr>
                            </thead>
                            <tbody>
                            <c:if test="${not empty shop}">
                                <c:forEach var="row" items="${shop}">
                                <tr>
                                    <td class="cart_product">
                                        <a href=""><img src="images/shop/${row.value.sp.image}" width="150px" height="150px" alt=""></a>
                                    </td>
                                    <td class="cart_description">
                                        <h4><a href="">${row.value.sp.tenSP}</a></h4>
                                        <p>Product ID: ${row.value.sp.maSP}</p>
                                    </td>
                                    <td class="cart_price">
                                        <p>$${row.value.sp.donGia}</p>
                                    </td>
                                    <td class="cart_quantity">
                                        <div class="cart_quantity_button">
                                            <a class="cart_quantity_up" href="CartController?action=Add quantity&MaSP=${row.value.sp.maSP}"> + </a>
                                            <input class="cart_quantity_input" type="text" name="quantity" value="${row.value.soLuong}" min="1" autocomplete="off" size="2" readonly="">
                                            <a class="cart_quantity_down" href="CartController?action=Sub quantity&MaSP=${row.value.sp.maSP}"> - </a>
                                        </div>
                                    </td>
                                    <td class="cart_total">
                                        <p class="cart_total_price">$${row.value.sp.donGia * row.value.soLuong}</p>
                                    </td>
                                    <td class="cart_delete">
                                        <a class="cart_quantity_delete" href="CartController?action=remove cart item1&MaSP=${row.value.sp.maSP}"><i class="fa fa-times"></i></a>
                                    </td>
                                </tr>
                                </c:forEach>
                            </c:if>   
                            <c:if test="${empty shop}">    
                                <tr>
                                    <th colspan="5" style="text-align: center;color: pink"><h2>Không có sản phẩm nào trong giỏ hàng!</h2></th>
                                </tr>
                            </c:if>    
                            </tbody>
                        </table>
                    </div>
                </div>
            </section> <!--/#cart_items-->

            <section id="do_action">
                <div class="container">
                    <div class="pull-right">
                        <a class="btn btn-default update" href="shop.jsp">Mua thêm</a>
                        <%
                            if (session.getAttribute("id") != null){
                        %>
                        <a class="btn btn-default check_out" href="checkout.jsp?&MaKH=<c:out value="${sessionScope.id}" />">Thanh toán</a>
                        <%
                            }else{
                        %>
                        <a class="btn btn-default check_out" href="checkout.jsp">Thanh toán</a>
                        <%
                            }
                        %>
                    </div>
                </div>
            </section><!--/#do_action-->

        <jsp:include page="footer.jsp"></jsp:include>

        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/price-range.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
