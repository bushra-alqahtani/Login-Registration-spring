 
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
  	<div class="container m-5">
  

  	
		<c:if test="${sessionScope.user_id != null }">
			<div class="row">
				<div class="col">
					<h1 class="text-center" style="color:orange;"> welcome <c:out value="${username}"/> </h1>
				</div>  	
				<div class="col">
			  	  	
		        		<a href="/logout"><input  type="submit" class="btn btn-info" value="Logout" /></a>
		    		
				</div>
		</div>
		</c:if>
		<c:if test="${sessionScope.user_id == null }">
		<h1 class="text-center"> you need to log in or register in our record </h1>
		</c:if>
	
	

</div>
</body>
</html>


  