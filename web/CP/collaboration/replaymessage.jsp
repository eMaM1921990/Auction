<%-- 
    Document   : replaymessage
    Created on : May 14, 2014, 11:36:25 PM
    Author     : eMaM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <!-- Apple devices fullscreen -->
        <meta name="apple-mobile-web-app-capable" content="yes" />
        <!-- Apple devices fullscreen -->
        <meta names="apple-mobile-web-app-status-bar-style" content="black-translucent" />

        <title>Back Office | Live Virtual Auction</title>

        <!-- Bootstrap -->
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <!-- Bootstrap responsive -->
        <link rel="stylesheet" href="../css/bootstrap-responsive.min.css">
        <!-- jQuery UI -->
        <link rel="stylesheet" href="../css/plugins/jquery-ui/smoothness/jquery-ui.css">
        <link rel="stylesheet" href="../css/plugins/jquery-ui/smoothness/jquery.ui.theme.css">
        <!-- Theme CSS -->
        <link rel="stylesheet" href="../css/style.css">
        <!-- Color CSS -->
        <link rel="stylesheet" href="../css/themes.css">


        <!-- jQuery -->
        <script src="../js/jquery.min.js"></script>

        <!-- Nice Scroll -->
        <script src="../js/plugins/nicescroll/jquery.nicescroll.min.js"></script>
        <!-- imagesLoaded -->
        <script src="../js/plugins/imagesLoaded/jquery.imagesloaded.min.js"></script>
        <!-- jQuery UI -->
        <script src="../js/plugins/jquery-ui/jquery.ui.core.min.js"></script>
        <script src="../js/plugins/jquery-ui/jquery.ui.widget.min.js"></script>
        <script src="../js/plugins/jquery-ui/jquery.ui.mouse.min.js"></script>
        <script src="../js/plugins/jquery-ui/jquery.ui.resizable.min.js"></script>
        <script src="../js/plugins/jquery-ui/jquery.ui.sortable.min.js"></script>
        <script src="../js/plugins/jquery-ui/jquery.ui.draggable.min.js"></script>
        <!-- slimScroll -->
        <script src="../js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <!-- Bootstrap -->
        <script src="../js/bootstrap.min.js"></script>
        <!-- Bootbox -->
        <script src="../js/plugins/bootbox/jquery.bootbox.js"></script>
        <!-- Bootbox -->
        <script src="../js/plugins/form/jquery.form.min.js"></script>
        <!-- Validation -->
        <script src="../js/plugins/validation/jquery.validate.min.js"></script>
        <script src="../js/plugins/validation/additional-methods.min.js"></script>

        <!-- Theme framework -->
        <script src="../js/eakroko.min.js"></script>
        <!-- Theme scripts -->
        <script src="../js/application.min.js"></script>
        <!-- Just for demonstration -->
        <script src="../js/demonstration.min.js"></script>

        <!--[if lte IE 9]>
                <script src="js/plugins/placeholder/jquery.placeholder.min.js"></script>
                <script>
                        $(document).ready(function() {
                                $('input, textarea').placeholder();
                        });
                </script>
        <![endif]-->

        <!-- Favicon -->
        <link rel="shortcut icon" href="../img/favicon.ico" />
        <!-- Apple devices Homescreen icon -->
        <link rel="apple-touch-icon-precomposed" href="../img/apple-touch-icon-precomposed.png" />

    </head>

    <body>
        <%@include file="../header.jsp" %>
        <div class="container-fluid nav-hidden" id="content">

            <div id="main">
                <div class="container-fluid">
                    <div class="page-header">
                        <div class="pull-left">
                            <h1>Message Center</h1>
                        </div>
                        <div class="pull-right">

                            <ul class="stats">
                             
                                <li class='lightred'>
                                    <i class="icon-calendar"></i>
                                    <div class="details">
                                        <span class="big">February 22, 2013</span>
                                        <span>Wednesday, 13:56</span>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="breadcrumbs">
                        <ul>
                            <li>
                                <a href="../dashboard.jsp">Home</a>
                                <i class="icon-angle-right"></i>
                            </li>
                            <li>
                                <a href="#">Message</a>
                                <i class="icon-angle-right"></i>
                            </li>
                            <li>
                                <a href="listmessage.jsp">View</a>
                            </li>
                        </ul>
                        <div class="close-bread">
                            <a href="#">
                                <i class="icon-remove"></i>
                            </a>
                        </div>
                    </div>
                    <div class="row-fluid">
                        <div class="span12">
                            <div class="box">
                                <div class="box-title">
                                    <h3>
                                        <i class="icon-comments"></i>
                                        <span class="name" style="color: #006dcc">Subject : ${param.SUBJECT}</span>
                                    </h3>
                                    <div class="actions">
                                       
                                        <a href="#" class="btn btn-mini content-slideUp"><i class="icon-angle-down"></i></a>
                                    </div>
                                </div>
                                <div class="box-content nopadding">
                                    <ul class="messages">

                                        <li class="left">
                                            <div class="image">
                                                <img src="../img/demo/user-1.jpg" alt="">
                                            </div>
                                            <div class="message">
                                                <span class="caret"></span>
                                                <span class="name">${param.FROMS}</span>
                                                
                                                <p>${param.DETAILS}</p>
                                                <span class="time">
                                                    ${param.DAYS}
                                                </span>
                                            </div>
                                        </li>
                                        <li class="typing">
                                            <span >You</span> are typing <img src="../img/loading.gif" alt="">
                                        </li>
                                        <li class="insert">
                                            <form method="POST" action="../../ReplayMessage">
                                                <div class="text">
                                                    <input type="hidden" name="Tos" value="${param.FROMS}"/>
                                                    <input type="hidden" name="subkect" value="${param.SUBJECT}" />
                                                    <input type="text" name="details" placeholder="Write here..." class="input-block-level">
                                                </div>
                                                <div class="submit">
                                                    <button type="submit"><i class="icon-share-alt"></i></button>
                                                </div>
                                            </form>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div></div>

    </body>

</html>

