 <%-- 
    Document   : FO_home
    Created on : Jun 3, 2014, 2:22:52 AM
    Author     : eMaM
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controller.DBConnection" %>
<%
    DBConnection db = new DBConnection();
    db.connect();

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

                <!-- Main Content -->
                <section class="main-content col-lg-12 col-md-12 col-sm-12">

                    
                    
                         <!-- New Collection -->
                    <div class="products-row row">

                        <!-- Carousel Heading -->
                        <div class="col-lg-12 col-md-12 col-sm-12">

                            <div class="carousel-heading">
                                <h4>Auction Item</h4>
                                <div class="carousel-arrows">
                                    <i class="icons icon-left-dir"></i>
                                    <i class="icons icon-right-dir"></i>
                                </div>
                            </div>

                        </div>
                        <!-- /Carousel Heading -->

                        <!-- Carousel -->
                        <div class="carousel owl-carousel-wrap col-lg-12 col-md-12 col-sm-12">

                            <div class="owl-carousel" data-max-items="4">

                                <%db.pstm = db.con.prepareStatement("SELECT * FROM PRODUCT WHERE PRODUCTSTATUS != ? AND ISACTIVE='Y'");
                                    db.pstm.setString(1, "Not Live");
                                    ResultSet rs = db.pstm.executeQuery();
                                    while (rs.next()) {%>
                                <!-- Slide -->
                                <div>
                                    <!-- Carousel Item -->
                                    <div class="product">

                                        <div class="product-image">
                                            <span class="product-tag">Live</span>
                                            <img src="../<%=rs.getString("IMAGEURL")%>" alt="Product1" height="350" width="300">

                                        </div>

                                        <div class="product-info">
                                            <h5><a href="ProductDetails.jsp?id=<%=rs.getString("idPRODUCT")%>" title="<%=rs.getString("DESCS")%>"><%=rs.getString("NAME")%></a></h5>
                                            <span class="price">$<%=rs.getString("SELLPRICE")%></span>
                                            <div class="rating readonly-rating" data-score="5"></div>
                                        </div>

                                        <div class="product-actions">
                                            <span class="add-to-cart">
                                                <span class="action-wrapper">
                                                    <i  class="icons icon-basket-2"></i>
                                                    <a href="../Live/index.jsp" target="_blank">
                                                        <span class="action-name">Start Bidding</span>
                                                    </a>

                                                </span >
                                            </span>

                                        </div>

                                    </div>
                                    <!-- /Carousel Item -->
                                </div>
                                <%}%>
                                <!-- /Slide -->

                            </div>
                        </div>
                        <!-- /Carousel -->

                    </div>
                    <!-- /New Collection -->

                    <!-- Slider -->
                    <div class = "iosSlider">
                        <div class = "slider">

                            <div class = "item" id = "item1">

                                <div class = "image">
                                    <div class = "bg"></div>
                                </div>

                                <div class = "text">



                                    <div class = "button">
                                        <a class="button big red" href="Electronics.jsp">Start Now</a>
                                    </div>

                                </div>

                            </div>

                            <div class = "item" id = "item2">

                                <div class = "image">
                                    <div class = "bg"></div>
                                </div>

                                <div class = "text">





                                    <div class = "button">
                                        <a class="button big blue" href="Fashion.jsp">Buy Now</a>
                                    </div>


                                </div>

                            </div>

                            <div class = "item" id = "item3">

                                <div class = "image">
                                    <div class = "bg"></div>
                                </div>

                                <div class = "text">


                                    <div class = "button">
                                        <a class="button big orange" href="Jewelry.jsp">Buy Now</a>
                                    </div>





                                </div>

                            </div>

                        </div>

                        <div class = 'prevButton'></div>

                        <div class = 'nextButton'></div>

                    </div>
                    <!-- /Slider -->







               


                    <!-- News -->
                    <div class="products-row row">

                        <!-- Carousel Heading -->
                        <div class="col-lg-12 col-md-12 col-sm-12">

                            <div class="carousel-heading">
                                <h4>Latest news &amp; Reviews</h4>
                                <div class="carousel-arrows">
                                    <i class="icons icon-left-dir"></i>
                                    <i class="icons icon-right-dir"></i>
                                </div>
                            </div>

                        </div>
                        <!-- /Carousel Heading -->

                        <!-- Carousel -->
                        <div class="carousel owl-carousel-wrap col-lg-12 col-md-12 col-sm-12">

                            <div class="owl-carousel" data-max-items="2">

                                <!-- Slide -->
                                <div>
                                    <!-- Carousel Item -->
                                    <article class="news">

                                        <div class="news-background">

                                            <div class="row">
                                                <div class="col-lg-6 col-md-6 col-sm-6 news-thumbnail">
                                                    <a href="#"><img src="img/news/rev1.jpg" alt="News1"></a>
                                                </div>
                                                <div class="col-lg-6 col-md-6 col-sm-6 news-content">
                                                    <h5><a href="#">Jose G</a></h5>
                                                    <span class="date"><i class="icons icon-clock-1"></i> 5 Oct, 2014</span>
                                                    <p>"Be part of Live Virtual Auctions is a great opportunity for me as a seller, it is a new and fair shopping platform." - Jose G.</p>
                                                </div>
                                            </div>

                                        </div>

                                    </article>
                                    <!-- /Carousel Item -->
                                </div>
                                <!-- /Slide -->


                                <!-- Slide -->
                                <div>

                                    <!-- Carousel Item -->
                                    <article class="news">

                                        <div class="news-background">

                                            <div class="row">
                                                <div class="col-lg-6 col-md-6 col-sm-6 news-thumbnail">
                                                    <a href="#"><img src="img/news/rev2.jpg" alt="News1"></a>
                                                </div>
                                                <div class="col-lg-6 col-md-6 col-sm-6 news-content">
                                                    <h5><a href="#">Seller Butterfly Kisses</a></h5>
                                                    <span class="date"><i class="icons icon-clock-1"></i> 6 Oct, 2014</span>
                                                    <p> "I Love Jewelry, Latest Trends, Accessories, Cool Clothes and Shopping!  Most of all, I like Unique...!  Dare to be Different!  Forget your age when you choose accessories you really love.  Just go for it!  And Be You-Nique!"- Seller Butterfly Kisses</p>
                                                </div>
                                            </div>

                                        </div>

                                    </article>
                                    <!-- /Carousel Item -->

                                </div>
                                <!-- /Slide -->



                                <!-- Slide -->
                                <div>

                                    <!-- Carousel Item -->
                                    <article class="news">

                                        <div class="news-background">

                                            <div class="row">
                                                <div class="col-lg-6 col-md-6 col-sm-6 news-thumbnail">
                                                    <a href="#"><img src="img/news/rev3.jpg" alt="News1"></a>
                                                </div>
                                                <div class="col-lg-6 col-md-6 col-sm-6 news-content">
                                                    <h5><a href="#">Seller Lena</a></h5>
                                                    <span class="date"><i class="icons icon-clock-1"></i> 6 Oct, 2014</span>
                                                    <p>You will receive this ever so shiny silver tone Hello Kitty With Bow Crystal sweater necklace. The head and body are hinged and allows for added strength.- Seller Lena</p>
                                                </div>
                                            </div>

                                        </div>

                                    </article>
                                    <!-- /Carousel Item -->

                                </div>
                                <!-- /Slide -->





                            </div>

                        </div>
                        <!-- /Carousel -->

                    </div>
                    <!-- /News -->





                    <!-- Random Products -->
                    <div class="products-row row">

                        <!-- Carousel Heading -->
                        <div class="col-lg-12 col-md-12 col-sm-12">

                            <div class="carousel-heading">
                                <h4>Random Products</h4>
                                <div class="carousel-arrows">
                                    <i class="icons icon-left-dir"></i>
                                    <i class="icons icon-right-dir"></i>
                                </div>
                            </div>

                        </div>
                        <!-- /Carousel Heading -->

                        <!-- Carousel -->
                        <div class="carousel owl-carousel-wrap col-lg-12 col-md-12 col-sm-12">

                            <div class="owl-carousel" data-max-items="4">

                                <%db.pstm = db.con.prepareStatement("SELECT * FROM PRODUCT WHERE  ISACTIVE='Y' ORDER BY RAND() LIMIT 10");

                                    ResultSet rss = db.pstm.executeQuery();
                                    while (rss.next()) { %>
                                <!-- Slide -->
                                <div>
                                    <!-- Carousel Item -->
                                    <div class="product">

                                        <div class="product-image">
                                            <% if (!rss.getString("PRODUCTSTATUS").equals("Not Live")) {%>
                                            <span class="product-tag"><%=rss.getString("PRODUCTSTATUS")%></span>
                                            <%}%>
                                            <img src="../<%=rss.getString("IMAGEURL")%>" alt="Product1" height="350" width="300">
                                                   

                                        </div>

                                        <div class="product-info">
                                          <h5><a href="ProductDetails.jsp?id=<%=rss.getString("idPRODUCT")%>" title="<%=rss.getString("DESCS")%>"><%=rss.getString("NAME")%></a></h5>
                                            <span class="price">$<%=rss.getString("SELLPRICE")%></span>
                                            <div class="rating readonly-rating" data-score="5"></div>
                                        </div>



                                    </div>
                                    <!-- /Carousel Item -->
                                </div>
                                <%}%>
                                <!-- /Slide -->
                            </div>
                        </div>
                        <!-- /Carousel -->

                    </div>
                    <!-- /Random Products -->




                    <!-- Product Brands -->
                    <div class="products-row row">

                        <!-- Carousel Heading -->
                        <div class="col-lg-12 col-md-12 col-sm-12">

                            <div class="carousel-heading">
                                <h4>Product Brands</h4>
                                <div class="carousel-arrows">
                                    <i class="icons icon-left-dir"></i>
                                    <i class="icons icon-right-dir"></i>
                                </div>
                            </div>

                        </div>
                        <!-- /Carousel Heading -->

                        <!-- Carousel -->
                        <div class="carousel owl-carousel-wrap col-lg-12 col-md-12 col-sm-12">

                            <div class="owl-carousel" data-max-items="6">

                                <!-- Slide -->
                                <div>
                                    <div class="product">
                                        <a href="#"><img src="img/brands/beauty150x90.jpg" alt="beauty"></a>
                                    </div>
                                </div>
                                <!-- /Slide -->

                                <!-- Slide -->
                                <div>
                                    <div class="product">
                                        <a href="#"><img src="img/brands/electronics150x90.jpg" alt="electronics"></a>
                                    </div>
                                </div>
                                <!-- /Slide -->

                                <!-- Slide -->
                                <div>
                                    <div class="product">
                                        <a href="#"><img src="img/brands/fashion150x90.png" alt="fashion"></a>
                                    </div>
                                </div>
                                <!-- /Slide -->

                                <!-- Slide -->
                                <div>
                                    <div class="product">
                                        <a href="#"><img src="img/brands/home150x90.gif" alt="home"></a>
                                    </div>
                                </div>
                                <!-- /Slide -->

                                <!-- Slide -->
                                <div>
                                    <div class="product">
                                        <a href="#"><img src="img/brands/jewelry150x90.jpg" alt="jewelry"></a>
                                    </div>
                                </div>
                                <!-- /Slide -->

                                <!-- Slide -->
                                <div>
                                    <div class="product">
                                        <a href="#"><img src="img/brands/other150x90.jpg" alt="other"></a>
                                    </div>
                                </div>
                                <!-- /Slide -->

                                <!-- Slide -->
                                <div>
                                    <div class="product">
                                        <a href="#"><img src="img/brands/supplies150x90.jpg" alt="supplies"></a>
                                    </div>
                                </div>
                                <!-- /Slide -->



                            </div>

                        </div>
                        <!-- /Carousel -->

                    </div>
                    <!-- /Product Brands -->


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
