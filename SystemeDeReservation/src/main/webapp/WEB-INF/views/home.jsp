<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" href="<%=request.getContextPath() %>/resources/asset/css/bootstrap.css" rel="stylesheet"/>
        <title>Page d'accueil</title>
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
        	<span class="label label-info"><h2>M2 Miage 2013/2014</h2></span><br/><br/>
   			<span class="label label-info"><h2>Projet application web</h2><br/></span><br/><br/>
        	<span class="label label-info"><h2>Mehdi Belhadj Ahmed & Laurent Ehrhart</h2></span><br/><br/>
        	<span class="label label-info"><h2>Enseignant : Sébastien Etter</h2></span><br/><br/>
    </body>
</html>
