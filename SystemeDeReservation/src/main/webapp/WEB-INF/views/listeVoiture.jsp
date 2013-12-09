
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form"  prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link type="text/css" href="<%=request.getContextPath() %>/resources/asset/css/bootstrap.css" rel="stylesheet"/>
<title>Liste des voitures</title>
</head>
<style>
.error{
color: red
}

body {
		margin-top: 40px;
		text-align: center;
		font-size: 14px;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		}

	page {
		width: 900px;
		margin: 0 auto;
		}
</style>
<body>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="menuVoiture.jsp"></jsp:include>
<div class="container">
	<div class="row">
        <div class="span12">
    		<ul class="thumbnails">
    		<c:forEach var="voiture" items="${voitures}">
                <li class="clearfix">
                  <div class="thumbnail clearfix">
                    <table>
                    	<tr>
                    	<div class="caption" class="pull-left">
	                    		  
	                    			<td>                        
	                    			<input type="hidden" value=${voiture.id}/>  
	                    			<h4>
	                      			${voiture.marque}  
	                      			${voiture.modele}
	                      			</h4>
	                    			</td>
	                    			<td>		
		                   			<a href="${pageContext.request.contextPath}/voiture/edit/${voiture.id}" class="btn btn-primary icon  pull-right">Editer</a>                    		
		                    		</td>
                   		 </tr>
                   		 <tr>
	                    			<td>
	                    			<h4>
	                      			Immatriculation : ${voiture.immatriculation}
	                      			</h4>
	                      			</td>
	                      			<td>
		                    		<a href="${pageContext.request.contextPath}/voiture/delete/${voiture.id}" class="btn btn-primary icon  pull-right">Supprimer</a>
		                     		</td>
                    	 </tr>
                    </div>            		
                    </table>
                  </div>
                </li>
                </c:forEach>
            </ul>
        </div>
	</div>
</div>
</body>
</html>