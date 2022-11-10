package com.info;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class Servlet3
 */
@MultipartConfig(maxFileSize = 16177216)//1.5mb
public class Insert extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		
		// getting request value from form page -3
		String uname = request.getParameter ("name");
		String udate = dateFormat.format(date);
		String uemail = request.getParameter ("email");
		String uaddress = request.getParameter ("address");
		String uphone = request.getParameter ("phone");
		String ucity = request.getParameter ("city");
		String ucountry = request.getParameter ("country");
		String ueducation = request.getParameter ("education");
		Part uphoto = request.getPart("photo");
		
		// Print All Values
		response.setContentType ("text/html") ;
		PrintWriter writer = response.getWriter();
		writer.println("<br><br><br><hl>");
		writer.println("Name : "+uname);
		writer.println("<br><br>");
		writer.println("Email : "+uemail);
		writer.println ("<br><br>");
		writer.println("Address : "+uaddress);
		writer.println("<br><br>");
		writer.println("Phone : "+uphone);
		writer.println("<br><br>");
		writer.println("city : "+ucity);
		writer.println("<br><br>");
		writer.println("Country : "+ucountry);
		writer.println("<br><br>");
		writer.println("Education : "+ueducation);
		writer.println("<br><br></hl>");
		
		try {
			// Initialize the database
			Connection con = DBConn.initializeDatabase();
			// Create a SQL query to insert data into demo table
			// demo table consists of two columns, so two '?' is used
			PreparedStatement st = con.prepareStatement ("insert into emp (name, date, email, address, phone, city, country, education, photo)"
					+ " values(?, ?, ?, ?, ?, ?, ?, ?, ?)");

			// For the first parameter,
			// get the data using request object
			// sets the data to st pointer
			st.setString(1, uname);
			st.setString(2, udate);
			st.setString(3, uemail);
			st.setString(4, uaddress);
			st.setString(5, uphone);
			st.setString(6, ucity);
			st.setString(7, ucountry);
			st.setString(8, ueducation);
			InputStream is = uphoto.getInputStream();
			st.setBlob(9, is);
			// Execute the insert command using executeUpdate ()
			// to make changes in database
			st.executeUpdate () ;
			// Close all the connections
			st.close();
			con.close();
			// Get a writer pointer
			// to display the successful result
			PrintWriter out = response.getWriter();
			out.println ("<html><body><b>Successfully Inserted"	+ "</b></body></html>") ;
			response.sendRedirect("http://localhost:8080/Assignment1/");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
