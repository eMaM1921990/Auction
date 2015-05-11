<%-- 
    Document   : OrderInfo
    Created on : Apr 24, 2015, 8:37:23 PM
    Author     : emam
--%>

<%@page import="java.net.URLEncoder"%>
<%@page import="paypal.GetExpressCheckout"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    GetExpressCheckout express = new GetExpressCheckout();
    express.getExperess(request.getParameter("token"));
    if(express.param.get("ACK").contains("F") ){
        response.sendRedirect(request.getContextPath()+"/FO/PaymentError.jsp?L_ERRORCODE0="+URLEncoder.encode(express.param.get("L_ERRORCODE0"), "UTF-8")+"&L_SHORTMESSAGE0="+URLEncoder.encode(express.param.get("L_SHORTMESSAGE0"), "UTF-8")+"&L_LONGMESSAGE0="+URLEncoder.encode(express.param.get("L_LONGMESSAGE0"), "UTF-8")+"&L_SEVERITYCODE0="+URLEncoder.encode(express.param.get("L_SEVERITYCODE0"),"UTF-8"));
    }


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
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/perfect-scrollbar.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="css/fontello.css">
        <link rel="stylesheet" href="css/animation.css">
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
                        <p><a href="Portal.jsp">Home</a> <i class="icons icon-right-dir"></i> Order Info</p>
                    </div>
                </div>

                <!-- Main Content -->
                <section class="main-content col-lg-9 col-md-9 col-sm-9">


                    <div class="row">

                        <div class="col-lg-12 col-md-12 col-sm-12">

                            <div class="carousel-heading">
                                <h4>Payment Information</h4>
                                <div class="carousel-arrows">
                                    <a href="#"><i class="icons icon-reply"></i></a>
                                </div>
                            </div>

                            <table class="orderinfo-table">



                                <tr>
                                    <th>Payment date</th>
                                    <td><%=express.param.get("TIMESTAMP")%></td>
                                </tr>

                               




                                <tr>
                                    <th>Payment</th>
                                    <td>PayPal</td>
                                </tr>

                                <tr>
                                    <th>Total</th>
                                    <td><span class="price">$<%=express.param.get("AMT")%></span></td>
                                </tr>                    

                            </table>

                        </div>

                    </div>

                    <div class="row">

                        <div class="col-lg-12 col-md-12 col-sm-12">

                            <div class="carousel-heading">
                                <h4>Bill to</h4>
                            </div>

                            <table class="orderinfo-table">

                                <tr>
                                    <th>Email</th>
                                    <td><%=express.param.get("EMAIL")%></td>
                                </tr> 



                                <tr>
                                    <th>Title</th>
                                    <td>Mr</td>
                                </tr>

                                <tr>
                                    <th>First name</th>
                                    <td><%=express.param.get("FIRSTNAME")%></td>
                                </tr>



                                <tr>
                                    <th>Last name</th>
                                    <td><%=express.param.get("LASTNAME")%></td>
                                </tr>

                                <tr>
                                    <th>Country code</th>
                                    <td><%=express.param.get("COUNTRYCODE")%></td>                                </tr>

                                <tr>
                                    <th>Country name</th>
                                    <td><%=express.param.get("SHIPTOCOUNTRYNAME")%></td>                                </tr>

                                <tr>
                                    <th>City </th>
                                    <td><%=express.param.get("SHIPTOCITY")%></td>                                </tr>

                                <tr>
                                    <th>Address 1</th>
                                    <td><%=express.param.get("SHIPTOSTREET")%></td>
                                </tr> 

                                

                                <tr>
                                    <th>ZIP / Postal code</th>
                                    <td><%=express.param.get("SHIPTOCOUNTRYCODE")%></td>
                                </tr> 

                                <tr>
                                    <th>Address status</th>
                                    <td><%=express.param.get("ADDRESSSTATUS")%></td>
                                </tr> 



                                <tr>
                                    <th>Currency code</th>
                                    <td><%=express.param.get("CURRENCYCODE")%></td>
                                </tr> 



                            </table>

                        </div>



                        <div class="col-lg-12 col-md-12 col-sm-12">


                            <div class="tabs">

                                <div class="tab-heading margin-heading">
                                    <a href="#tab1" class="button big">Payment Items</a>
                                </div>

                                <div class="tab-content no-padding">

                                    <div id="tab1">

                                        <table class="orderinfo-table">

                                            <tr>

                                                <th>Product name</th>
                                                <th>Product description</th>
                                                <th>Price</th>
                                                <th>Qty</th>
                                                <th>Tax</th>

                                                <th>Total</th>
                                            </tr> 

                                            <tr>
                                                <td><%=express.param.get("L_PAYMENTREQUEST_0_NAME0")%></td>
                                                <td><%=express.param.get("L_PAYMENTREQUEST_0_DESC0")%></td>
                                                <td>$<%=express.param.get("L_PAYMENTREQUEST_0_AMT0")%></td>

                                                <td>1</td>
                                                <td>$<%=express.param.get("TAXAMT")%></td>

                                                <td>$<%=express.param.get("AMT")%></td>
                                            </tr>









                                            <tr>
                                                <td class="align-right" colspan="5"><span class="price big">Total</span></td>

                                                <td><span class="price big">$<%=express.param.get("AMT")%></span></td>
                                            </tr>
                                            
                                            
                                            <tr>
                                                <td class="align-right" colspan="6"><span class="price big"><a href="../doexpresscheckout?token=<%=express.param.get("TOKEN")%>&PayerID=<%=express.param.get("PAYERID")%>&AMT=<%=express.param.get("AMT")%>&p=<%=express.param.get("L_PAYMENTREQUEST_0_DESC0").substring(5, express.param.get("L_PAYMENTREQUEST_0_DESC0").indexOf("-"))%>"><img src="https://www.paypalobjects.com/webstatic/en_US/i/buttons/buy-logo-medium.png" alt="Buy now with PayPal" /></a></span></td>

                                                
                                            </tr>

                                        </table>

                                    </div>




                                </div>





                            </div>

                        </div>

                      


                    </div>


                </section>
                <!-- /Main Content -->


                <!-- Sidebar -->
                <aside class="sidebar col-lg-3 col-md-3 col-sm-3 right-sidebar">

                    <!-- Categories -->
                    <div class="row sidebar-box purple">

                        <div class="col-lg-12 col-md-12 col-sm-12">

                            <div class="sidebar-box-heading">
                                <i class="icons icon-folder-open-empty"></i>
                                <h4>Categories</h4>
                            </div>

                            <div class="sidebar-box-content">
                                <ul>
                                    <li><a href="Portal.jsp">Home<i class="icons icon-right-dir"></i></a></li>
                                    <li><a href="#">Brands<i class="icons icon-right-dir"></i></a>
                                        <ul class="sidebar-dropdown">
                                            <li>
                                                <ul>

                                                    <li><a href="Beauty.jsp"><i class="icons icon-right-dir"></i>Beauty</a></li>
                                                    <li><a href="Electronics.jsp"><i class="icons icon-right-dir"></i> Electronics</a></li>
                                                    <li><a href="Jewelry.jsp"><i class="icons icon-right-dir"></i> Jewelry</a></li>
                                                </ul>
                                            </li>
                                            <li>
                                                <ul>

                                                    <li><a href="Fashion.jsp"><i class="icons icon-right-dir"></i>Fashion</a></li>
                                                    <li><a href="Home.jsp"><i class="icons icon-right-dir"></i> Home</a></li>
                                                    <li><a href="Supplies.jsp"><i class="icons icon-right-dir"></i> Supplies</a></li>
                                                    <li><a href="Other.jsp"><i class="icons icon-right-dir"></i> Other</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>
                                    <li><a href="#">Auction <i class="icons icon-right-dir"></i></a></li>
                                    <ul class="sidebar-dropdown">
                                        <li>
                                            <ul>

                                                <li><a href="Online.jsp"><i class="icons icon-right-dir"></i>Live Items</a></li>
                                                <li><a href="Auction/AuctionCalendar.jsp"><i class="icons icon-right-dir"></i> Auction News</a></li>

                                            </ul>
                                        </li>
                                    </ul>
                                    <li><a href="Auction/TopSeller.jsp">Top Seller <i class="icons icon-right-dir"></i></a></li>
                                    <li><a href="Shipment.jsp">Shipment <i class="icons icon-right-dir"></i></a></li>
                                    <li><a href="contact.jsp">Contact Us <i class="icons icon-right-dir"></i></a></li>

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

        <!-- Cloud Zoom -->
        <script src="js/zoomsl-3.0.min.js"></script>

        <!-- SelectJS -->
        <script src="js/chosen.jquery.min.js" type="text/javascript"></script>

        <!-- Main JS -->
        <script defer src="js/bootstrap.min.js"></script>
        <script src="js/main-script.js"></script>


    </body>

</html>