<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form"  prefix="form" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Modifier un employé</title>
<link href ="<%=request.getContextPath() %>/resources/asset/css/bootstrap.css" rel="stylesheet" media = "screen">
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
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="menuemploye.jsp"></jsp:include>
<page>
<form:form method="POST" modelAttribute="employe" action="${pageContext.request.contextPath}/employe/edit/${employe.id}">
<fieldset>

<!-- Form Name -->
<div class="hero-unit">
		<h1>Modification d'un employé</h1>
</div>

<!-- Text input-->
<div class="control-group">
  <label class="control-label" for="NomEmploye">Nom</label>
  <form:errors cssClass="error" path="nom"></form:errors>
  <div class="controls">
    <form:input id="NomEmploye" name="NomEmploye" placeholder="Nom" class="input-xlarge" type="text" path="nom"/>
  </div>
</div>

<!-- Text input-->
<div class="control-group">
  <label class="control-label" for="PrenomEmploye">Prénom</label>
  <form:errors cssClass="error" path="prenom"></form:errors>
  <div class="controls">
    <form:input id="PrenomEmploye" name="PrenomEmploye" placeholder="Prénom" class="input-xlarge" type="text" path="prenom"/>
  </div>
</div>

<!-- Text input-->
<div class="control-group">
  <label class="control-label" for="AgeEmploye">Age</label>
  <form:errors cssClass="error" path="age"></form:errors>
  <div class="controls">
    <form:input id="AgeEmploye" name="AgeEmploye" placeholder="Age" class="input-xlarge" type="text" path="age"/>   
  </div>
</div>

<!-- Text input-->
<div class="control-group">
  <label class="control-label" for="TelEmploye">Téléphone</label>
      <form:errors cssClass="error" path="tel"></form:errors>
  <div class="controls">
    <form:input id="TelEmploye" name="TelEmploye" placeholder="Téléphone" class="input-xlarge" type="text" path="tel"/>
  </div>
</div>

<!-- Text input-->
<div class="control-group">
  <label class="control-label" for="MailEmploye">E-Mail</label>
      <form:errors cssClass="error" path="mail"></form:errors>
  <div class="controls">
    <form:input id="MailEmploye" name="MailEmploye" placeholder="E-mail" class="input-xlarge" type="text" path="mail"/>

  </div>
</div>

<!-- Text input -->
<div class="control-group">
  <label class="control-label" for="SexeEmploye">Sexe</label>
  <div class="controls">
    <form:input readonly="true" id="SexeEmploye" name="SexeEmploye" placeholder="" class="input-xlarge" type="text" path="sexe"/>
    <form:errors cssClass="error" path="sexe"></form:errors>
  </div>
</div>

<!-- Button (Double) -->
<div class="control-group">
  <label class="control-label" for="ValiderButton"></label>
  <div class="controls">
     <form:button id="ValiderButton" name="ValiderButton" value="ValiderButton" class="btn btn-success" type="submit" path="" >Valider</form:button>
    <a href="${pageContext.request.contextPath}/employe/list">
    <form:button id="AnnulerButton" name="AnnulerButton" value="AnnulerButton" class="btn btn-danger" type="button" path="">Annuler</form:button>
    </a>
  </div>
</div>

</fieldset>
</form:form>
</page>
</body>
</html>