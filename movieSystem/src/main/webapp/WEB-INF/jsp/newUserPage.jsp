<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Form</title>
    <style>
        /* General Body and Layout Styling */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f7fb;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 40%;
            margin: 50px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #4CAF50;
            font-size: 2em;
            margin-bottom: 20px;
        }

        /* Form Elements Styling */
        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-size: 1.1em;
            font-weight: bold;
            color: #333;
            display: block;
            margin-bottom: 8px;
        }

        .form-control {
            width: 100%;
            padding: 12px;
            font-size: 1em;
            border: 1px solid #ddd;
            border-radius: 5px;
            transition: border-color 0.3s ease;
        }

        .form-control:focus {
            border-color: #4CAF50;
            outline: none;
        }

        input[type="password"] {
            font-family: sans-serif;
            letter-spacing: 1px;
        }

        select, input[list] {
            font-size: 1em;
            padding: 12px;
            width: 100%;
            border-radius: 5px;
            border: 1px solid #ddd;
            background-color: #fff;
            cursor: pointer;
        }

        .form-group .datalist {
            font-size: 1em;
        }

        /* Button Styling */
        .button-group {
            text-align: center;
            margin-top: 30px;
        }

        button {
            padding: 12px 25px;
            font-size: 1.1em;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 48%;
            margin: 5px;
            transition: all 0.3s ease;
        }

        .submit-btn {
            background-color: #4CAF50;
            color: white;
        }

        .submit-btn:hover {
            background-color: #45a049;
        }

        .reset-btn {
            background-color: #f44336;
            color: white;
        }

        .reset-btn:hover {
            background-color: #d32f2f;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                width: 90%;
            }
        }
    </style>

    <script type="text/javascript">
        function passwordCheck() {
            var pass1 = (document.getElementById("pass1").value).toString();
            var pass2 = (document.getElementById("pass2").value).toString();
            if(pass1.length < 5 || pass1.length > 10){
                alert("Password length must be between 5 to 10 characters");
                return;
            }
            
            if (pass1 === pass2) {
                document.getElementById("registrationForm").submit();
            } else {
                alert("Passwords do not match!");
            }
        }
    </script>
</head>
<body>

<!-- Main Container -->
<div class="container">
    <h2>Register New User</h2>
    <form:form id="registrationForm" action="/register" method="post" modelAttribute="userRecord">

        <!-- User Id -->
        <div class="form-group">
            <label for="username">Enter New User Id</label>
            <form:input path="username" id="username" class="form-control" />
        </div>

        <!-- Password -->
        <div class="form-group">
            <label for="pass1">Enter New Password</label>
            <form:input type="password" id="pass1" path="password" class="form-control" />
        </div>

        <!-- Confirm Password -->
        <div class="form-group">
            <label for="pass2">Re-type New Password</label>
            <input type="password" id="pass2" class="form-control" />
        </div>

        <!-- Full Name -->
        <div class="form-group">
            <label for="name">Enter User's Full Name</label>
            <form:input path="name" id="name" class="form-control" />
        </div>

        <!-- Email -->
        <div class="form-group">
            <label for="email">Enter Email</label>
            <form:input path="email" id="email" class="form-control" />
        </div>

        <!-- Role Selection -->
        <div class="form-group">
            <label for="role">Select User Role</label>
            <form:input list="types" name="type" id="type" path="role" class="form-control" />
            <datalist id="types">
                <option value="Customer"></option>
                <option value="Admin"></option>
            </datalist>
        </div>

        <!-- Submit and Reset Buttons -->
        <div class="button-group">
            <button type="button" class="submit-btn" onclick="passwordCheck();">Submit</button>
            <button type="reset" class="reset-btn">Reset</button>
        </div>

    </form:form>
</div>

</body>
</html>
