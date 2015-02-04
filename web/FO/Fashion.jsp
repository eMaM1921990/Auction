<%-- 
    Document   : newjsp
    Created on : Jun 19, 2014, 7:04:55 PM
    Author     : eMaM
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controller.DBConnection" %>
<%
    DBConnection db = new DBConnection();
    db.connect();


%><!DOCTYPE html>

<!DOCTYPE html>

<html>

    <head>

        <!-- Meta Tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Title -->
       <title>Live Virtual Auction</title>

        <!-- Fonts -->
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,300italic,400italic,500,700,900,700italic,500italic' rel='stylesheet' type='text/css'>

        <!-- Stylesheets -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/perfect-scrollbar.css">
        <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="css/fontello.css">
        <link rel="stylesheet" href="css/select.css">
        <link rel="stylesheet" href="css/animation.css">
        <link rel="stylesheet" href="css/style.css">
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
                        <p><a href="Portal.jsp">Home</a> <i class="icons icon-right-dir"></i>Fashion</p>
                    </div>
                </div>

                <!-- Main Content -->
                <section class="main-content col-lg-9 col-md-9 col-sm-9 col-lg-push-3 col-md-push-3 col-sm-push-3">

                    <div class="row">

                        <!-- Heading -->
                        <div class="col-lg-12 col-md-12 col-sm-12">

                            <div class="carousel-heading">
                                <h4>Fashion</h4>
                            </div>

                        </div>
                        <!-- /Heading -->


                    </div>


                    <div class="row"> 
                        <!-- Product Item -->
                          <%                                    
                                    db.pstm = db.con.prepareStatement("SELECT * FROM PRODUCT WHERE PRODUCTCAT=? AND ISACTIVE='Y'");
                                    db.pstm.setInt(1, 4);
                                    ResultSet rs = db.pstm.executeQuery();
                                    while (rs.next()) {%>
                        <div class="col-lg-4 col-md-4 col-sm-4 product">

                            <div class="product-image">
                                <img src="../<%=rs.getString("IMAGEURL")%>" alt="">
                                <a href="ProductDetails.jsp?id=<%=rs.getString("idPRODUCT")%>" class="product-hover">
                                    <i class="icons icon-eye-1"></i> Quick View
                                </a>
                            </div>

                            <div class="product-info">
                                <h5><a href="ProductDetails.jsp?id=<%=rs.getString("idPRODUCT")%>"><%=rs.getString("NAME")%></a></h5>
                                <span class="price">$<%=rs.getString("SELLPRICE")%></span>
                                <div class="rating readonly-rating" data-score="5"></div>
                            </div>

                            <div class="product-actions">
                                <span class="add-to-cart">
                                    <span class="action-wrapper">
                                        <i class="icons icon-basket-2"></i>
                                        <span class="action-name">Start Bidding</span>
                                    </span >
                                </span>
                               
                            </div>

                        </div>
                        <%}
                        db.closeConnection();
                        %>
                        <!-- Product Item -->







                    </div>



                </section>
                <!-- /Main Content -->




                <!-- Sidebar -->
                <aside class="sidebar col-lg-3 col-md-3 col-sm-3  col-lg-pull-9 col-md-pull-9 col-sm-pull-9">

                    <!-- Categories -->
                    <div class="row sidebar-box purple">

                        <div class="col-lg-12 col-md-12 col-sm-12">

                            <div class="sidebar-box-heading">
                                <i class="icons icon-folder-open-empty"></i>
                                <h4>Categories</h4>
                            </div>

                            <div class="sidebar-box-content">
                                <ul>
                                    <li><a href="Beauty.jsp">Beauty<i class="icons icon-right-dir"></i></a></li>
                                    <li><a href="Electronics.jsp">Electronics <i class="icons icon-right-dir"></i></a></li>
                                   
                                    <li><a href="Fashion.jsp">Fashion <i class="icons icon-right-dir"></i></a></li>
                                    <li><a href="Home.jsp">Home <i class="icons icon-right-dir"></i></a></li>
                                    <li><a href="Jewelry.jsp">Jewelry <i class="icons icon-right-dir"></i></a></li>
                                    <li><a href="Other.jsp">Other <i class="icons icon-right-dir"></i></a></li>
                                    <li><a href="Supplies.jsp">Supplies <i class="icons icon-right-dir"></i></a></li>
                                   
                                </ul>
                            </div>

                        </div>

                    </div>
                    <!-- /Categories -->





                 


                   



                </aside>
                <!-- /Sidebar -->

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

        <!-- Cloud Zoom-->
        <script src="js/zoomsl-3.0.min.js"></script>

        <!-- SelectJS -->
        <script src="js/chosen.jquery.min.js" type="text/javascript"></script>

        <!-- Main JS -->
        <script defer src="js/bootstrap.min.js"></script>
        <script src="js/main-script.js"></script>

    </body>

</html>