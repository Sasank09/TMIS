package com;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RegisterDoctor extends HttpServlet {
public void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
	response.setContentType("text/html");
	HttpSession session=request.getSession();
	PrintWriter out = response.getWriter();
	String user=request.getParameter("t1");
	String pass=request.getParameter("t2");
	String type=request.getParameter("t3");
	String contact=request.getParameter("t4");
	String address=request.getParameter("t5");
	String qualification=request.getParameter("t6");
	String speciality=request.getParameter("t7");
	try{
		String input[]={user,pass,type,contact,address,qualification,speciality};
		String msg=DBConnection.addPhysician(input);
		if(!msg.equals("fail")){
			String arr[] = msg.split(",");
			session.setAttribute("user",user);
			RequestDispatcher rd=request.getRequestDispatcher("AdminScreen.jsp?t1=Physician details added successfully.<br/>Generated Random No : "+arr[1]);
			rd.forward(request, response);
		}
		else{
			response.sendRedirect("AdminScreen.jsp?t1="+msg);
		}
	

	}catch(Exception e){
		e.printStackTrace();
	}
	}

}
