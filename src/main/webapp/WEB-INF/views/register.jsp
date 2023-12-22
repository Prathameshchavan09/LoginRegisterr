<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page isELIgnored="false"%>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <%@include file="./config.jsp"%>
    <title>Registration</title>
</head>
<body>
    <div class="container mt-3">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <h1 class="text-center mb-3">Registration Form</h1>
                <form action="registerProcess" method="POST" id="registrationForm">
                
                <c:if test="${not empty Register}">
						<strong>${Register}</strong>
						
				</c:if>		
					
                
                    <div class="form-group">
                        <label for="inputName">Name</label>
                        <input name="name" type="text" class="form-control" id="inputName" placeholder="Name" required>
                    </div>
                    <div class="form-group">
                        <label for="inputCity">City</label>
                        <input name="city" type="text" class="form-control" id="inputCity" placeholder="City" required>
                    </div>
                    <div class="form-group">
                        <label for="inputContact">Contact</label>
                        <input name="contact" type="text" class="form-control" id="inputContact" placeholder="Contact" required>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword">Password</label>
                        <input name="password" type="password" class="form-control" id="inputPassword" placeholder="Password" required>
                    </div>
                    <div class="container text-center">
                        <input type="submit" id="registeredAlert" class="btn btn-primary" value="Submit" />
                    </div>
                </form>
                <a href="login" class="btn btn-outline-danger" id="HideShow" style="display: none">Login</a>
            </div>
        </div>
    </div>

    <script>
    
    document.addEventListener("DOMContentLoaded", function() {
        var hideShow = document.getElementById("HideShow");
        if (sessionStorage.getItem("formSubmitted")) {
            hideShow.style.display = "block";
            hideShow.style.marginLeft = "235px";
            hideShow.style.marginTop = "10px";
            hideShow.style.width = "70px";
        }
    });
    
    
    
        document.getElementById("registrationForm").addEventListener("submit", function(event) {
            var name = document.getElementById("inputName").value;
            var city = document.getElementById("inputCity").value;
            var contact = document.getElementById("inputContact").value;
            var password = document.getElementById("inputPassword").value;

            if (name === '' || city === '' || contact === '' || password === '') {
                alert("Fill in all details");
            } else {
                alert("The form has been submitted.");
                sessionStorage.setItem("formSubmitted", "true");
                location.reload();
                var hideShow = document.getElementById("HideShow");
                hideShow.style.display = "block";
                hideShow.style.marginLeft = "235px";
                hideShow.style.marginTop = "10px";
                hideShow.style.width = "70px";
            }
        });
    </script>
</body>
</html>
