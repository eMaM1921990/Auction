<%-- 
    Document   : ProductDetails
    Created on : Nov 16, 2014, 10:04:36 PM
    Author     : emam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controller.DBConnection" %>
<%
    DBConnection db = new DBConnection();
    db.connect();
    db.pstm = db.con.prepareStatement("SELECT * FROM PRODUCT WHERE idPRODUCT=?");
    db.pstm.setString(1, request.getParameter("id"));
    db.rs = db.pstm.executeQuery();
    String productname = null;
    String quantity = null;
    String sellprice = null;
    String ship = null;
    String img = null;
    String status = null;
    String desc = null;
    String img2 = null;
    String img3 = null;
    String img4 = null;
    while (db.rs.next()) {
        productname = db.rs.getString("NAME");
        quantity = db.rs.getString("QUANTITYONHAND");
        sellprice = db.rs.getString("SELLPRICE");
        ship = db.rs.getString("SHIPPINGCOST");
        img = db.rs.getString("IMAGEURL");
        img2 = db.rs.getString("IMAGEURL1");
        img3 = db.rs.getString("IMAGEURL2");
        img4 = db.rs.getString("IMAGEURL3");
        status = db.rs.getString("PRODUCTSTATUS");
        desc = db.rs.getString("DESCS");
    }
%>
<!DOCTYPE html>
<!DOCTYPE html>

<html>

    <head>

        <!-- Meta Tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Title -->
        <title>Live Virtual Auctions</title>

        <!-- Fonts -->
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,300italic,400italic,500,700,900,700italic,500italic' rel='stylesheet' type='text/css'>

        <!-- Stylesheets -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/perfect-scrollbar.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="css/fontello.css">
        <link rel="stylesheet" href="css/jquery.fancybox.css">
        <link rel="stylesheet" href="css/animation.css">
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="css/owl.theme.css">
        <link rel="stylesheet" href="css/chosen.css">

        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
                        <link rel="stylesheet" href="css/ie.css">
        <![endif]-->
        <!--[if IE 7]>
                <link rel="stylesheet" href="css/fontello-ie7.css">
        <![endif]-->

    </head>


    <body>

        <!-- Container -->
        <div class="container">

            <%@include file="Home_header.jsp" %>

            <!-- Content -->
            <div class="row content">


                <div class="col-lg-12 col-md-12 col-sm-12">
                    <div class="breadcrumbs">
                        <p><a href="#">Home</a> <i class="icons icon-right-dir"></i> <a href="#">Product Details</a> <i class="icons icon-right-dir"></i> </p>
                    </div>
                </div>


                <!-- Main Content -->
                <section class="main-content col-lg-12 col-md-12 col-sm-12">



                    <!-- Product -->
                    <div class="product-single">

                        <div class="row">

                            <!-- Product Images Carousel -->
                            <div class="col-lg-4 col-md-4 col-sm-4 product-single-image">

                                <div id="product-slider">
                                    <ul class="slides">
                                        <li>
                                            <img class="cloud-zoom" src="../<%=img%>" data-large="../<%=img%>"  alt=""/>
                                            <a class="fullscreen-button" href="../<%=img%>">
                                                <div class="product-fullscreen">
                                                    <i class="icons icon-resize-full-1"></i>
                                                </div>
                                            </a>
                                        </li>
                                    </ul>
                                </div>

                            </div>
                            <!-- /Product Images Carousel -->

                            <div class="col-lg-8 col-md-8 col-sm-8 product-single-info full-size">

                                <h2><%=productname%></h2>
                                <div class="rating-box">
                                    <div class="rating readonly-rating" data-score="5"></div>
                                    5 Review(s)
                                </div>
                                <table>
                                    <tr>
                                        <td>Sell Price</td>
                                        <td><a > $<%=sellprice%></a></td>
                                    </tr><tr>
                                        <td>Shipping Cost</td>
                                        <td><a > $<%=ship%></a></td>
                                    </tr>

                                    <tr>
                                        <td>Availability</td>
                                        <td><span class="green">in stock</span> <%=quantity%> items</td>
                                    </tr>
                                    <tr>
                                        <td>Status</td>
                                        <td><%=status%></td>
                                    </tr>
                                    <tr>
                                        <td>Description</td>
                                        <td><%=desc%></td>
                                    </tr>
                                </table>












                            </div>
                        </div>


                        <div class="row">
                            <br><br>
                        </div>
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-12 ">

                                <div id="product-slider">
                                    <ul class="slides">
                                        <li>
                                            <img class="cloud-zoom" src="../<%=img2%>" data-large="../<%=img2%>"  alt=""/>
                                            <a class="fullscreen-button" href="../<%=img2%>">
                                                <div class="product-fullscreen">
                                                    <i class="icons icon-resize-full-1"></i>
                                                </div>
                                            </a>
                                        </li>

                                    </ul>

                                </div>

                            </div>                



                            <div class="col-lg-4 col-md-4 col-sm-12 ">                   
                                <div id="product-slider">
                                    <ul class="slides">
                                        <li>
                                            <img class="cloud-zoom" src="../<%=img3%>" data-large="../<%=img3%>"  alt=""/>
                                            <a class="fullscreen-button" href="../<%=img3%>">
                                                <div class="product-fullscreen">
                                                    <i class="icons icon-resize-full-1"></i>
                                                </div>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>





                            <div class="col-lg-4 col-md-4 col-sm-12 ">
                                <div id="product-slider">
                                    <ul class="slides">
                                        <li>
                                            <img class="cloud-zoom" src="../<%=img4%>" data-large="../<%=img4%>"  alt=""/>
                                            <a class="fullscreen-button" href="../<%=img4%>">
                                                <div class="product-fullscreen">
                                                    <i class="icons icon-resize-full-1"></i>
                                                </div>
                                            </a>
                                        </li>
                                    </ul>
                                </div>





                            </div>

                        </div>

                    </div>
                    <!-- /Product -->






                </section>
                <!-- /Main Content -->





            </div>
            <!-- /Content -->


            <%@include file="Home_Footer.jsp" %>


            <div id="back-to-top">
                <i class="icon-up-dir"></i>
            </div>

        </div>
        <!-- Container -->



        <!-- JavaScript -->
        <script src="js/modernizr.min.js"></script>
        <script src="js/jquery-1.11.0.min.js"></script>
        <script type="text/javascript" src="js/jquery-ui.min.js"></script>
        <script type="text/javascript" src="js/jquery.raty.min.js"></script>

        <!-- Scroll Bar -->
        <script src="js/perfect-scrollbar.min.js"></script>

        <!-- Cloud Zoom -->
        <script src="js/zoomsl-3.0.min.js"></script>

        <!-- FancyBox -->
        <script src="js/jquery.fancybox.pack.js"></script>

        <!-- jQuery REVOLUTION Slider  -->
        <script type="text/javascript" src="js/jquery.themepunch.plugins.min.js"></script>
        <script type="text/javascript" src="js/jquery.themepunch.revolution.min.js"></script>

        <!-- FlexSlider -->
        <script defer src="js/flexslider.min.js"></script>

        <!-- IOS Slider -->
        <script src = "js/jquery.iosslider.min.js"></script>

        <!-- noUi Slider -->
        <script src="js/jquery.nouislider.min.js"></script>

        <!-- Owl Carousel -->
        <script src="js/owl.carousel.min.js"></script>

        <!-- Cloud Zoom -->
        <script src="js/zoomsl-3.0.min.js"></script>

        <!-- SelectJS -->
        <script src="js/chosen.jquery.min.js" type="text/javascript"></script>

        <!-- Main JS -->
        <script defer src="js/bootstrap.min.js"></script>
        <script src="js/main-script.js"></script>



    </body>

</html>