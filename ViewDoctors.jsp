<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.DBConnection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
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
            <li class="active"><a href="RegisterPatients.jsp">Healthcare Patient Upload Phase</a></li>
            <li><a href="RegisterDoctor.jsp">Register Doctor</a></li>
			<li><a href="ViewPatients.jsp">View Patient Details</a></li>
			<li><a href="ViewDoctors.jsp">View Doctor Details</a></li>

            <li><a href="Logout.jsp">Logout</a></li>
          </ul>
        </div>
        <div class="hbg"><img src="images/header_images.JPG" width="915" height="286" alt="" /></div>
      				<center>

   <h2><b>View Physician Details Screen</b></h2>
   
	<%
	String res = request.getParameter("t1");
	if(res != null){
		out.println("<center><font face=verdana color=red>"+res+"</center></font>");
	}%>
			<table border="1" align="center" width="50%">
			<tr><th><font size="3" color="black">UserName</th><th><font size="3" color="black">Password</th><th><font size="3" color="black">User Type</th>
			<th><font size="3" color="black">Contact No</th><th><font size="3" color="black">Address</th><th><font size="3" color="black">Qualification</th>
			<th><font size="3" color="black">Speciality</th><th><font size="3" color="black">Random No</th>
			<th><font size="3" color="black">Public/Secret Key</th>
			<tr>
	<%
	Connection con = DBConnection.getCon();
	String pid = session.getAttribute("user").toString();
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("select * from adddoctor");
	while(rs.next()){
		String str = rs.getString(9);
		str = str.substring(0,30);
		%>
	<tr><td><font size="3" color="black"><%=rs.getString(1)%></td>
	<td><font size="3" color="black"><%=rs.getString(2)%></td>
	<td><font size="3" color="black"><%=rs.getString(3)%></td>
	<td><font size="3" color="black"><%=rs.getString(4)%></td>
	<td><font size="3" color="black"><%=rs.getString(5)%></td>
	<td><font size="3" color="black"><%=rs.getString(6)%></td>
	<td><font size="3" color="black"><%=rs.getString(7)%></td>
	<td><font size="3" color="black"><%=rs.getString(8)%></td>
	<td><font size="3" color="black"><%=str%></td>
	<%}%>
	</tr>
	</table>
	</body>
</html>