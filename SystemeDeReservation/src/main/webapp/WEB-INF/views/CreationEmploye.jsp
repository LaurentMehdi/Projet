<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form"  prefix="form" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Créer un nouvel employé</title>
<link type="text/css" href="<%=request.getContextPath() %>/resources/asset/css/bootstrap.css" rel="stylesheet"/>
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
		text-align : center;
		margin: 0 auto;
		}
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="menuemploye.jsp"></jsp:include>
<page>
<form:form method="POST" modelAttribute="employe" action="${pageContext.request.contextPath}/employe/add/process">
<fieldset>

<!-- Form Name -->
<div class="hero-unit">
		<h1>Création d'un nouvel employé</h1>
</div>

<!-- Text input-->
<div class="control-group">
  <label class="control-label" for="NomEmploye">Nom</label>
  <form:errors cssClass="error" path="nom"></form:errors>
  <div class="controls">
    <form:input id="NomEmploye" name="NomEmploye" placeholder="" class="input-xlarge" type="text" path="nom"/>
  </div>
</div>

<!-- Text input-->
<div class="control-group">
  <label class="control-label" for="PrenomEmploye">Prénom</label>
   <form:errors cssClass="error" path="prenom"></form:errors>
  <div class="controls">
    <form:input id="PrenomEmploye" name="PrenomEmploye" placeholder="" class="input-xlarge" type="text" path="prenom"/>
  </div>
</div>

<!-- Text input-->
<div class="control-group">
  <label class="control-label" for="AgeEmploye">Age</label>
   <form:errors cssClass="error" path="age"></form:errors>
  <div class="controls">
    <form:input id="AgeEmploye" name="AgeEmploye" placeholder="" class="input-xlarge" type="text" path="age"/>
  </div>
</div>

<!-- Text input-->
<div class="control-group">
  <label class="control-label" for="TelEmploye">Téléphone</label>
  <form:errors cssClass="error" path="tel"></form:errors>
  <div class="controls">
    <form:input id="TelEmploye" name="TelEmploye" placeholder="" class="input-xlarge" type="text" path="tel"/>
  </div>
</div>

<!-- Text input-->
<div class="control-group">
  <label class="control-label" for="MailEmploye">E-Mail</label>
   <form:errors cssClass="error" path="mail"></form:errors>
  <div class="controls">
    <form:input id="MailEmploye" name="MailEmploye" placeholder="" class="input-xlarge" type="text" path="mail"/>
  </div>
</div>

<!-- Multiple Radios (inline) -->
<div class="control-group">
  <label class="control-label" for="SexRadio">Sexe</label>
  <form:errors cssClass="error" path="sexe"></form:errors>
  <div class="controls">
    <label class="radio inline" for="SexRadio-0">
	<form:radiobutton value="Homme" path="sexe"/>
      Homme
    </label>
    <label class="radio inline" for="SexRadio-1">
      <form:radiobutton value="Femme" path="sexe"/>
      Femme
    </label>
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