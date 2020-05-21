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
public class PatientDataUpload extends HttpServlet {
public void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
	response.setContentType("text/html");
	PrintWriter out = response.getWriter();
	String pid=request.getParameter("t1");
	String random=request.getParameter("t2");
	String bp=request.getParameter("t3");
	String heart=request.getParameter("t4");
	String problem=request.getParameter("t5");
	try{
		ArrayList<Point[]> list = null;
		String path = getServletContext().getRealPath("/")+"WEB-INF/patients/"+pid+".txt";
		File file = new File(path);
		if(file.exists()) {
			ObjectInputStream oin = new ObjectInputStream(new FileInputStream(file));
			Object obj = (Object)oin.readObject();
			list = (ArrayList<Point[]>)obj;
			oin.close();
		} else {
			list = new ArrayList<Point[]>();
		}
		String data = bp+","+heart+","+problem;
		ECC ecc = new ECC();
		ecc.loadKeys(random,random,random);
		Point plain = new Point(ecc.curve, new BigInteger(data.getBytes()), new BigInteger("kk".getBytes()));
		Point[] cipher = ecc.getKeys().encrypt(plain);
		list.add(cipher);
		ObjectOutputStream oout = new ObjectOutputStream(new FileOutputStream(file));
		oout.writeObject(list);
		oout.close();
		RequestDispatcher rd=request.getRequestDispatcher("PatientDataUpload.jsp?t1=Your data uploaded to cloud inside WEB-INF/patients folder");
		rd.forward(request, response);
	}catch(Exception e){
		e.printStackTrace();
	}
}

}
