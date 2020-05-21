package com;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Calendar;
import java.sql.Statement;
import java.util.ArrayList;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.File;
import org.jfree.ui.RefineryUtilities;
public class DBConnection{
    private static Connection con;
	
public static Connection getCon()throws Exception {
   try{
	   Class.forName("com.mysql.jdbc.Driver");
	   con = DriverManager.getConnection("jdbc:mysql://localhost/tims","root","root");
    }catch(Exception e){
		e.printStackTrace();
	}
	return con;
}
public static String anonymity(String name){
	int length = name.length()-4;
	if(length < 0)
		name = "eeeeeee"+name;
	length = name.length()-4;
	StringBuilder sb = new StringBuilder();
	sb.append(name.substring(0,length));
	sb.append("****");
	return sb.toString();
}

public static String addPhysician(String[] input)throws Exception{
    String msg="fail";
    boolean flag=false;
	int random = 4444;
	con = getCon();
	Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery("select count(*) from adddoctor");
    if(rs.next()){
		random = random + rs.getInt(1);
	}
	random = random + 1;
	stmt=con.createStatement();
    rs=stmt.executeQuery("select username from adddoctor where username='"+input[0]+"'");
    if(rs.next()){
        flag=true;
        msg = "Username already exist";
    }else{
		ECC ecc = new ECC();
		String public_key = ecc.loadKeys(random+"",random+"",random+"");
		PreparedStatement stat=con.prepareStatement("insert into adddoctor values(?,?,?,?,?,?,?,?,?)");
		stat.setString(1,input[0]);
		stat.setString(2,input[1]);
		stat.setString(3,input[2]);
		stat.setString(4,input[3]);
		stat.setString(5,input[4].trim());
		stat.setString(6,input[5].trim());
		stat.setString(7,input[6].trim());
		stat.setString(8,random+"");
		stat.setBytes(9,public_key.getBytes());
		int i=stat.executeUpdate();
		if(i > 0){
			msg = "success,"+random;
		}
    }
    return msg;
}
public static String createProfile(String[] input)throws Exception{
    String msg="fail";
    int pid = 0;
	int random = 1234;
    con = getCon();
	Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery("select count(*) from patientprofile");
    if(rs.next()){
        pid = pid + rs.getInt(1);
    }
	pid = pid + 1;
	random = random + pid;
	ECC ecc = new ECC();
	String public_key = ecc.loadKeys(random+"",random+"",random+"");
	java.util.Date d1 = new java.util.Date(input[1].trim());
	java.sql.Date d2 = new java.sql.Date(d1.getTime());
    PreparedStatement stat=con.prepareStatement("insert into patientprofile values(?,?,?,?,?,?,?,?,?,?,?)");
	stat.setString(1,"PID-"+pid);
	stat.setString(2,input[0]);
    stat.setDate(3,d2);
    stat.setString(4,input[2]);
    stat.setString(5,input[3]);
    stat.setString(6,input[4].trim());
	stat.setString(7,input[5].trim());
	stat.setString(8,input[6].trim());
	stat.setString(9,input[7]);
	stat.setString(10,random+"");
	stat.setBytes(11,public_key.getBytes());
	int i=stat.executeUpdate();
    if(i > 0){
        msg = "success,"+"PID-"+pid+","+random;
	}
    
    return msg;
}

public static String addPrescription(String[] input)throws Exception{
    String msg="no";
    con = getCon();
	java.util.Date d1 = new java.util.Date();
	java.sql.Timestamp d2 = new java.sql.Timestamp(d1.getTime());
    PreparedStatement stat=con.prepareStatement("insert into prescription values(?,?,?,?)");
    stat.setString(1,input[0]);
    stat.setString(2,input[1]);
    stat.setString(3,input[2]);
    stat.setTimestamp(4,d2);
	int i=stat.executeUpdate();
    if(i > 0){
        msg = "success";
	}
    
    return msg;
}


public static String login(String input[])throws Exception{
    String msg="invalid login";
	ECC ecc = new ECC();
	String key = ecc.loadKeys(input[2],input[2],input[2]);
	System.out.println("Generated Random Key : "+key);
    con = getCon();
    Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery("select public_key from adddoctor where username='"+input[0]+"' and password='"+input[1]+"'");
    if(rs.next()){
        String pk = new String(rs.getBytes(1));
		if(pk.equals(key)){
			msg = "success";
			System.out.println("Keys Matched Successfully");
		}
    }
    System.out.println(msg);
    return msg;
}

public static String patientLogin(String pid,String random)throws Exception{
    String msg="invalid login";
	ECC ecc = new ECC();
	String key = ecc.loadKeys(random,random,random);
	System.out.println("Generated Random Key : "+key);
    con = getCon();
    Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery("select public_key from patientprofile where patient_id='"+pid+"'");
    if(rs.next()){
        String pk = new String(rs.getBytes(1));
		if(pk.equals(key)){
			msg = "success";
			System.out.println("Keys Matched Successfully");
		}
    }
    return msg;
}
public static void savePrescription(String pid,String record,String prescription,String doctor)throws Exception{
	con = getCon();
	java.util.Date d1 = new java.util.Date();
	java.sql.Timestamp time = new java.sql.Timestamp(d1.getTime());
	PreparedStatement stat=con.prepareStatement("insert into prescription values(?,?,?,?,?)");
	stat.setString(1,pid);
	stat.setString(2,record);
	stat.setString(3,prescription);
	stat.setString(4,doctor);
	stat.setTimestamp(5,time);
	stat.executeUpdate();
}
public static String getPrescription(String pid,String record)throws Exception{
    String msg="none";
	con = getCon();
    Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery("select prescription,doctor_name,date_time from prescription where patient_id='"+pid+"' and record_no='"+record+"'");
    if(rs.next()){
        msg = rs.getString(1)+","+rs.getString(2)+","+rs.getTimestamp(3).toString();
	}
    return msg;
}
public static String getRandom(String pid)throws Exception{
    String msg="invalid login";
	con = getCon();
    Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery("select random_no from patientprofile where patient_id='"+pid+"'");
    if(rs.next()){
        msg = rs.getString(1);
	}
    return msg;
}
}