<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link type="text/css" href="<%=request.getContextPath() %>/resources/asset/css/bootstrap.css" rel="stylesheet"/>
<title></title>
</head>
<style>
.error{
color: red
}

</style>
<body>
  <ul class="nav nav-tabs">
    			<li><a href="${pageContext.request.contextPath}/employe/list">Liste des employés</a></li> 
    			<li><a href="${pageContext.request.contextPath}/employe/add">Création</a></li>
 </ul>



</body>
</html>