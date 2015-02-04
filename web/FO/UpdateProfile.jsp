<%-- 
    Document   : Registeration
    Created on : Jul 12, 2014, 8:29:35 PM
    Author     : emam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controller.DBConnection" %>
<%
    DBConnection db = new DBConnection();

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
            <%                db.connect();
                db.pstm = db.con.prepareStatement("SELECT * FROM USER WHERE idUSER=?");
                db.pstm.setInt(1, userid);
                db.rs=db.pstm.executeQuery();
                String USERNAME = null;
                String PASSWORD = null;
                int USERTYPE = 0;
                String FISRTNAME = null;
                String LASTNAME = null;
                String POSTALCODE = null;
                String ADDRESS1 = null;
                String ADDRESS2 = null;
                String EMAIL = null;
                String PHONE = null;
                String PAYPAL = null;
                String SHIPPINGADDRESS = null;
                String COUNTRY = null;
                String CITY = null;
                while (db.rs.next()) {
                    USERNAME = db.rs.getString("USERNAME");
                    PASSWORD = db.rs.getString("PASSWORD");
                    USERTYPE = db.rs.getInt("USERTYPE");
                    FISRTNAME = db.rs.getString("FISRTNAME");
                    LASTNAME = db.rs.getString("LASTNAME");
                    POSTALCODE = db.rs.getString("POSTALCODE");
                    ADDRESS1 = db.rs.getString("ADDRESS1");
                    ADDRESS2 = db.rs.getString("ADDRESS2");
                    EMAIL = db.rs.getString("EMAIL");
                    PHONE = db.rs.getString("PHONE");
                    PAYPAL = db.rs.getString("PAYPAL");
                    SHIPPINGADDRESS = db.rs.getString("SHIPPINGADDRESS");
                    COUNTRY = db.rs.getString("COUNTRY");
                    CITY = db.rs.getString("CITY");
                }

                db.closeConnection();

            %>
            <!-- Content -->
            <div class="row content">

                <div class="col-lg-12 col-md-12 col-sm-12">
                    <div class="breadcrumbs">
                        <p><a href="#">Home</a> <i class="icons icon-right-dir"></i> update an account</p>
                    </div>
                </div>

                <!-- Main Content -->
                <section class="main-content col-lg-12 col-md-12 col-sm-12">



                    <div class="row">

                        <div class="col-lg-12 col-md-12 col-sm-12 register-account">

                            <div class="carousel-heading no-margin">
                                <h4>Update your profile</h4>
                            </div>
                            <form action="../updateprofile" method="post">
                                <input type="hidden" name="userid" value="<%=userid%>" />
                                <input type="hidden" id="type" value="<%=USERTYPE%>" />

                                <div class="page-content">
                                    <div class="row">

                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                            <p><strong>Shopper information</strong></p>
                                        </div>

                                        <div class="col-lg-4 col-md-4 col-sm-4">
                                            <p>E-Mail*</p>
                                        </div>
                                        <div class="col-lg-8 col-md-8 col-sm-8">
                                            <input type="text" name="EMAIL" value="<%=EMAIL%>">
                                        </div>	

                                    </div>

                                    <div class="row">

                                        <div class="col-lg-4 col-md-4 col-sm-4">
                                            <p>Username*</p>
                                        </div>
                                        <div class="col-lg-8 col-md-8 col-sm-8">
                                            <input type="text" name="USERNAME" value="<%=USERNAME%>">
                                        </div>	

                                    </div>

                                    <div class="row">

                                        <div class="col-lg-4 col-md-4 col-sm-4">
                                            <p>First name*</p>
                                        </div>
                                        <div class="col-lg-8 col-md-8 col-sm-8">
                                            <input type="text" name="FISRTNAME" value="<%=FISRTNAME%>">
                                        </div>	

                                    </div>


                                    <div class="row">

                                        <div class="col-lg-4 col-md-4 col-sm-4">
                                            <p>Last name*</p>
                                        </div>
                                        <div class="col-lg-8 col-md-8 col-sm-8">
                                            <input type="text" name="LASTNAME" value="<%=LASTNAME%>">
                                        </div>	

                                    </div>

                                    <div class="row">

                                        <div class="col-lg-4 col-md-4 col-sm-4">
                                            <p>User Type</p>
                                        </div>


                                        <div class="col-lg-8 col-md-8 col-sm-8">
                                            <select class="chosen-select" name="USERTYPE" id="USERTYPE">
                                                <%if (USERTYPE == 1) {%>
                                                <option value="1">Admin</option>

                                                <%}%>
                                                <option value="3">User</option>
                                                <option value="2">Seller</option>

                                            </select>
                                        </div>	

                                    </div>

                                    <div class="row">

                                        <div class="col-lg-4 col-md-4 col-sm-4">
                                            <p>Password</p>
                                        </div>
                                        <div class="col-lg-8 col-md-8 col-sm-8">
                                            <input type="text" name="PASSWORD" value="<%=PASSWORD%>">
                                        </div>	

                                    </div>

                                    <div class="row">

                                        <div class="col-lg-4 col-md-4 col-sm-4">
                                            <p>Confirm Password</p>
                                        </div>
                                        <div class="col-lg-8 col-md-8 col-sm-8">
                                            <input type="text" >
                                        </div>	

                                    </div>


                                    <div class="row">

                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                            <p><strong>Bill to</strong></p>
                                        </div>


                                    </div>




                                    <div class="row">

                                        <div class="col-lg-4 col-md-4 col-sm-4">
                                            <p>Address 1</p>
                                        </div>
                                        <div class="col-lg-8 col-md-8 col-sm-8">
                                            <input type="text" name="ADDRESS1" value="<%=ADDRESS1%>">
                                        </div>	

                                    </div>

                                    <div class="row">

                                        <div class="col-lg-4 col-md-4 col-sm-4">
                                            <p>Address 2</p>
                                        </div>
                                        <div class="col-lg-8 col-md-8 col-sm-8">
                                            <input type="text" name="ADDRESS2" value="<%=ADDRESS2%>">
                                        </div>	

                                    </div>

                                    <div class="row">

                                        <div class="col-lg-4 col-md-4 col-sm-4">
                                            <p>ZIP / Postal Code</p>
                                        </div>
                                        <div class="col-lg-8 col-md-8 col-sm-8">
                                            <input type="text"  name="POSTALCODE" value="<%=POSTALCODE%>">
                                        </div>	

                                    </div>

                                    <div class="row">

                                        <div class="col-lg-4 col-md-4 col-sm-4">
                                            <p>City</p>
                                        </div>
                                        <div class="col-lg-8 col-md-8 col-sm-8">
                                            <input type="text" name="CITY" value="<%=CITY%>">
                                        </div>	

                                    </div>

                                    <div class="row">

                                        <div class="col-lg-4 col-md-4 col-sm-4">
                                            <p>Country</p>
                                        </div>
                                        <div class="col-lg-8 col-md-8 col-sm-8">
                                            <input type="text" name="COUNTRY" value="<%=COUNTRY%>">
                                        </div>	

                                    </div>

                                    <div class="row">

                                        <div class="col-lg-4 col-md-4 col-sm-4">
                                            <p>Phone</p>
                                        </div>
                                        <div class="col-lg-8 col-md-8 col-sm-8">
                                            <input type="text" name="PHONE" value="<%=PHONE%>">
                                        </div>	

                                    </div>

                                    <div class="row">

                                        <div class="col-lg-4 col-md-4 col-sm-4">
                                            <p>PayPal Account</p>
                                        </div>
                                        <div class="col-lg-8 col-md-8 col-sm-8">
                                            <input type="text" name="PAYPAL" value="<%=PAYPAL%>">
                                        </div>	

                                    </div>



                                    <div class="row">



                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                            <input class="big" type="submit" value="Update">
                                            <input class="big" type="reset" value="Cancel">
                                        </div>

                                    </div>
                                </div>
                            </form>
                        </div>

                    </div>


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

        <script src="js/jquery-1.11.0.min.js"></script>


    </body>

</html>

<script>

    $(document).ready(function() {
        var a=document.getElementById('type').value;
        document.getElementById('USERTYPE').value=a;
        //('#USERTYPE').val('2');
    });
</script> 