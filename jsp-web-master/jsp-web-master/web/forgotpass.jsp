<%-- 
    Document   : forgotpass
    Created on : Dec 4, 2018, 12:23:46 PM
    Author     : 500PING-LT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Restore password</title>
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
                $('#ReRePass').keyup(function () {
                    var pass = $('#RePass').val();
                    var repass = $('#ReRePass').val();
                    
                    $('#ReRePass')[0].setCustomValidity("Password Don't Match");
                    
                    if (repass.length === 0){
                        $('#ReRePass')[0].setCustomValidity('');
                    }

                    if (pass === repass) {
                        $('#ReRePass')[0].setCustomValidity('');
                    }
                });
                
                $('#ReMail').keyup(function(){
                    var mail = $('#ReMail').val();
                    
                    if (mail.length === 0) {
                        $('#ReMail')[0].setCustomValidity('');
                    }
                    
                    $.ajax({
                        type: 'POST',
                        data: {
                            mail : mail,
                            action: 'restorePass'
                        },
                        url: "/KTT_-_SHOP/CheckDupicate",
                        async: false,
                        success: function (data) {
                            if (data !== "0") {
                                $('#ReMail')[0].setCustomValidity("Email không tồn tại!");
                            } else {
                                $('#ReMail')[0].setCustomValidity('');
                            }
                        }
                    });
                });
            });
            
            function checkSubmit(){
                alert('Thay đổi mật khẩu thành công!');
                return true;
            }
        </script>
    </head><!--/head-->
    <body>
        <jsp:include page="header.jsp"></jsp:include>

        <section style="margin-bottom: 30px;"><!--form-->
                <div class="container">
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-1">
                            <div class="login-form"><!--login form-->
                                <h2>Restore your password</h2>
                                <form action="Controller" method="post" onsubmit="return checkSubmit()">
                                    <input type="email" id="ReMail" name="ReEmail" placeholder="Email Address" required="" />
                                    <input type="password" id="RePass" name="RePass" placeholder="New-Password" required="" />
                                    <input type="password" id="ReRePass" name="ReRePass" placeholder="Re-Password" required="" />
                                    <button type="submit" name="action" value="restore" class="btn btn-default">Restore</button>
                                </form>
                            </div><!--/login form-->
                        </div>
                    </div>
                </div>
            </section><!--/form-->

        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
