<#import "parts/page.ftl" as p>

<@p.page>
<#--<head>-->


<#--    <title>login</title>-->
<#--    <link href="http://localhost:8080/static/css/loginstyle.css" rel="stylesheet">-->


<#--    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">-->

<#--    <!------ Include the above in your HEAD tag --------&ndash;&gt;-->

<#--    <!-- All the files that are required &ndash;&gt;-->
<#--    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">-->
<#--    <link href='https://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'>-->
<#--    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />-->


<#--</head> -->

<#--<body>-->

<script src="/static/js/jsloginstyle.js"></script>

<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.13.1/jquery.validate.min.js"></script>


<!-- Where all the magic happens -->
<!-- LOGIN FORM -->
<div class="text-center" style="padding:50px 0">
    <div class="logo">login</div>
    <!-- Main Form -->
    <div class="login-form-1">
        <form id="login-form" class="text-left" action="/login" method="post" modelattribute="user">
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <div class="login-form-main-message"></div>
            <div class="main-login-form">
                <div class="login-group">
                    <div class="form-group">
                        <label for="username" class="sr-only">Username</label>
                        <input type="text" class="form-control" id="username" name="username" placeholder="username">
                    </div>
                    <div class="form-group">
                        <label for="password" class="sr-only">Password</label>
                        <input type="password" class="form-control" id="password" name="password" placeholder="password">
                    </div>
                </div>
                <button type="submit" class="login-button"><i class="fa fa-chevron-right"></i></button>
            </div>

            <!-- forgot password, registry href -->
           <div class="etc-login-form">
               <!-- <p>forgot your password? <a href="#">click here</a></p> -->
                <p>new user? <a href="/registration">create new account</a></p>
            </div>

        </form>
    </div>
    <!-- end:Main Form -->
</div>



<#--</body>-->
<!--
    <div class="text-center" style="padding:50px 0">
        <div class="logo">forgot password</div>

        <div class="login-form-1">
            <form id="forgot-password-form" class="text-left">
                <div class="etc-login-form">
                    <p>When you fill in your registered email address, you will be sent instructions on how to reset your password.</p>
                </div>
                <div class="login-form-main-message"></div>
                <div class="main-login-form">
                    <div class="login-group">
                        <div class="form-group">
                            <label for="fp_email" class="sr-only">Email address</label>
                            <input type="text" class="form-control" id="fp_email" name="fp_email" placeholder="email address">
                        </div>
                    </div>
                    <button type="submit" class="login-button"><i class="fa fa-chevron-right"></i></button>
                </div>
                <div class="etc-login-form">
                    <p>already have an account? <a href="#">login here</a></p>
                    <p>new user? <a href="#">create new account</a></p>
                </div>
            </form>
        </div>
    </div>
-->
</@p.page>