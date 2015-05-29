<!doctype html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- Bootstrap responsive -->
        <link rel="stylesheet" href="css/bootstrap-responsive.min.css">
        <!-- jQuery UI -->
        <link rel="stylesheet" href="css/plugins/jquery-ui/smoothness/jquery-ui.css">
        <link rel="stylesheet" href="css/plugins/jquery-ui/smoothness/jquery.ui.theme.css">
        <!-- Theme CSS -->
        <link rel="stylesheet" href="css/style.css">
        <!-- Color CSS -->
        <link rel="stylesheet" href="css/themes.css">


        <!-- jQuery -->
        <script src="js/jquery.min.js"></script>

        <!-- Nice Scroll -->
        <script src="js/plugins/nicescroll/jquery.nicescroll.min.js"></script>
        <!-- imagesLoaded -->
        <script src="js/plugins/imagesLoaded/jquery.imagesloaded.min.js"></script>
        <!-- jQuery UI -->
        <script src="js/plugins/jquery-ui/jquery.ui.core.min.js"></script>
        <script src="js/plugins/jquery-ui/jquery.ui.widget.min.js"></script>
        <script src="js/plugins/jquery-ui/jquery.ui.mouse.min.js"></script>
        <script src="js/plugins/jquery-ui/jquery.ui.resizable.min.js"></script>
        <script src="js/plugins/jquery-ui/jquery.ui.sortable.min.js"></script>
        <!-- slimScroll -->
        <script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <!-- Bootstrap -->
        <script src="js/bootstrap.min.js"></script>
        <!-- Bootbox -->
        <script src="js/plugins/bootbox/jquery.bootbox.js"></script>
        <!-- Bootbox -->
        <script src="js/plugins/form/jquery.form.min.js"></script>
        <!-- Validation -->
        <script src="js/plugins/validation/jquery.validate.min.js"></script>
        <script src="js/plugins/validation/additional-methods.min.js"></script>

        <!-- Theme framework -->
        <script src="js/eakroko.min.js"></script>
        <!-- Theme scripts -->
        <script src="js/application.min.js"></script>
        <!-- Just for demonstration -->
        <script src="js/demonstration.min.js"></script>

        <!--[if lte IE 9]>
                <script src="js/plugins/placeholder/jquery.placeholder.min.js"></script>
                <script>
                        $(document).ready(function() {
                                $('input, textarea').placeholder();
                        });
                </script>
        <![endif]-->

        <!-- Favicon -->
        <link rel="shortcut icon" href="img/favicon.ico" />
        <!-- Apple devices Homescreen icon -->
        <link rel="apple-touch-icon-precomposed" href="img/apple-touch-icon-precomposed.png" />

    </head>

    <body>
        <%@include file="headerhome.jsp" %>
        <div class="container-fluid nav-hidden" id="content">

            <div id="main">
                <div class="container-fluid nav-hidden">
                    <div class="page-header">
                        <div class="pull-left">
                            <h1>Back Office Dashboard</h1>
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
                                <a href="index.jsp">Dashboard</a>
                                <i class="icon-angle-right"></i>
                            </li>

                        </ul>
                        <div class="close-bread">
                            <a href="#"><i class="icon-remove"></i></a>
                        </div>
                    </div>
                    <div class="row-fluid">
                        <div class="span12">
                            <div class="box">
                                <div class="box-title">
                                    <h3>
                                        <i class="icon-reorder"></i>
                                        Basic Statistics
                                    </h3>
                                </div>
                                <div class="box-content">



                                    <div dir="ltr" style="font-size:16px">
                                        <div style="margin-top:0px;margin-bottom:0in;color:rgb(51,51,51);font-family:'Open Sans',sans-serif;font-size:13px;">Welcome to Live Virtual Auctions.</div>
                                        <div style="margin-top:0px;margin-bottom:0in;color:rgb(51,51,51);font-family:'Open Sans',sans-serif;font-size:13px">
                                            <br clear="none"></div>
                                        <div style="margin-top:0px;margin-bottom:0in;color:rgb(51,51,51);font-family:'Open Sans',sans-serif;font-size:13px">For Sellers - How to list your first item? Follow this:</div>
                                        <div style="margin-top:0px;margin-bottom:0in;color:rgb(51,51,51);font-family:'Open Sans',sans-serif;font-size:13px">
                                            <br clear="none"></div>
                                        <div style="margin-top:0px;margin-bottom:0in;color:rgb(51,51,51);font-family:'Open Sans',sans-serif;font-size:13px">1. Click on “Product and List”.</div>
                                        <div style="margin-top:0px;margin-bottom:0in;color:rgb(51,51,51);font-family:'Open Sans',sans-serif;font-size:13px">
                                            <br clear="none"></div>
                                        <div style="margin-top:0px;margin-bottom:0in;color:rgb(51,51,51);font-family:'Open Sans',sans-serif;font-size:13px">2. Click on “Manage Product”.</div>
                                        <div style="margin-top:0px;margin-bottom:0in;color:rgb(51,51,51);font-family:'Open Sans',sans-serif;font-size:13px">
                                            <br clear="none"></div>
                                        <div style="margin-top:0px;margin-bottom:0in;color:rgb(51,51,51);font-family:'Open Sans',sans-serif;font-size:13px">3. Click the blue “Add”&nbsp;</div>
                                        <br>
                                        <div style="margin-top:0px;margin-bottom:0in;color:rgb(51,51,51);font-family:'Open Sans',sans-serif;font-size:13px">4. Enter your item information and click “Save Changes” or “Cancel” - *** REMEMBER, we don’t have Reserve Price, be sure to enter a price you agree to sell. (maybe the minimum value you agree to receive for your item)</div>
                                        <div style="margin-top:0px;margin-bottom:0in;color:rgb(51,51,51);font-family:'Open Sans',sans-serif;font-size:13px">
                                            <br clear="none"></div><div style="margin-top:0px;margin-bottom:0in;color:rgb(51,51,51);font-family:'Open Sans',sans-serif;font-size:13px">5. Done. Your item is alive.</div>
                                        <div style="margin-top:0px;margin-bottom:0in;color:rgb(51,51,51);font-family:'Open Sans',sans-serif;font-size:13px">
                                            <br clear="none"></div>
                                        <div style="margin-top:0px;margin-bottom:0in;color:rgb(51,51,51);font-family:'Open Sans',sans-serif;font-size:13px">
                                            6. Now, you need to set up the date and time you want your item in the Live Auction.<br><br>
                                            a. Go to "Products & List" and click on "Manage Product" <br><br>
                                            b. Look for the tap “ Options” and click on the bookmark draw. <br><br>
                                            c. In the new page, click on the "Date of Auction" block.<br><br>
                                            d. Select the day by make a click on the day. Do the same with the "Time of Start".<br><br>
                                            e. When finish, click "Save Changes".<br><br>

                                            Your item will be show in the "Auction News" page under "AUCTION"<br><br>
                                            Any question, send an email to support@livevirtualauctions.com
                                        </div><div style="margin-top:0px;margin-bottom:0in;color:rgb(51,51,51);font-family:'Open Sans',sans-serif;font-size:13px"><br clear="none"></div><div style="margin-top:0px;margin-bottom:0in;color:rgb(51,51,51);font-family:'Open Sans',sans-serif;font-size:13px">Thanks for be part of&nbsp;<a href="http://LiveVirtualAuctions.com/" target="_blank">LiveVirtualAuctions.com</a></div></div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div></div>

    </body>

</html>

