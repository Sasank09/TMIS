<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script language="javascript">
	function validate(formObj)
	{
	if(formObj.t1.value.length==0)
	{
	alert("Please Enter Username");
	formObj.t1.focus();
	return false;
	}
	if(formObj.t2.value.length==0)
	{
	alert("Please Enter Password");
	formObj.t2.focus();
	return false;
	}
	if(formObj.t4.value.length==0)
	{
	alert("Please Enter Contact No");
	formObj.t4.focus();
	return false;
	}
	if(formObj.t5.value.length==0)
	{
	alert("Please Enter Address");
	formObj.t5.focus();
	return false;
	}
	formObj.actionUpdateData.value="update";
	return true;
	}
	</script>
</head>
<body>
<div class="main">
  <div class="main_resize">
    <div class="header">
      <div class="logo">
       <h1><span><center>PSMPA: Patient Self-Controllable
and Multi-Level Privacy-Preserving
Cooperative</center><center>Authentication in Distributed
m-Healthcare Cloud Computing System</center> </span><small></small></h1>
      </div>
    </div>
    <div class="content">
      <div class="content_bg">
        <div class="menu_nav">
           <ul>
            <li class="active"><a href="RegisterPatients.jsp">Healthcare Patient Upload Phase</a></li>
            <li><a href="RegisterDoctor.jsp">Register Doctor</a></li>
			<li><a href="ViewPatients.jsp">View Patient Details</a></li>
			<li><a href="ViewDoctors.jsp">View Doctor Details</a></li>

            <li><a href="Logout.jsp">Logout</a></li>
          </ul>
        </div>
        <div class="hbg"><img src="images/header_images.JPG" width="915" height="286" alt="" /></div>
      				<center>
<form name="f1" method="post" action="RegisterDoctor" onsubmit="return validate(this);"><br/>
   <h2><b>Add Doctor Screen</b></h2>
   
	<%
	String res = request.getParameter("t1");
	if(res != null){
		out.println("<center><font face=verdana color=red>"+res+"</center></font>");
	}%>
						
						<table align="center" width="40" >
			 <tr><td><b>Username</b></td><td><input type="text" name="t1" style="font-family: Comic Sans MS" size="20"/></td></tr>
         
		  <tr><td><b>Password</b></td><td><input type="password" name="t2" style="font-family: Comic Sans MS" size="20"/></td></tr>

		    <tr><td><b>User Type</b></td><td><select name="t3">
			<option value="Doctor">Doctor</option>
			</select>
			</td></tr>

			 <tr><td><b>Contact No</b></td><td><input type="text" name="t4" style="font-family: Comic Sans MS" size="20"/></td></tr>

			  <tr><td><b>Address</b></td><td><input type="text" name="t5" style="font-family: Comic Sans MS" size="50"/></td></tr>

			   <tr><td><b>Qualification</b></td><td><select name="t6">
			<option value="MBBS">MBBS</option>
			<option value="BUMS">BUMS</option>
			</select>
			</td></tr>

			 <tr><td><b>Speciality</b></td><td><select name="t7">
			<option value="HeartSpecialist">HeartSpecialist</option>
			<option value="CancerSpecialist">CancerSpecialist</option>
			<option value="Others">Others</option>
			</select>
			</td></tr>

			

			<tr><td></td><td><input type="submit" value="Add Doctor"></td>
			</table>
				</div>	
					
				</div>
				
					
	</body>
</html>