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
            <li class="active"><a href="RegisterPatients.jsp">Healthcare Patient Upload Phase</a></li>
            <li><a href="RegisterDoctor.jsp">Register Doctor</a></li>
			<li><a href="ViewPatients.jsp">View Patient Details</a></li>
			<li><a href="ViewDoctors.jsp">View Doctor Details</a></li>

            <li><a href="Logout.jsp">Logout</a></li>
          </ul>
        </div>
        <div class="hbg"><img src="images/header_images.JPG" width="915" height="286" alt="" /></div>
		<%
	String res = request.getParameter("t1");
	if(res != null){
		out.println("<center><font face=verdana color=red>"+res+"</center></font>");
	}%>
       <p align="justify"><font size="3" style="font-family: Comic Sans MS">Abstract-With the fast progress of network communication, its technologies and the developing popularity
of telecare medical information system (TMIS), doctors provide treatment to patients via Internet
without visiting hospitals. By using mobile device, wireless body area network and cloud based
architecture, the patients can gather their physiological information and upload to cloud via their
mobile devices. The authenticated doctor provides online treatment to patient at anytime and
anywhere.</p>
 <p align="justify"><font size="3" style="font-family: Comic Sans MS">Moreover, TMIS maintains security and privacy of the patients in information communication
and authenticated to all the participants before assessing this system. Recently Li
et al. (2018) presented a cloud-assisted authentication and privacy preservation scheme for TMIS.
They believed that their scheme secure against all well-known privacy and security attributes. In
the proposed work, we reviewed Li et al. authentication protocol and found that it has various
security flaws like as message authentication fails in healthcare center upload phase, session key
is not possible in healthcare center upload phase, impersonation attack in patient data upload
phase, patient anonymity and patient unlinkability.</p>
 
  </body>
 
 
  </body>
</html>
