<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.ResultSet"%>

<%@ page import="com.mvc.util.DBConnection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="ISO-8859-1">
<meta charset="utf-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Profile</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="author" content="" />



<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<link rel="shortcut icon" href="favicon.ico">

<link
	href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700"
	rel="stylesheet">

<!-- Animate.css -->
<link rel="stylesheet" href="css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="css/icomoon.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="css/bootstrap.css">
<!-- Flexslider  -->
<link rel="stylesheet" href="css/flexslider.css">
<!-- Flaticons  -->
<link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">
<!-- Owl Carousel -->
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<!-- Theme style  -->
<link rel="stylesheet" href="css/style.css">

<!-- Modernizr JS -->
<script src="js/modernizr-2.6.2.min.js"></script>
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

</head>
<body>

	<div id="colorlib-page">
		<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
		<aside id="colorlib-aside" role="complementary"
			class="border js-fullheight">
		<h1 id="colorlib-logo">
			<h1 id="colorlib-logo"><a href="EmpProfile.jsp">Hai ${username}</a></h1>
		</h1>
		<nav id="colorlib-main-menu" role="navigation">
		<ul>
					<li><a href="EmpHome.jsp">Home</a></li><br>
					<li><a href="EmpProfile.jsp">Profile</a></li><br>
					
					<li><a href="Payroll.jsp">Payslip</a></li><br>
					<li><a href="MboPayout.jsp">MBO Payout</a></li><br>
					<li class="colorlib-active"><a href="Declaration.jsp">Download forms</a></li><br>
					<li><a href="ResetPasswd.jsp">Reset Password</a></li><br><br>
					<li><a href="LogoutServlet">Log out</a></li>
		</ul>
		</nav> </aside>

		<br> <br> <br>
		<center>
			<h2 class="colorlib-heading">Forms</h2>

		</center>
		<br>


		<table align='center' width=600px >
			<tr>

				<th><center>Form Type</center></th>
				<th><center>Download Form</center></th>
			</tr>
			<tr>
				<td><center>Investment Declaration Form</center></td>
				<td>
					<center>
						<a href="Download_Form/investment_declaration.pdf" download><input
							type="button" class="btn" value="Download"></a>
					</center>
				</td>
			</tr>
			<tr>
				<td><center>Medical Reimbursement Form</center></td>
				<td><center>
						<a href="Download_Form/Medical.pdf" download><input
							type="button" class="btn" value="Download"></a>
					</center></td>
			</tr>

			<tr>
				<td><center>Telephone Reimbursement Form</center></td>
				<td><center>
						<a href="Download_Form/telephone.pdf" download><input
							type="button" class="btn" value="Download"></a>
					</center></td>
			</tr>

		</table>



	</div>




	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Flexslider -->
	<script src="js/jquery.flexslider-min.js"></script>
	<!-- Sticky Kit -->
	<script src="js/sticky-kit.min.js"></script>
	<!-- Owl carousel -->
	<script src="js/owl.carousel.min.js"></script>
	<!-- Counters -->
	<script src="js/jquery.countTo.js"></script>


	<!-- MAIN JS -->
	<script src="js/main.js"></script>

</body>
</html>
