<%-- 
    Document   : header
    Created on : Nov 11, 2018, 4:04:05 PM
    Author     : 500PING-PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="ktt.model.LoaiSP"%>
<%@page import="ktt.dao.LoaiSpDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>header</title>
    </head>
    <body>
        <c:set var="shop" value="${sessionScope.SHOP}"/>
        <c:set var="count" value="0"/>
        <c:if test="${not empty shop}">
            <c:forEach items="${shop}">
                <c:set var="count" value="${count + 1}"/>
            </c:forEach>
        </c:if>
        <header id="header"><!--header-->
            <div class="header_top"><!--header_top-->
                <div class="container">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="contactinfo">
                                <ul class="nav nav-pills">
                                    <li><a href="#"><i class="fa fa-phone"></i> +84 696 969 696</a></li>
                                    <li><a href="#"><i class="fa fa-envelope"></i> ktt69@xvideo.com</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="social-icons pull-right">
                                <ul class="nav navbar-nav">
                                    <li><a href="https://www.facebook.com/" target="_blank"><i class="fa fa-facebook"></i></a></li>
                                    <li><a href="https://twitter.com/?lang=vi" target="_blank"><i class="fa fa-twitter"></i></a></li>
                                    <li><a href="https://www.linkedin.com/" target="_blank"><i class="fa fa-linkedin"></i></a></li>
                                    <li><a href="https://dribbble.com/" target="_blank"><i class="fa fa-dribbble"></i></a></li>
                                    <li><a href="https://plus.google.com/discover" target="_blank"><i class="fa fa-google-plus"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!--/header_top-->

            <div class="header-middle"><!--header-middle-->
                <div class="container">
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="logo pull-left">
                                <a href="index.jsp"><img src="images/home/logo.png" alt="" /></a>
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <div class="shop-menu pull-right">
                                <ul class="nav navbar-nav">
                                    <%
                                        if (session.getAttribute("Username") != null){
                                    %>
                                    <li><a href="#"><i class="fa fa-user"></i> ${sessionScope.Username}</a></li>
                                    <li><a href="cart.jsp"><i class="fa fa-shopping-cart"></i> Giỏ hàng (<span style="color:red">${count}</span>)</a></li>
                                    <li><a href="Controller?action=logout"><i class="fa fa-lock"></i> Đăng xuất</a></li>
                                    <%
                                        } else{
                                    %>
                                    <li><a href="cart.jsp"><i class="fa fa-shopping-cart"></i> Giỏ hàng (<span style="color:red">${count}</span>)</a></li>
                                    <li><a href="login.jsp"><i class="fa fa-lock"></i> Đăng nhập</a></li>
                                    <%
                                        }
                                    %>    
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!--/header-middle-->

            <div class="header-bottom"><!--header-bottom-->
                <div class="container">
                    <div class="row">
                        <div class="col-sm-9">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                            </div>
                            <div class="mainmenu pull-left">
                                <ul class="nav navbar-nav collapse navbar-collapse">
                                    <li><a href="index.jsp">Trang chủ</a></li>
                                    <li class="dropdown"><a href="shop.jsp">Cửa hàng<i class="fa fa-angle-down"></i></a>
                                        <ul role="menu" class="sub-menu">
                                            <%
                                                ArrayList <LoaiSP> ls = LoaiSpDAO.getAll();
                                                for (LoaiSP lsp : ls){
                                            %>
                                            <li><a href="shop.jsp?&MaLoai=<%= lsp.getMaLoai()%>"><%= lsp.getTenLoai()%></a></li>
                                            <%}%>
                                        </ul>
                                    </li> 
                                    <li><a href="https://www.facebook.com/" target="_blank">Facebook</a></li>
                                    <li><a href="contact.jsp">Liên hệ</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="search_box pull-right">
                                <input type="text" placeholder="Tìm kiếm..."/>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!--/header-bottom-->
        </header><!--/header-->
    </body>
</html>
