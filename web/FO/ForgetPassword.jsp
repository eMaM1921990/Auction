<%-- 
    Document   : Registeration
    Created on : Jul 12, 2014, 8:29:35 PM
    Author     : emam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                    	<p><a href="#">Home</a> <i class="icons icon-right-dir"></i> Create an account</p>
                    </div>
                </div>
                
				<!-- Main Content -->
				<section class="main-content col-lg-12 col-md-12 col-sm-12">
              
                    
                        <div class="row">
                    	
                        <div class="col-lg-12 col-md-12 col-sm-12">
                        	
                            <div class="carousel-heading no-margin">
                                <h4>Insert your account name</h4>
                            </div>
                            <form action="../ResetPassword" method="post">
                            <div class="page-content">
                            	<p>If you are already registered , you will get password at your email</p>
                                <div class="row">
                                	<div class="col-lg-12 col-md-12 col-sm-12">
                                    	<div class="iconic-input">
                                            <input type="text" placeholder="enter your account's mail" name="email">
                                            <i class="icons icon-user-3"></i>
                                        </div>
                                    </div>
                                    
                                    
                                </div>
                                
                              
                                <br/><br/>
                                <div class="row">
                                	<div class="col-lg-6 col-md-6 col-sm-6 align-left">
                                    	<input type="submit" class="orange" value="Reset Password">
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

		
    </body>
    
</html>