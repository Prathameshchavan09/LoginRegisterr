<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="./config.jsp"%>
<%@ page isELIgnored="false"%>

<title>Login Form</title>
</head>
<body>

	<div class="container mt-3">

		<div class="row">

			<div class="col-md-6 offset-md-3">
				<h1 class="text-center mb-3 ">Registration Form</h1>
				
					<c:if test="${not empty successMessage}">
						<strong>${successMessage}</strong>
					
					
				</c:if>
				<c:if test="${not empty loginError}">
						<strong>${loginError}</strong>
					
				</c:if>

				

				<form action="LoginProcess" method="POST" id="loginForm">

					<div class="form-group">
						<label for="exampleInputEmail1">Name</label> <input name="name"
							type="text" class="form-control" id="exampleInputEmail1"
							aria-describedby="emailHelp" placeholder="name" required>

					</div>



					<div class="form-group">
						<label for="exampleInputEmail1">Password</label> <input
							name="password" type="text" class="form-control"
							id="exampleInputEmail1" aria-describedby="emailHelp"
							placeholder="password" required>
					</div>

					<div class="container text-center">

						<input type="submit" class="btn btn-primary" value="submit" />
					</div>




				</form>

			

			</div>
		</div>
	</div>
	
</body>
</html>