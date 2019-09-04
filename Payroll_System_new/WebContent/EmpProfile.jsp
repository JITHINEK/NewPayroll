
<%
	response.setHeader("cache-control", "no-cache, no-store, must-revalidate");
	if ((session.getAttribute("username") == null) || (session.getAttribute("username") == "")) {
%>
You need to be logged in as to view this page
<br />
<a href="login.jsp">Please Login</a>
<%
	response.sendRedirect("login.jsp");
%>
<%
	} else {
%>
<%@ page
	import="com.mvc.dao.ProfileDao, java.sql.ResultSet, java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="ISO-8859-1">
<meta charset="utf-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Payroll System</title>
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
	<%
			//long tem = 0;
			int id = (int) session.getAttribute("id");
			System.out.println("=====================");
			System.out.println(id);
			ProfileDao pdo = new ProfileDao();
			ResultSet[] rs = null;
			rs = pdo.profile(id);
			rs[0].next();
			
			String name = rs[0].getString("name");
			int id1 = rs[0].getInt("id");
			
			long adhar_no;
			String pan_no = null;
			long ph_no;
			String email_id;

			String addr = null;
			String city = null;
			String state = null;
			
			long accNo;
			String ifscCode;
			String bankName = null;
			int pin;

			Date j_d = rs[0].getDate("joining_date");

			rs[1].next();
			adhar_no = rs[1].getLong("adhar_no");
			pan_no = rs[1].getString("pan_no");
			ph_no = rs[1].getLong("ph_no");
			email_id = rs[0].getString("emai_id");
			
			rs[2].next();
			addr = rs[2].getString("addr");
			city = rs[2].getString("city");
			state = rs[2].getString("state");
			pin = rs[2].getInt("pin");

			rs[3].next();
			bankName = rs[3].getString("bank_name");
			accNo = rs[3].getLong("acc_no");
			ifscCode = rs[3].getString("ifsc_code");
						
			
	%>
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
					<li class="colorlib-active"><a href="EmpProfile.jsp">Profile</a></li><br>
					
					<li><a href="Payroll.jsp">Payslip</a></li><br>
					<li><a href="MboPayout.jsp">MBO Payout</a></li><br>
					<li><a href="Declaration.jsp">Download forms</a></li><br>
					<li><a href="ResetPasswd.jsp">Reset Password</a></li><br><br>
					<li><a href="LogoutServlet">Log out</a></li>
		</ul>
		</nav> </aside>

		<div id="colorlib-main">
			<div style="text-align:right"><a class="btn btn-success" href="edit_profile.jsp" style=" margin: 10px;">Edit</a></div>
			<div class="colorlib-about" style="padding-top: 0;">
				<div class="colorlib-narrow-content">
					<div class="row row-bottom-padded-md"></div>
					<div class="col-md-6 animate-box" data-animate-effect="fadeInLeft">
						<div class="about-desc">
							<br><span class="heading-meta">Welcome</span>
							<h2 class="colorlib-heading">My Personal Details</h2>
							<p>Name: <% out.println(name); %></p>
							<p>Employee id: <% out.println(id1); %></p>
							<p>Email id: <% out.println(email_id); %></p>
							<p>Date of join: <% out.println(j_d); %></p>
						</div>

					</div>
				</div>

				<div id="collapseOne" class="panel-collapse collapse in"
					role="tabpanel" aria-labelledby="headingOne">
					<div class="panel-body">
						<div class="row"></div>
					</div>
				</div>

				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingTwo">
						<h4 class="panel-title">
							<a class="collapsed" data-toggle="collapse"
								data-parent="#accordion" href="#collapseTwo"
								aria-expanded="false" aria-controls="collapseTwo">Identification
								Details </a>
						</h4>
					</div>
					<div id="collapseTwo" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="headingTwo">
						<div class="panel-body">
							<p>Aadhar No: <% out.println(adhar_no); %></p>
							<p>Pan No: <% out.println(pan_no); %></p>
							<p>Passport No: <% out.println(); %></p>
							<p>Mobile No: <% out.println(ph_no); %></p>
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingTwo">
						<h4 class="panel-title">
							<a class="collapsed" data-toggle="collapse"
								data-parent="#accordion" href="#collapseThree"
								aria-expanded="false" aria-controls="collapseTwo">Bank
								Details </a>
						</h4>
					</div>
					<div id="collapseThree" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="headingTwo">
						<div class="panel-body">
							<p>Bank Name: <% out.println(bankName); %></p>
							<p>Acc No: <% out.println(accNo); %></p>
							<p>IFSC Code: <% out.println(ifscCode); %></p>
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingThree">
						<h4 class="panel-title">
							<a class="collapsed" data-toggle="collapse"
								data-parent="#accordion" href="#collapseFour"
								aria-expanded="false" aria-controls="collapseThree">Contact
								Details </a>
						</h4>
					</div>
					<div id="collapseFour" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="headingThree">
						<div class="panel-body">
							<p>Address: <%out.println(addr); %></p>
							<p>City: <%out.println(city); %></p>
							<p>State: <%out.println(state); %></p>
							<p>Pincode: <% out.println(pin); %></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		
	</script>

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

<%
	}
%>
