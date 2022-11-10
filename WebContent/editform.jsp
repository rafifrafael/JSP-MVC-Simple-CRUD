<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
  <%@page import="com.info.Edit, com.info.Data"%>  
  
  
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
	          <a class="nav-link" href="record.jsp">Record</a>
	        </li>
	      </ul>
	    </div>
	  </div>
	</nav>
	<br><br><br>
	
	<%  
		String id=request.getParameter("id");  
		Data d=Edit.getRecordById(Integer.parseInt(id));  
	%>
	
	<h2 align="center">Edit Data</h2>
	
	<form action="./edit" method="post">
		<div class="container">
		
			<input type=hidden name="id" value="<%=d.getId() %>">
			
			<div class="mb-3">
				<label for="name" class="form-label">Name</label>
				<input type="text" class="form-control" id="name" name="name" value="<%=d.getName() %>">
			</div>
			
			<div class="mb-3">
				<label for="email" class="form-label">Email</label>
				<input type="text" class="form-control" id="email" name="email" value="<%=d.getEmail() %>">
			</div>
			
			<div class="mb-3">	
				<label for="address" class="form-label">Address</label>
				<input type="text" class="form-control" id="address" name="address" value="<%=d.getAddress() %>">
			</div>
			
			<div class="mb-3">
				<label for="phone" class="form-label">Phone</label>
				<input type="text" class="form-control" id="phone" name="phone" value="<%=d.getPhone() %>">
			</div>
			
			<div class="mb-3">
				<label for="city" class="form-label">City</label>
				<input type="text" class="form-control" id="city" name="city" value="<%=d.getCity() %>"">
			</div>
			
			<div class="mb-3">
				<label for="country" class="form-label">Country</label>
				<input type="text" class="form-control" id="country" name="country" value="<%=d.getCountry() %>">
			</div>
			
			<div class="mb-3">
				<label for="education" class="form-label">Education</label>
				<input type="text" class="form-control" id="education" name="education" value="<%=d.getEducation() %>">
			</div>
			
			<div class="mb-3">
				<input type="submit" class="btn btn-primary" value="Submit">
			</div>
		</div>
	</form>
	
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