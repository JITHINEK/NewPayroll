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
	import="com.mvc.dao.AdminDao, java.sql.ResultSet, java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="ISO-8859-1">
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

	<div id="colorlib-page">
		<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
		<aside id="colorlib-aside" role="complementary"
			class="border js-fullheight">
		<h1 id="colorlib-logo">
			<a href="admin_profile.jsp">hai ${username}</a>
		</h1>
		<nav id="colorlib-main-menu" role="navigation">
		<ul>
			<li><a href="Adminhome.jsp">Home</a></li>
			<br>
			<li><a href="admin_profile.jsp">Profile</a></li>
			<br>
			<li><a href="AddEmp.jsp">+Add Employes</a></li>
			<br>
			<li class="colorlib-active"><a href="EmpList.jsp">Employee List</a></li>
			<br> <br>
					<li><a href="LogoutServlet">Log out</a></li>
		</ul>
		</nav> </aside>

		<div id="colorlib-main">
			<div class="colorlib-services">
				<div class="colorlib-narrow-content">
					<div class="row">
						<div class="col-md-6 col-md-offset-3 col-md-pull-3 animate-box"
							data-animate-effect="fadeInLeft">
							<span class="heading-meta">Employes</span>
						</div>
					</div>
					<div class="row">
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">Sl No</th>
									<th scope="col">Emp Id</th>
									<th scope="col">Name</th>
									<th scope="col">Email Id</th>
									<th scope="col">Date of Join</th>
									<th scope="col">Dept</th>
									<th scope="col">Desig</th>
									<th scope="col">Tire No</th>
								</tr>
							</thead>
							
								
							
							<tbody>
								<%
								
								int id;
								String name;
								String email;
								Date j_d;
								String dept;
								String desig;
								int tire;
								
								AdminDao adminDao = new AdminDao();
								ResultSet rs = adminDao.empList();
								int i = 1;
								while(rs.next()){
									id=rs.getInt("id");
									name= rs.getString("name");
									email = rs.getString("emai_id");
									j_d =  rs.getDate("joining_date");
									dept = rs.getString("emp_dept");
									desig = rs.getString("designation");
									tire = rs.getInt("tire_no");
									System.out.println(id);
								%>
								
								<tr>
									<td scope="row"><% out.println(i); %></td>
									<td scope="row"><% out.println(id); %></td>
									<td scope="row"><% out.println(name); %></td>
									<td scope="row"><% out.println(email); %></td>
									<td scope="row"><% out.println(j_d); %></td>
									<td scope="row"><% out.println(dept); %></td>
									<td scope="row"><% out.println(desig); %></td>
									<td scope="row"><% out.println(tire); %></td>
								</tr>
								<%
									i++;
								}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>


	</div>
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
<%
	}
%>