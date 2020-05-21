package com;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.io.File;
import java.io.ObjectOutputStream;
import java.io.ObjectInputStream;
import java.io.FileOutputStream;
import java.io.FileInputStream;
import java.math.BigInteger;
public class Prescription extends HttpServlet {
public void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
	response.setContentType("text/html");
	PrintWriter out = response.getWriter();
	String record=request.getParameter("t1").trim();
	String pid=request.getParameter("t2");
	String prescription=request.getParameter("t3");
	try{
		HttpSession session=request.getSession();
		String doctor = session.getAttribute("user").toString().trim(); 
		String random = DBConnection.getRandom(pid);
		DBConnection.savePrescription(pid,record,prescription,doctor);
		RequestDispatcher rd=request.getRequestDispatcher("Treatment.jsp?t1=Prescription uploaded to cloud inside WEB-INF/patients folder");
		rd.forward(request, response);
	}catch(Exception e){
		e.printStackTrace();
	}
}

}
