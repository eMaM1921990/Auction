<%-- 
    Document   : Login
    Created on : Jun 13, 2014, 5:26:35 PM
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
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<!-- Bootstrap responsive -->
	<link rel="stylesheet" href="css/bootstrap-responsive.min.css">
	<!-- icheck -->
	<link rel="stylesheet" href="css/plugins/icheck/all.css">
	<!-- Theme CSS -->
	<link rel="stylesheet" href="css/style.css">
	<!-- Color CSS -->
	<link rel="stylesheet" href="css/themes.css">


	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	
	<!-- Nice Scroll -->
	<script src="js/plugins/nicescroll/jquery.nicescroll.min.js"></script>
	<!-- Validation -->
	<script src="js/plugins/validation/jquery.validate.min.js"></script>
	<script src="js/plugins/validation/additional-methods.min.js"></script>
	<!-- icheck -->
	<script src="js/plugins/icheck/jquery.icheck.min.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<script src="js/eakroko.js"></script>

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

<body class='login'>
	<div class="wrapper">
            <h1><a href="Login.jsp"><img src="img/logo-big.png" alt="" class='retina-ready' width="59" height="49">FLAT</a></h1>
		<div class="login-body">
			<h2>SIGN IN</h2>
			<form action="../Login" method='post' class='form-validate' id="test">
				<div class="control-group">
					<div class="email controls">
						<input type="text" name='user' placeholder="Username" class='input-block-level' data-rule-required="true" >
					</div>
				</div>
				<div class="control-group">
					<div class="pw controls">
						<input type="password" name="pass" placeholder="Password" class='input-block-level' data-rule-required="true">
					</div>
				</div>
				<div class="submit">
					
					<input type="submit" value="Sign me in" class='btn btn-primary'>
				</div>
			</form>
			
		</div>
	</div>
</body>

</html>
