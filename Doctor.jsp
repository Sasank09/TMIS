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
	if(formObj.t3.value.length==0)
	{
	alert("Please Enter Random Number");
	formObj.t3.focus();
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
       <h1><span><center>A secure elliptic curve cryptography based mutual authentication
protocol </center><center>for TMIS</center> </span><small></small></h1>
      </div>
    </div>
    <div class="content">
      <div class="content_bg">
        <div class="menu_nav">
          <ul>
            <li class="active"><a href="index.jsp">Home</a></li>
            <li><a href="Admin.jsp">Administrator</a></li>
            <li><a href="Doctor.jsp">Doctor Login</a></li>
            <li><a href="Patient.jsp">Patient Login</a></li>
          </ul>
        </div>
        <div class="hbg"><img src="images/header_images.JPG" width="915" height="286" alt="" /></div>
      				<center>
<form name="f1" method="post" action="Physician" onsubmit="return validate(this);"><br/>
   <h2><b>Doctor Login Screen</b></h2>
   
	<%
	String res = request.getParameter("t1");
	if(res != null){
		out.println("<center><font face=verdana color=red>"+res+"</center></font>");
	}%>
						
						<table align="center" width="40" >
			 <tr><td><b>Username</b></td><td><input type="text" name="t1" style="font-family: Comic Sans MS" size=20/></td></tr>
         
		  <tr><td><b>Password</b></td><td><input type="password" name="t2" style="font-family: Comic Sans MS" size=20/></td></tr>

		<tr><td><b>Random No</b></td><td><input type="password" name="t3" style="font-family: Comic Sans MS" size=20/></td></tr>
		   
			<tr><td></td><td><input type="submit" value="Login"></td>
			</table>
				</div>	
					
				</div>
				
					
	</body>
</html>