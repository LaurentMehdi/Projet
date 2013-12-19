<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form"  prefix="form" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Modifier une voiture</title>
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
<jsp:include page="menuVoiture.jsp"></jsp:include>
<page>
<form:form method="POST" modelAttribute="voiture" action="${pageContext.request.contextPath}/voiture/edit/${voiture.id}">
<fieldset>

<div class="hero-unit">
		<h1>Modification d'une voiture</h1>
</div>

<!-- Text input-->
<div class="control-group">
  <label class="control-label" for="MarqueVehicule">Marque</label>
      <form:errors cssClass="error" path="marque"></form:errors>
  <div class="controls">
    <form:input id="MarqueVehicule" name="MarqueVehicule" placeholder="Marque" class="input-xlarge" type="text" path="marque" />
  </div>
</div>

<!-- Text input-->
<div class="control-group">
  <label class="control-label" for="ModeleVehicule">Modèle</label>
      <form:errors cssClass="error" path="modele"></form:errors>
  <div class="controls">
    <form:input id="ModeleVehicule" name="ModeleVehicule" placeholder="Modèle" class="input-xlarge" type="text" path="modele"/>
  </div>
</div>

<!-- Text input-->
<div class="control-group">
  <label class="control-label" for="AnneeVehicule">Année</label>
       <form:errors cssClass="error" path="annee"></form:errors>
  <div class="controls">
    <form:input id="AnneeVehicule" name="AnneeVehicule" placeholder="Année" class="input-xlarge" type="text" path="annee" />
  </div>
</div>

<!-- Text input-->
<div class="control-group">
  <label class="control-label" for="ImmatriculationVehicule">Immatriculation</label>
  <div class="controls">
    <form:input  readonly="true" id="ImmatriculationVehicule" name="ImmatriculationVehicule" placeholder="Immatriculation" class="input-xlarge" type="text" path="immatriculation"/>
    <form:errors cssClass="error" path="immatriculation"></form:errors>
  </div>
</div>

<!-- Button (Double) -->
<div class="control-group">
  <label class="control-label" for="ValiderButton"></label>
  <div class="controls">
    <form:button id="ValiderButton" name="ValiderButton" class="btn btn-success" type="submit" path="">Valider</form:button>
    <a href="${pageContext.request.contextPath}/voiture/list">
    <form:button id="AnnulerButton" name="AnnulerButton" class="btn btn-danger" type="button" path="">Annuler</form:button>
    </a>
  </div>
</div>

</fieldset>
</form:form>
</page>
</body>
</html>