

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
	import="com.mvc.dao.PayrollDAO, java.sql.ResultSet, java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8" />
	    	    <title> | Manpower HRM</title>
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
	    <meta content="Coderthemes" name="author" />
	    <!-- App favicon -->
	    <link rel="icon" href="http://creativeitem.com/demo/manpower/assets/images/favicon.png">

	    <!-- third party css -->
	    <link href="http://creativeitem.com/demo/manpower/assets/css/vendor/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
	    <link href="http://creativeitem.com/demo/manpower/assets/css/vendor/dataTables.bootstrap4.css" rel="stylesheet" type="text/css" />
	    <link href="http://creativeitem.com/demo/manpower/assets/css/vendor/responsive.bootstrap4.css" rel="stylesheet" type="text/css" />
	    <link href="http://creativeitem.com/demo/manpower/assets/css/vendor/buttons.bootstrap4.css" rel="stylesheet" type="text/css" />
	    <link href="http://creativeitem.com/demo/manpower/assets/css/vendor/select.bootstrap4.css" rel="stylesheet" type="text/css" />
	    <link href="http://creativeitem.com/demo/manpower/assets/css/vendor/fullcalendar.min.css" rel="stylesheet" type="text/css" />
	    <!-- third party css end -->

	    <!-- App css -->
	    <link href="http://creativeitem.com/demo/manpower/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
	    <link href="http://creativeitem.com/demo/manpower/assets/css/app.min.css" rel="stylesheet" type="text/css" />


		<!-- AMCHARTS -->
		<!--<script src="assets/amcharts/amcharts.js"></script>
		<script src="assets/amcharts/serial.js"></script>
		<script src="assets/amcharts/pie.js"></script>
		<script src="assets/amcharts/themes/light.js"></script>
		<script src="assets/amcharts/plugins/export/export.js"></script>
		<script src="assets/amcharts/plugins/export/export.css"></script>-->

		<!--[if lt IE 9]><script src="assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
		
		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
	</head>
	<%
		ResultSet rs = null;
		int id =(int) session.getAttribute("tire");
		PayrollDAO pay = new PayrollDAO();
		rs = pay.fetchSal(id);
		rs.next();
		int totAllow = rs.getInt("bonus")+rs.getInt("hra")+rs.getInt("special_allowance")+rs.getInt("food_rembersement");
		int totDedu = rs.getInt("pf")+rs.getInt("gratuity");
	
	
	%>
	<body>
		<!-- Start Content-->
		<div class="container-fluid">
				    <div class="row mt-4">
		    	<div class="col-md-2 col-lg-2"></div>
			    <div class="card col-xs-12 col-sm-12 col-md-8 col-lg-8" id="payroll_print">
					<table width="100%" border="0">
						<tr>
							<td width="50%"><img
								src="http://creativeitem.com/demo/manpower//uploads/logo.png"
								style="max-height: 80px;"></td>
							<td align="right">
								<h4>
									Employee Id:
									<%
									out.println(session.getAttribute("id"));
								%>
								</h4>
								<h5>Employee Name : ${username}</h5>
								<h5>Tire No: <%out.println(id); %></h5>
								<h5>Date of Receive : <%out.println(request.getAttribute("date")); %></h5>
							</td>
						</tr>
					</table>

					<hr>
					<br>
					<h4 style="text-align: center;">Allowance Summary</h4>
					<table class="table table-bordered" width="100%" border="1"
						style="border-collapse: collapse;">
						<thead>
							<tr>
								<th width="60%">Type</th>
								<th>Amount</th>
							</tr>
						</thead>

						<tbody>
							<tr>
								<td class="text-center">Basic</td>
								<td>
									<%
										out.println(rs.getInt("basic"));
									%>
								</td>
							</tr>
							<tr>
								<td class="text-center">HRA</td>
								<td>
									<%
										out.println(rs.getInt("hra"));
									%>
								</td>
							</tr>
							<tr>
								<td class="text-center">Special Allowance</td>
								<td>
									<%
										out.println(rs.getInt("special_allowance"));
									%>
								</td>
							</tr>
							<tr>
								<td class="text-center">Food Reimbursement</td>
								<td>
									<%
										out.println(rs.getInt("food_rembersement"));
									%>
								</td>
							</tr>
							<tr>
								<td class="text-center">Advance Statutory Bonus</td>
								<td>
									<%
										out.println(rs.getInt("bonus"));
									%>
								</td>
							</tr>

						</tbody>
					</table>

					<br>
					<h4 style="text-align: center;">Deduction Summary</h4>
					<table class="table table-bordered" width="100%" border="1"
						style="border-collapse: collapse;">
						<thead>
							<tr>
								<th width="60%">Type</th>
								<th>Amount</th>
							</tr>
						</thead>

						<tbody>
							<tr>
								<td class="text-center">PF</td>
								<td>
									<%
										out.println(rs.getInt("pf"));
									%>
								</td>
							</tr>
							<tr>
								<td class="text-center">Gratuity</td>
								<td>
									<%
										out.println(rs.getInt("gratuity"));
									%>
								</td>
							</tr>
						</tbody>
					</table>

					<br>
					<h3 style="text-align: center; margin-bottom: 0px;">Payslip
						Summary</h3>
					<center>
						<hr style="margin: 5px 0px 5px 0px; width: 50%;">
					</center>
					<center>
						<table>
							<tr>
								<td style="font-weight: 600; font-size: 15px; color: #000;">
									Basic Salary</td>
								<td
									style="font-weight: 600; font-size: 15px; color: #000; width: 15%; text-align: center;">
									:</td>
								<td
									style="font-weight: 600; font-size: 15px; color: #000; text-align: right;">
									<%
										out.println(rs.getInt("basic"));
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
										out.println(totAllow);
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
										out.println(totDedu);
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
										out.println(totAllow-totDedu);
									%>
								</td>
							</tr>
						</table>
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
	</body>
</html>
<%
	}
%>