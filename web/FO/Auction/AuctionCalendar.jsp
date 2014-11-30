<%-- 
    Document   : AuctionCalendar
    Created on : Jun 22, 2014, 8:56:25 PM
    Author     : eMaM
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controller.DBConnection" %>
<%
    DBConnection db = new DBConnection();
    db.connect();
    Date date = new Date();
    DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
    java.sql.Date sqldat = new java.sql.Date(df.parse(df.format(date)).getTime());
    db.pstm = db.con.prepareStatement("SELECT * FROM PRODUCT,USERLISTDETAILS WHERE idPRODUCT=PRODUCTID AND STARTDAY >= ? ORDER BY STARTDAY");
    db.pstm.setDate(1, sqldat);
    ResultSet rs = db.pstm.executeQuery();
%>
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
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/perfect-scrollbar.css">
        <link rel="stylesheet" href="../css/style.css">
        <link rel="stylesheet" href="../css/flexslider.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="../css/fontello.css">
        <link rel="stylesheet" href="../css/animation.css">
        <link rel="stylesheet" href="../css/chosen.css">

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

            <%@include file="../Pages_Header.jsp" %>



            <!-- Content -->
            <div class="row content">

                <div class="col-lg-12 col-md-12 col-sm-12">
                    <div class="breadcrumbs">
                        <p><a href="#">Home</a> <i class="icons icon-right-dir"></i> Orders List</p>
                    </div>
                </div>

                <!-- Main Content -->
                <section class="main-content col-lg-12 col-md-12 col-sm-12">

                    <div class="row">

                        <!-- Heading -->
                        <div class="col-lg-12 col-md-12 col-sm-12">

                            <div class="carousel-heading">
                                <h4>Incoming Auction List</h4>
                                <div class="carousel-arrows">
                                    <a href="#"><i class="icons icon-reply"></i></a>
                                </div>
                            </div>

                        </div>
                        <!-- /Heading -->

                    </div>	


                    <div class="row">

                        <div class="col-lg-12 col-md-12 col-sm-12">

                            <table class="order-table">

                                <tr>
                                    <th>Auction Product</th>
                                    <th>Auction Date</th>

                                    <th>Starting Bid</th>
                                </tr>
                                <%while (rs.next()) {%>
                                <tr>
                                    <td class="order-number"><p><a href="../ProductDetails.jsp?id=<%=rs.getString("idPRODUCT")%>"><%=rs.getString("NAME")%></a></p></td>
                                    <td><p><%=rs.getString("STARTDAY")%> | <%=rs.getString("STARTTIM")%></p></td>

                                    <td><span class="price">$<%=rs.getDouble("SELLPRICE") + rs.getDouble("SHIPPINGCOST")%></span></td>
                                </tr>   

                                <%}%>
                            </table>

                        </div>

                    </div>


                </section>
                <!-- /Main Content -->



            </div>
            <!-- /Content -->





            <%@include file="../Pages_Footer.jsp" %>


            <div id="back-to-top">
                <i class="icon-up-dir"></i>
            </div>

        </div>
        <!-- Container -->



        <!-- JavaScript -->
        <script src="../js/modernizr.min.js"></script>
        <script src="../js/jquery-1.11.0.min.js"></script>
        <script type="text/javascript" src="../js/jquery-ui.min.js"></script>
        <script type="text/javascript" src="../js/jquery.raty.min.js"></script>

        <!-- Scroll Bar -->
        <script src="../js/perfect-scrollbar.min.js"></script>

        <!-- Cloud Zoom -->
        <script src="../js/zoomsl-3.0.min.js"></script>

        <!-- FancyBox -->
        <script src="../js/jquery.fancybox.pack.js"></script>

        <!-- jQuery REVOLUTION Slider  -->
        <script type="text/javascript" src="../js/jquery.themepunch.plugins.min.js"></script>
        <script type="text/javascript" src="../js/jquery.themepunch.revolution.min.js"></script>

        <!-- FlexSlider -->
        <script defer src="../js/flexslider.min.js"></script>

        <!-- IOS Slider -->
        <script src = "../js/jquery.iosslider.min.js"></script>

        <!-- noUi Slider -->
        <script src="../js/jquery.nouislider.min.js"></script>

        <!-- Owl Carousel -->
        <script src="../js/owl.carousel.min.js"></script>

        <!-- Cloud Zoom -->
        <script src="../js/zoomsl-3.0.min.js"></script>

        <!-- SelectJS -->
        <script src="../js/chosen.jquery.min.js" type="text/javascript"></script>

        <!-- Main JS -->
        <script defer src="../js/bootstrap.min.js"></script>
        <script src="../js/main-script.js"></script>


    </body>

</html>
