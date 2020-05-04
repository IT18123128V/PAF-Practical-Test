<%@page import="appointmentModel.Appointment" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%


if (request.getParameter("patientNIC") != null) 
	{
	Appointment app=new Appointment();
		app.connect();
		String stsMsg=app.createAppoitnment(request.getParameter("patientNIC"),
				request.getParameter("spec"),
				request.getParameter("doc"),
				request.getParameter("date"),
				request.getParameter("time"),
				request.getParameter("hospital"));
	
		

		session.setAttribute("statusMsg", stsMsg);
		response.sendRedirect("patient.jsp");
						
	}
	if (request.getParameter("appoitnmentNumber") != null)
	{
		Appointment itemObj = new Appointment();
	 String stsMsg = itemObj.deletePatient(request.getParameter("appoitnmentNumber"));
	 session.setAttribute("statusMsg", stsMsg);
	}
	
	if (request.getParameter("appoitnmentNumberUpdate") != null) 
	{
		Appointment update=new Appointment();
		//app.connect();
		String stsMsg=update.updateAppoitnment(request.getParameter("appoitnmentNumberUpdate"),
				request.getParameter("upDate"),
				request.getParameter("upHospital"),
				request.getParameter("upTime"));
	
		

		session.setAttribute("statusMsg", stsMsg);
		//response.sendRedirect("patient.jsp");
						
	}

%>


<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/main.js"></script>


<meta charset="UTF-8">
<title>Patients' Portal</title>
</head>
<body>

	<h1>Patients' Portal</h1>
	
	<br>
	<br>
	
	
	<div class="container">
 				<div class="row">
 					<div class="col-8">
	
		
		<h3 class="m-3">Create an Appointments</h3>
		
		<form method="post" action="patient.jsp"  id="formAppointment">
		
		
		<!-- NAME -->
		
			<div class="input-group input-group-sm mb-3">
			
			<div class="input-group-prepend">
			
 			<span class="input-group-text" id="patientnic">Patient NIC: </span>
 			
			</div>
			
			<input type="text" id="txtName" name="patientNIC">
			
			</div>
			
			
			
					<!-- Doctor's Speciality -->
		
			<div class="input-group input-group-sm mb-3">
			
			<div class="input-group-prepend">
			
 			<span class="input-group-text" id="docSpec">Doctor's Speciality: </span>
 			
			</div>
			
			<input type="text" id="txtName" name="spec">
			
			</div>
			
			
			
								<!--  Doctor -->
		
			<div class="input-group input-group-sm mb-3">
			
			<div class="input-group-prepend">
			
 			<span class="input-group-text" id="Doc">Doctor: </span>
 			
			</div>
			
			<input type="text" id="txtName" name="doc">
			
			</div>
			
			
											<!-- Date -->
		
			<div class="input-group input-group-sm mb-3">
			
			<div class="input-group-prepend">
			
 			<span class="input-group-text" id="Date">Date: </span>
 			
			</div>
			
			<input type="date" id="txtName" name="date">
			
			</div>
			
						
											<!-- Time-->
		
			<div class="input-group input-group-sm mb-3">
			
			<div class="input-group-prepend">
			
 			<span class="input-group-text" id="Time">Time: </span>
 			
			</div>
			
			<input type="time" id="txtName" name="time">
			
			</div>

			
														<!-- Hospital -->
		
			<div class="input-group input-group-sm mb-3">
			
			<div class="input-group-prepend">
			
 			<span class="input-group-text" id="Hospital">Hospital: </span>
 			
			</div>
			
			<input type="text" id="txtName" name="hospital">
			
			</div>
			
						<!-- Message -->
			
			<div id="alertSuccess" class="alert alert-success"></div>
			
			<div id="alertError" class="alert alert-danger"></div>
		
		
			<br>
			
			 
			<input type="submit" name="submit" value="Submit" class="btn btn-primary" id="btnsubmit"> 
			
			
			
			<br> 
			
			<br> 
			
			Appointment Number <% out.print(session.getAttribute("statusMsg")); %>  
			
			<input type="text" name="appNoUpdate" disabled >
		
		
	</form>
	<br>
	<br>
	
	
	
	
	<fieldset>
			<h3> Appointments </h3>
			<p id="appointmet">
		<%
		Appointment itemObj = new Appointment();
		 out.print(itemObj.readAppointment());
		%>
			<span> </span>
		</p>
	</fieldset>
	<br>
	<br>
	
	
	
															<!-- Delete -->
															
															
			<h3 class="m-3">Delete Appointment</h3>	
			
			<form method="post" action="patient.jsp">											
		
			<div class="input-group input-group-sm mb-3">
			
			<div class="input-group-prepend">
			
 			<span class="input-group-text" id="Hospital">Appointment Number: </span>
 			
			</div>
			
			<input type="text" id="txtName" name="appoitnmentNumber">
			
			</div>
												
		
			<div class="input-group input-group-sm mb-3">
			
			<div class="input-group-prepend">
			
 			<span class="input-group-text" id="Hospital">Doctor's Name : </span>
 			
			</div>
			
			<input type="text" id="txtName" name="appNoUpdate">
			
			</div>
	
	 
		
		
		<input type="submit" name="delete" value="Delete" class="btn btn-primary" id="btndelete">
		</form>
		
	

	
	<br>
	<br>
	
			<h3 class="m-3">Update Appointment</h3>
			<form method="post" action="patient.jsp">	


								<!--  Doctor -->
		
			<div class="input-group input-group-sm mb-3">
			
			<div class="input-group-prepend">
			
 			<span class="input-group-text"  id="Doc">Doctor: </span>
 			
			</div>
			
			<input type="text"  id="txtName" name="doc">
			
			</div>
			
			
											<!--  Appointment Number -->
		
			<div class="input-group input-group-sm mb-3">
			
			<div class="input-group-prepend">
			
 			<span class="input-group-text"  id="appoint">Appointment Number: </span>
 			
			</div>
			
			<input type="text" name="appoitnmentNumberUpdate" id="txtName">
			
			</div>
			
			
			
			
														<!--  Updated Date -->
		
			<div class="input-group input-group-sm mb-3">
			
			<div class="input-group-prepend">
			
 			<span class="input-group-text"  id="update">Updated Date: </span>
 			
			</div>
			
			<input type="date" name="upDate" id="txtName">
			
			</div>
			
			
						
														<!--  Updated Hospital -->
		
			<div class="input-group input-group-sm mb-3">
			
			<div class="input-group-prepend">
			
 			<span class="input-group-text"  id="uphospi">Updated Hospital: </span>
 			
			</div>
			
			<input type="date" name="upHospital" id="txtName">
			
			</div>
			
			
																	<!--  Updated Hospital -->
		
			<div class="input-group input-group-sm mb-3">
			
			<div class="input-group-prepend">
			
 			<span class="input-group-text"  id="uptime">Updated Time: </span>
 			
			</div>
			
			<input type="time" name="upTime" id="txtName">
			
			</div>
			

			<br>
			
			
			<input type="submit" name="update" value="Update" class="btn btn-primary">
		</form>
		
		
		
		</div>
		</div>
		</div>
		
	




	<br>
	<br>
	
	
	<form method="post" action="payment.jsp">
	<input type="submit" name="pay" value="To the Payments">
	</form>
	
	<% out.print(session.getAttribute("statusMsg")); %>



</body>
</html>