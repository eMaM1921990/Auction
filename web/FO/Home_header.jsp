<%-- 
    Document   : Home_header
    Created on : Jul 4, 2014, 3:26:33 PM
    Author     : eMaM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.LoginBeans" %>
<%session = request.getSession();
    String username = null;
    int userid = 0;
    int type = 0;
    if(session.getAttribute("login")!=null){
         beans.LoginBeans login;
    login = (beans.LoginBeans) session.getAttribute("login");
    username = login.getUserName();
    userid = login.getUserId();
    type = login.getUserType();

    }
   
    

   
    
%>
<link rel="stylesheet" type="text/css" href="style/freeow/freeow.css" />
        <link rel="stylesheet" type="text/css" href="css/demo.css" />

        <script type="text/javascript" src="js/jquery.freeow.js"></script>
<script type="text/javascript">
    var automax = setInterval(function()
    {
        $('#message').load('../UnreadMessage').fadeIn("slow");
    }, 1000); // refresh every 5000 milliseconds
    /*
     var auction = setInterval(function()
    {
         $.get('../getServerDateandTime', null, function(responseText) {
                    max = responseText;
                    if (max > 0) {
                        
                        $(document).ready(function() {
                            $("#freeow").freeow("Auction news", "New item ready for Live virtual auction", {
                                classes: ["smokey", "slide"],
                                autoHide: true
                            });
                        });
                    }
                    });
    }, 1000); // refresh every 5000 milliseconds
    */
</script>
<!DOCTYPE html>
<!-- Header -->
<header class="row">

    <div class="col-lg-12 col-md-12 col-sm-12">

         <%if(session.getAttribute("login")!=null){%>
        <!-- Top Header -->
        <div id="top-header" class="style2">

            <div class="row">

                <nav id="top-navigation" class="col-lg-12 col-md-12 col-sm-12">
                    <ul class="pull-right">
                        <div id="message"></div>
                                   
                                    
                                    
                                    
                    </ul>
                </nav>

            </div>

        </div>
        <%}%>
        <!-- /Top Header -->



        <!-- Main Header -->
        <div id="main-header" class="style2">

            <div class="row">

                <div id="logo" class="col-lg-4 col-md-4 col-sm-4">
                    <a href="Portal.jsp"><img src="img/logo.png" alt="Logo"></a>
                </div>

                <nav id="middle-navigation" class="col-lg-8 col-md-8 col-sm-8">
                    <ul class="pull-right">


                        <li class="login-create purple">
                            <i class="icons icon-user"></i>
                            <%if (userid == 0) {%>
                            <p>Hello Guest! <a href="#">Login</a> or<br><a href="Registeration.jsp">Create Account</a></p>
                            <ul id="login-dropdown" class="box-dropdown">
                                <li>
                                    <div class="box-wrapper">
                                        <form action="../Login" method='post'>
                                            <h4>LOGIN</h4>
                                            <div class="iconic-input">
                                                <input type="text" placeholder="Username" name="user">
                                                <i class="icons icon-user-3"></i>
                                            </div>
                                            <div class="iconic-input">
                                                <input type="password" placeholder="Password" name="pass">
                                                <i class="icons icon-lock"></i>
                                            </div>

                                            <br>
                                            <br>
                                            <div class="pull-left">
                                                <input type="submit" class="orange" value="Login">
                                            </div>
                                        </form>
                                        <div class="pull-right">
                                            <a href="ForgetPassword.jsp">Forgot your password?</a>
                                            <br>
                                            
                                        </div>
                                        <br class="clearfix">
                                    </div>
                                    <div class="footer">
                                        <h4 class="pull-left">NEW CUSTOMER?</h4>
                                        <a class="button pull-right" href="Registeration.jsp">Create an account</a>
                                    </div>
                                </li>
                            </ul>
                            <%} else {%>
                            <p> Hello <a href="#"> <%=username%></a></p>
                            <%}%>
                        </li>
                    </ul>
                </nav>

            </div>

        </div>
        <!-- /Main Header -->


        <!-- Main Navigation -->
        <nav id="main-navigation" class="style2">
            <ul>

                <li class="home-green current-item">
                    <a href="Portal.jsp">
                        <span class="nav-caption">Home</span>
                        <span class="nav-description">Home</span>
                    </a>


                </li>

                <li class="red">
                    <a href="#">
                        <span class="nav-caption"> Brands</span>
                        <span class="nav-description">Product List</span>
                    </a>

                    <ul class="wide-dropdown normalAniamtion">
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

                <li class="blue">
                    <a href="#">
                        <span class="nav-caption">Auction</span>
                        <span class="nav-description">Auction </span>
                    </a>
                    
                    <ul class="wide-dropdown normalAniamtion">
                        <li>
                            <ul>

                                <li><a href="Online.jsp"><i class="icons icon-right-dir"></i>Live Items</a></li>
                                <li><a href="Auction/AuctionCalendar.jsp"><i class="icons icon-right-dir"></i> Auction New</a></li>
                                
                            </ul>
                        </li>
                       

                    </ul>

                </li>

                <li class="orange">
                    <a href="Auction/TopSeller.jsp">
                        <span class="nav-caption">Top Seller</span>
                        <span class="nav-description">Best Seller</span>
                    </a>
                </li>

                <li class="green">
                    <a href="Shipment.jsp">
                        <span class="nav-caption">Shipment</span>
                        <span class="nav-description">Shipment Details</span>
                    </a>
                </li>

                <li class="purple">
                    <a href="contact.jsp">
                        <span class="nav-caption">Contact Us</span>
                        <span class="nav-description">Keep Touch</span>
                    </a>
                </li>



            </ul>



        </nav>
        <!-- /Main Navigation -->

    </div>

</header>
<!-- /Header -->

<div id="freeow" class="freeow freeow-bottom-right "></div>