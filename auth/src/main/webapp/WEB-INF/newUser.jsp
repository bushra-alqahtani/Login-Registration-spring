 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
 <!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
  </head>
  <body>
  <div class="container m-5 text-center">
  <div class= "row">
 	<div class="col">
  <h1>Register</h1>
<form:form action="/register" method="post" modelAttribute="newUser">
    <p>
        <form:label path="username">username :</form:label><br>
        <form:input path="username"/><br>
        <form:errors path="username"/>
    </p> 
    <p>
        <form:label path="email">email :</form:label><br>
        <form:input path="email"/><br>
        <form:errors path="email"/>
    </p>
       <p>
        <form:label path="password" type="password">password :</form:label><br> 
        <form:input path="password" type="password"/><br>
        <form:errors path="password"/>
    </p>
      
    <p>
        <form:label path="conf" type="password">confpassword :</form:label><br>
        <form:input path="conf" type="password"/><br>
        <form:errors path="conf"/>
    </p>
      
    <input type="submit" value="Register"/>
    
</form:form>
</div> 
	<div class="col">
	<h1>LogIn</h1>
<form:form action="/login" method="post" modelAttribute="userLogin">

    <p>
        <form:label path="email">email :</form:label><br>
        <form:input path="email"/><br>
        <form:errors path="email"/>
    </p>
       <p>
        <form:label path="password" type="password">password :</form:label><br> 
        <form:input path="password" type="password"/><br>
        <form:errors path="password"/>
    </p>
      

    <input type="submit" value="Login"/>
    
</form:form>
	
	
	</div>
</div>
 

</div>

</body>
</html>


  