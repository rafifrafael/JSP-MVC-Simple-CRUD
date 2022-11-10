package com.info;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Edit
 */
public class Edit extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int uid = Integer.parseInt(request.getParameter ("id"));
		String uname = request.getParameter ("name");
		String uemail = request.getParameter ("email");
		String uaddress = request.getParameter ("address");
		String uphone = request.getParameter ("phone");
		String ucity = request.getParameter ("city");
		String ucountry = request.getParameter ("country");
		String ueducation = request.getParameter ("education");
		
		try {
			
			Connection con = DBConn.initializeDatabase();
			PreparedStatement st = con.prepareStatement("update emp set name=?, email=?, address=?, phone=?, city=?, country=?, education=? where id=?");
			
			st.setString(1, uname);
			st.setString(2, uemail);
			st.setString(3, uaddress);
			st.setString(4, uphone);
			st.setString(5, ucity);
			st.setString(6, ucountry);
			st.setString(7, ueducation);
			st.setInt(8, uid);
			
			st.executeUpdate () ;
			
			st.close();
			con.close();
			// Get a writer pointer
			// to display the successful result
			PrintWriter out = response.getWriter();
			out.println ("<html><body><b>Successfully Updated"	+ "</b></body></html>") ;
			response.sendRedirect("http://localhost:8080/Assignment1/record.jsp");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public static Data getRecordById(int id){  
	    Data d=null;  
	    try{  
	    	Connection con = DBConn.initializeDatabase(); 
	        PreparedStatement ps=con.prepareStatement("select * from emp where id=?");  
	        ps.setInt(1,id);  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	            d=new Data();  
	            d.setId(rs.getInt("id"));
	            d.setName(rs.getString("name"));
	            d.setEmail(rs.getString("email"));
	            d.setAddress(rs.getString("address"));
	            d.setPhone(rs.getString("phone"));
	            d.setCity(rs.getString("city"));	            
	            d.setCountry(rs.getString("country"));
	            d.setEducation(rs.getString("education"));
	        }  
	    }catch(Exception e){System.out.println(e);}  
	    	return d;  
	}  

}
