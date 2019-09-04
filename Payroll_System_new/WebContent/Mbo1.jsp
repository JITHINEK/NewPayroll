

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
<%@ page
	import="com.mvc.dao.MboPayoutDao, java.sql.ResultSet, java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="ISO-8859-1">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Balay Template</title>
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

<%
		ResultSet rs = null;
		int id =(int) session.getAttribute("id");
		MboPayoutDao pay = new MboPayoutDao();
		rs = pay.fetchRating(id);
		rs.next();
		int rating = rs.getInt("rating");
		System.out.println(rating);
		int variable = 0;
		if(rating==5)
			variable=5000;
		else if(rating==4)
			variable=4000;
		else if(rating==3)
			variable=3000;
		else if(rating==2)
			variable=2000;
		else if(rating==1)
			variable=1000;
		else 
			variable=0;
		System.out.println(variable);
	
%>	



<body>
	<div id="colorlib-page">
		<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
		<aside id="colorlib-aside" role="complementary"
			class="border js-fullheight">

		<h1 id="colorlib-logo">
			<a href="EmpProfile.jsp">${username} (Emp)</a>
		</h1>
		<nav id="colorlib-main-menu" role="navigation">
		<ul>
			<li><a href="EmpHome.jsp">Home</a></li>
			<br>
			<li><a href="EmpProfile.jsp">Profile</a></li>
			<br>
			<li><a href="EmpProfile.jsp">Edit Profile</a></li>
			<br>
			<li class="colorlib-active"><a href="Payroll.jsp">Payslip</a></li>
			<br>
			<li><a href="Payroll.jsp">MBO Payout</a></li>
			<br>
			<br>
			<li><a href="LogoutServlet">Log out</a></li>
		</ul>

		</nav> </aside>

		<div id="colorlib-main">
			<div class="colorlib-services"></div>

			<form action="MboPayout" method="post">
				<!-- <center>
					<div class="row" style="width: 250px; display: block; margin-bottom: 10px;">
						Month:<select name="month"
												class="form-control selectboxit">												<option value="3">March</option>
												<option value="June">June</option>
												<option value="September">September</option>
												<option value="December">December</option>
											</select>
						Year: <input type ="text" name="year">
						
						<input type="submit" value="submit">
					</div>
				</center> -->
				
				<table align="center">
				   <tr>
				     <td>Month:</td>
				      <td><select name="month"
												class="form-control selectboxit">												<option value="3">March</option>
												<option value="June">June</option>
												<option value="September">September</option>
												<option value="December">December</option>
											</select></td>
				       <td>Year: </td>
				        <td><input type ="text" name="year"></td>
				        <td><input type="submit" value="submit"> </td>
				   </tr>
				     
				
				</table>
				
				
				
				
			</form>
			
			<br><br>
			<!-- Start Content-->
		<div class="container-fluid">
				    <div class="row mt-4">
		    	<div class="col-md-2 col-lg-2"></div>
			    <div class="card col-xs-12 col-sm-12 col-md-8 col-lg-8" id="payroll_print" border="5">
					

					<hr>
					<br>
					<h4 style="text-align: center;" >Variable Summary</h4>
					<table class="table table-bordered" width="5%" border="1"
						style="border-collapse: collapse;">
						<thead>
							<tr>
								<th width="60%">Type</th>
								<th>Amount</th>
							</tr>
						</thead>

						<tbody>
							<tr>
								<td class="text-center">Variable</td>
								<td>
									<%
										out.println(variable);
									%>
								</td>
							</tr>
						</tbody>
					</table>

					<br>
					<h3 style="text-align: center; margin-bottom: 0px;">Payslip
						Summary</h3>
					<center>
					<table class="table table-bordered" width="5%" border="1"
						style="border-collapse: collapse;">
						<hr style="margin: 5px 0px 5px 0px; width: 50%;">
					
					<center>
						<table>
							<tr>
								<td style="font-weight: 600; font-size: 15px; color: #000;">
									Variable Salary</td>
								<td
									style="font-weight: 600; font-size: 15px; color: #000; width: 15%; text-align: center;">
									:</td>
								<td
									style="font-weight: 600; font-size: 15px; color: #000; text-align: right;">
									<%
										out.println(variable);
									%>
								</td>
							</tr>
							<tr>
								<td style="font-weight: 600; font-size: 15px; color: #000;">
									Total Allowance</td>
								<td
									style="font-weight: 600; font-size: 15px; color: #000; width: 15%; text-align: center;">
									:</td>
								<td
									style="font-weight: 600; font-size: 15px; color: #000; text-align: right;">
									<%
										out.println(variable);
									%>
								</td>
							</tr>
							<tr>
								<td style="font-weight: 600; font-size: 15px; color: #000;">
									Total Deduction</td>
								<td
									style="font-weight: 600; font-size: 15px; color: #000; width: 15%; text-align: center;">
									:</td>
								<td
									style="font-weight: 600; font-size: 15px; color: #000; text-align: right;">
									<%
										out.println(5000-variable);
									%>
								</td>
							</tr>
							<tr>
								<td colspan="3"><hr style="margin: 5px 0px;"></td>
							</tr>
							<tr>
								<td style="font-weight: 600; font-size: 15px; color: #000;">
									Net Salary</td>
								<td
									style="font-weight: 600; font-size: 15px; color: #000; width: 15%; text-align: center;">
									:</td>
								<td
									style="font-weight: 600; font-size: 15px; color: #000; text-align: right;">
									<%
										out.println(variable);
									%>
								</td>
							</tr>
						</table>
					</center>
					</center>
					<br> <a href="#" onClick="PrintElem('#payroll_print')"
						class="btn btn-info float-right mb-2"
						style="max-width: 100px; min-width: 80px;"> <i
						class="mdi mdi-printer"></i> Print
					</a>
				
			    </div>
			</div>

		    
	    
				</div>
	<!-- app js -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

		<!--Print of payroll details-->
		<script type="text/javascript">

		    function PrintElem(elem)
		    {
		        Popup($(elem).html());
		    }

		    function Popup(data)
		    {
		        var mywindow = window.open('', 'payroll', 'height=600,width=800');
		        mywindow.document.write('<html><head><title>Payroll Details</title>');
		        mywindow.document.write('');
		        mywindow.document.write('');
		        mywindow.document.write('</head><body >');
		        mywindow.document.write(data);
		        mywindow.document.write('</body></html>');

		        mywindow.print();
		        mywindow.close();

		        return true;
		    }

		</script>
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
