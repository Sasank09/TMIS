<%@page import="java.util.ArrayList"%>
<%@page import="java.io.ObjectOutputStream"%>
<%@page import="java.io.ObjectInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="com.ECC"%>
<%@page import="com.Point"%>
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
protocol </center><center>for cloud-assisted TMIS</center> </span><small></small></h1>
      </div>
    </div>
    <div class="content">
      <div class="content_bg">
        <div class="menu_nav">
         <ul>
            <li class="active"><a href="PatientDataUpload.jsp">Patient Data Upload Phase</a></li>
            <li><a href="CheckupPhase.jsp">Checkup Phase</a></li>
            <li><a href="Logout.jsp">Logout</a></li>
          </ul>
        </div>
        <div class="hbg"><img src="images/header_images.JPG" width="915" height="286" alt="" /></div>
      				<center>

   <h2><b>View Checkup Details Screen</b></h2>
   
	<%
	String res = request.getParameter("t1");
	if(res != null){
		out.println("<center><font face=verdana color=red>"+res+"</center></font>");
	}%>
			<table border="1" align="center" width="100%">
			<tr><th><font size="3" color="black">Patient ID</th><th><font size="3" color="black">Random No</th><th><font size="3" color="black">BP</th>
			<th><font size="3" color="black">Heart Rate</th><th><font size="3" color="black">Problem</th>
			<th><font size="3" color="black">Doctor</th><th><font size="3" color="black">Prescription</th>
			<th><font size="3" color="black">Date & Time</th>
			<tr>
	<%
	String pid = session.getAttribute("user").toString();
	String random = session.getAttribute("random").toString();
	String path = getServletContext().getRealPath("/")+"WEB-INF/patients/"+pid+".txt";
	File file = new File(path);
	if(file.exists()) {
		ECC ecc = new ECC();
		ecc.loadKeys(random,random,random);
		ObjectInputStream oin = new ObjectInputStream(new FileInputStream(file));
		Object obj = (Object)oin.readObject();
		ArrayList<Point[]> list = (ArrayList<Point[]>)obj;
		oin.close();
		for(int i=0;i<list.size();i++){
			Point decrypt = ecc.getKeys().decrypt(list.get(i));
			byte b1[] = decrypt.getX().toByteArray();
			byte b2[] = decrypt.getY().toByteArray();
			String arr[] = new String(b1).split(",");
			String str = DBConnection.getPrescription(pid,i+"");
		%>
	<tr><td><font size="3" color="black"><%=pid%></td>
	<td><font size="3" color="black"><%=random%></td>
	<td><font size="3" color="black"><%=arr[0]%></td>
	<td><font size="3" color="black"><%=arr[1]%></td>
	<td><font size="3" color="black"><%=arr[2]%></td>
	<%if(!str.equals("none")){
			String temp[] = str.split(",");
			%>
	<td><font size="3" color="black"><%=temp[1]%></td>
	<td><font size="3" color="black"><%=temp[0]%></td>
	<td><font size="3" color="black"><%=temp[2]%></td>
	<%}}}%>
	</tr>
	</table>
	</body>
</html>