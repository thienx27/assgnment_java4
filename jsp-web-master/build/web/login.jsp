<%-- 
    Document   : login
    Created on : Nov 11, 2018, 6:51:02 PM
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
        <title>Login</title>
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
        <script>
            $(document).ready(function () {
                $('#suRePass').keyup(function () {
                    var pass = $('#suPass').val();
                    var repass = $('#suRePass').val();
                    
                    $('#suRePass')[0].setCustomValidity("Password Don't Match");

                    if (pass === repass) {
                        $('#suRePass')[0].setCustomValidity('');
                    }
                });

                $('#suMail').keyup(function () {
                    var mail = $('#suMail').val();

                    if (mail.length === 0) {
                        $('#suMail')[0].setCustomValidity('');
                    }

                    $.ajax({
                        type: 'POST',
                        data: {
                            mail : mail,
                            action: 'khregis'
                        },
                        url: "/KTT_-_SHOP/CheckDupicate",
                        async: false,
                        success: function (data) {
                            if (data === "0") {
                                $('#suMail')[0].setCustomValidity("This id has already exit");
                            } else {
                                $('#suMail')[0].setCustomValidity('');
                            }
                        }
                    });
                });
            });
            
            function checkLogin(){
                var mail = $('#liMail').val();
                var pass = $('#liPass').val();
                var chk = true;
                
                $.ajax({
                    type: 'POST',
                    data: {
                        mail : mail,
                        pass : pass,
                        action: 'khlogin'
                    },
                    url: "/KTT_-_SHOP/CheckDupicate",
                    async: false,
                    success: function (data) {
                        if (data === "0") {
                            alert("Sai tên tài khoản hoặc mật khẩu!");
                            chk = false;
                        }
                    }
                });
                
                if (chk){
                    return true;
                } else {
                    return false;
                }
            }
            
            function signup(){
                alert("Đăng ký thành công!");
                return true;
            }
        </script>
    </head><!--/head-->
    <body>
        <jsp:include page="header.jsp"></jsp:include>

        <section style="margin-bottom: 30px;"><!--form-->
                <div class="container">
                    <div class="row">
                        <div class="col-sm-4 col-sm-offset-1">
                            <div class="login-form"><!--login form-->
                                <h2>Login to your account</h2>
                                <form action="Controller" method="post" onsubmit="return checkLogin()">
                                    <input type="email" id="liMail" name="dnEmail" placeholder="Email Address" required="" />
                                    <input type="password" id="liPass" name="dnPass" placeholder="Password" required="" />
                                    Forget password?<a href="forgotpass.jsp"> click here</a><br>
                                    <button type="submit" name="action" value="login" class="btn btn-default">Login</button>
                                </form>
                            </div><!--/login form-->
                        </div>
                        <div class="col-sm-1">
                            <h2 class="or">OR</h2>
                        </div>
                        <div class="col-sm-4">
                            <div class="signup-form"><!--sign up form-->
                                <h2>New User Signup!</h2>
                                <form action="Controller" method="post" onsubmit="return signup()">
                                    <input type="text" placeholder="Name" maxlength="50" name="dkName" required=""/>
                                    <input type="email" id="suMail" name="dkMail" maxlength="50" placeholder="Email Address" required=""/>
                                    <input type="password" id="suPass" name="dkPass" maxlength="50" minlength="5" placeholder="Password" required=""/>
                                    <input type="password" id="suRePass" maxlength="50" minlength="5" placeholder="Re-Password" required=""/>
                                    <input type="text" placeholder="Address" maxlength="255" name="dkAddress" required=""/>
                                    <input type="text" placeholder="Phone" pattern="(\+84|0)\d{9,10}" name="dkPhone" title="Nhập số điện thoại từ 10 đến 11 số" required=""/>
                                    <button type="submit" name="action" value="signup" class="btn btn-default">Signup</button>
                                </form>
                            </div><!--/sign up form-->
                        </div>
                    </div>
                </div>
            </section><!--/form-->

        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>


