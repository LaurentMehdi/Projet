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

	page {
		width: 900px;
		margin: 0 auto;
		}
</style>
<body>
  <ul class="nav nav-tabs">
    			<li><a href="${pageContext.request.contextPath}">Accueil</a></li>  
    			<li><a href="${pageContext.request.contextPath}/employe/list">Employés</a></li>
    			<li><a href="${pageContext.request.contextPath}/voiture/list">Voitures</a></li>
    			<li><a href="${pageContext.request.contextPath}/reservation/list">Réservations</a></li>
 </ul>



</body>
</html>