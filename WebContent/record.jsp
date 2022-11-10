<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Hello</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
  	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>
  </head>
  <body>
  
  <h1>HEADER</h1>
    
    <nav class="navbar navbar-expand-lg bg-light">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="#">Navbar</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarNav">
	      <ul class="navbar-nav">
	        <li class="nav-item">
	          <a class="nav-link" aria-current="page" href="/Assignment1">Home</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="form.html">Add</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link active" href="#">Record</a>
	        </li>
	      </ul>
	    </div>
	  </div>
	</nav>
	<br><br><br>
	
	<sql:setDataSource
        var="myDS"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/assignment1"
        user="root" password="root"
    />
     
    <sql:query var="listUsers"   dataSource="${myDS}">
        SELECT * FROM emp;
    </sql:query>
     
    <div align="center">
    <caption><h2>List of users</h2></caption>
        <table border="1" cellpadding="5">            
            <tr>
            	<th>ID</th>
                <th>Name</th>
                <th>Date</th>
                <th>City</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="user" items="${listUsers.rows}">
                <tr>
                    <td><c:out value="${user.id}" /></td>
                    <td><c:out value="${user.name}" /></td>
                    <td><c:out value="${user.date}" /></td>
                    <td><c:out value="${user.city}" /></td>
                    <td><a href="status.jsp?id=${user.id}">Status</a></td>
                    <td><a href="editform.jsp?id=${user.id}">Edit</a> |
						<a href="deleteuser.jsp?id=${user.id}">Delete</a></td></tr>  
                </tr>
            </c:forEach>
        </table>
    </div>
    
    <footer class="fixed-bottom bg-light text-center text-lg-start">
	  <!-- Copyright -->
	  <div class="text-center p-3">
	    © 2022 Copyright:
	    Rafif Murtadho
	  </div>
	  <!-- Copyright -->
	</footer>

</body>
</html>