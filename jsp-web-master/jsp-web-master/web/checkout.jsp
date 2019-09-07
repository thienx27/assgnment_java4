<%-- 
    Document   : checkout
    Created on : Nov 11, 2018, 6:50:47 PM
    Author     : 500PING-PC
--%>

<%@page import="ktt.dao.KhachHangDAO"%>
<%@page import="ktt.model.KhachHang"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Checkout</title>
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
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/price-range.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
    </head><!--/head-->
    <body>
        <c:set var="shop" value="${sessionScope.SHOP}"/>
        <%
            String maKH = "";
            String tenKH = "";
            String diaChi = "";
            String email = "";
            String dienThoai = "";
            KhachHang kh = new KhachHang();
            if (session.getAttribute("Username") != null){    
                maKH = String.valueOf(session.getAttribute("id"));
                kh = KhachHangDAO.getKH(maKH);
                tenKH = kh.getTenKH();
                diaChi = kh.getDiaChi();
                email = kh.getEmail();
                dienThoai = kh.getDienThoai();
            }  
        %>
        
        <jsp:include page="header.jsp"></jsp:include>

            <section id="cart_items">
                <form action="Controller" method="post">
                    <div class="container">
                        <div class="shopper-informations">
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="shopper-info">
                                        <p>Phương thức thanh toán</p>
                                        <div class="form-div">
                                            <label><input type="radio" name="pttt"> Thanh toán qua thẻ nội địa</label>
                                            <label><input type="radio" name="pttt"> Thanh toán qua thẻ quốc tế</label>
                                            <label><input type="radio" name="pttt"> Thanh toán tại nhà (COD)</label>
                                            <label><input type="radio" name="pttt"> Đặt hàng tại shop</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-5 clearfix">
                                    <div class="bill-to">
                                        <p>Địa chỉ nhận</p>
                                        <div class="form-one">
                                            <div class="form-div">
                                                <input type="text" name="chkoutTen" value="<%= tenKH%>" placeholder="Full Name *" required="">
                                                <input type="text" name="chkoutAddress" value="<%= diaChi%>" placeholder="Address 1 *" required="">
                                                <input type="text" placeholder="Address 2">
                                            </div>
                                        </div>
                                        <div class="form-two">
                                            <div class="form-div">
                                                <input type="email" name="chkoutEmail" value="<%= email%>" placeholder="Email*" required="">
                                                <input type="text" name="chkoutPhone" value="<%= dienThoai%>" pattern="(\+84|0)\d{9,10}" title="Nhập số điện thoại từ 10 đến 11 số" placeholder="Phone *" required="">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="order-message">
                                        <p>Note</p>
                                        <textarea name="chkoutMoTa" placeholder="Notes about your order, Special Notes for Delivery" rows="16" required=""></textarea>
                                    </div>	
                                </div>					
                            </div>
                        </div>
                        <div class="review-payment">
                            <h2>Thông tin giỏ hàng</h2>
                        </div>

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
                                <c:set var="sum" value="0"/>
                                <c:if test="${not empty shop}">
                                    <c:forEach var="row" items="${shop}">
                                        <c:set var="sum" value="${sum + row.value.sp.donGia * row.value.soLuong}"/>
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
                                                <input class="cart_quantity_input" type="text" name="quantity" value="${row.value.soLuong}" min="1" max="10" autocomplete="off" size="2" readonly="">
                                            </div>
                                        </td>
                                        <td class="cart_total">
                                            <p class="cart_total_price">$${row.value.sp.donGia * row.value.soLuong}</p>
                                        </td>
                                        <td class="cart_delete">
                                            <a class="cart_quantity_delete" href="CartController?action=remove cart item2&MaSP=${row.value.sp.maSP}"><i class="fa fa-times"></i></a>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                </c:if>    
                                    <tr>
                                        <td colspan="4">&nbsp;</td>
                                        <td colspan="2">
                                            <table class="table table-condensed total-result">
                                                <tr>
                                                    <td>Cart Sub Total</td>
                                                    <td>$${sum}</td>
                                                </tr>
                                                <tr>
                                                    <td>Exo Tax</td>
                                                    <td>$0</td>
                                                </tr>
                                                <tr class="shipping-cost">
                                                    <td>Shipping Cost</td>
                                                    <td>Free</td>										
                                                </tr>
                                                <tr>
                                                    <td>Total</td>
                                                    <td><span>$${sum}</span></td>
                                                </tr>
                                            </table>
                                        </td>   
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <input type="hidden" name="chkoutSum" value="${sum}"/>
                    <div class="container" style="margin-bottom: 50px;">
                        <div class="pull-right">
                            <a href="cart.jsp" class="btn btn-default">Quay lại</a>
                            <button type="submit" name="action" value="checkout" class="btn btn-default">Đặt hàng</button>
                        </div>
                    </div>
                </form>
            </section>

        <jsp:include page="footer.jsp"></jsp:include>
  
    </body>
</html>
