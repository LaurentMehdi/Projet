
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form"  prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link type="text/css" href="<%=request.getContextPath() %>/resources/asset/css/bootstrap.css" rel="stylesheet"/>
<title>Liste des employés</title>
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
<jsp:include page="menuemploye.jsp"></jsp:include>
<c:if test="${!empty messages}">
<span class="label label-warning"><h2>${messages}</h2></span>
</c:if>
<div class="container">
	<div class="row">
        <div class="span12">
    		<ul class="thumbnails">
    		<c:forEach var="employe" items="${employes}">
                <li class="clearfix">
               
                  <div class="thumbnail clearfix">
                    <table>
                     <tr>
                    <div class="caption" class="pull-left">
                        <td>
	                    		<h4>                          
	                    			<input type="hidden" value=${employe.id}/>  
	                      			<a href="#" >${employe.prenom} ${employe.nom}</a>
	                    		</h4>
                    	</td>
                     	<td>		
                   			<a href="${pageContext.request.contextPath}/employe/edit/${employe.id}" class="btn btn-primary icon  pull-right btn-block">Modifier</a>
                    	</td>
                     </tr>	
                     <tr>
                     	<td/>
                     		<td>
                    		 <a href="${pageContext.request.contextPath}/employe/delete/${employe.id}" class="btn btn-primary icon  pull-right btn-block" onclick="return confirm('Voulez vous vraiment supprimer ?')" >Supprimer</a>
                     		</td>
                     
                    </div>
                    </tr>		
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