<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form"  prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Création d'une nouvelle réservation</title>
<link href ="<%=request.getContextPath() %>/resources/asset/css/bootstrap.css" rel="stylesheet" media = "screen"/>
<link href ="<%=request.getContextPath() %>/resources/datepicker/css/datepicker.css" rel="stylesheet" media = "screen"/>  
 <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
 <link href ="<%=request.getContextPath() %>/resources/datepicker/js/bootstrap-datepicker.js" rel="stylesheet" media = "screen"/>
 <link href ="<%=request.getContextPath() %>/resources/datepicker/less/datepicker.less" rel="stylesheet" media = "screen"/>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
 <link href="<%=request.getContextPath() %>/resources/select/select2.css" rel="stylesheet"/>
<script src="<%=request.getContextPath() %>/resources/select/select2.js"></script>
<script>
$(document).ready(function() { $("#choix_voiture").select2(); });
$(document).ready(function() { $("#choix_employe").select2(); });
</script>
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
		
		message {
		color: red
		}
</style>
  </head>
  <body>

   <jsp:include page="header.jsp"></jsp:include>
<jsp:include page="menuReservation.jsp"></jsp:include>
  <page>
<form:form id="form1" name="form1" modelAttribute="reservation" action="${pageContext.request.contextPath}/reservation/add/process" method="post">
<fieldset>

<!-- Form Name -->
<div class="hero-unit">
		<h1>Création d'une nouvelle réservation</h1>
</div>

 <message> ${message} </message>
<!-- Text input-->
<div class="control-group">
  <label class="control-label" for="NomEmploye">Employé</label>
  <form:errors cssClass="error" path="employe"></form:errors>
  <div class="controls">
    <form:select id="choix_employe" name="choix_employe" class="input-xlarge" path="employe">
     <c:forEach var="employe" items="${employes}">
          <form:option id="${employe.id}" value="${employe.id}">${employe.nom} ${employe.prenom}</form:option>
    </c:forEach>
    </form:select>
    
  </div>
</div>

<!-- Text input-->
<div class="control-group">
  <label class="control-label" for="ImmaVoiture">Voiture</label>
   <form:errors cssClass="error" path="voiture"></form:errors>
  <div class="controls">
  
    <form:select id="choix_voiture" name="choix_voiture" class="input-xlarge" path="voiture">
    <c:forEach var="voiture" items="${voitures}">
          <form:option id="${voiture.id}" value="${voiture.id}">${voiture.marque} ${voiture.modele} ${voiture.immatriculation}</form:option>
    </c:forEach>
    </form:select>
   
  </div>
</div>

<div class="control-group">
  <label class="control-label" for="début">Début de la réservation</label>
  <div class="controls">                     
    <input id="début" placeholder="Début réservation" path="début" name="début" type="text" class="datepicker"></input>
    
  </div>
</div>

<!-- Text -->
<div class="control-group">
  <label class="control-label" for="fin">Fin de la réservation</label>
  <div class="controls">                     
    <input id="fin" placeholder="Fin réservation" name="fin" path="fin"  type="text" class="datepicker"></input>
    
  </div>
</div>

<!-- Text -->
<div class="control-group">
  <label class="control-label" for="RaisonRervation">Raison de la réservation</label>
    <form:errors cssClass="error" path="raisonReservation"></form:errors>
  <div class="controls">                     
    <form:input id="RaisonRervation" placeholder="Raison réservation" name="RaisonRervation" path="raisonReservation" type="text"></form:input>
    
  </div>
</div>

<!-- Button (Double) -->
<div class="control-group">
  <label class="control-label" for="OkBouton"></label>
  <div class="controls">

  <form:button id="ValiderButton" name="ValiderButton" value="ValiderButton" class="btn btn-success" type="submit" path="" >Valider</form:button>
    <a href="${pageContext.request.contextPath}/reservation/list">
    <form:button id="AnnulerButton" name="AnnulerButton" value="AnnulerButton" class="btn btn-danger" type="button" path="">Annuler</form:button>
    </a>
  </div>
</div>

</fieldset>
</form:form>  
</page>
  
     <script>
    $('#début.datepicker').datepicker({
        onSelect: function(dateText, inst) { 
        	
            var date =  $('#début').datepicker('getDate')
                day  = date.getDate(),  
                month = date.getMonth(),    
                year =  date.getFullYear();
        }
      });
    $('#fin.datepicker').datepicker({
        onSelect: function(dateText, inst) { 
        	
            var date =  $('#fin').datepicker('getDate'),
                day  = date.getDate(),  
                month = date.getMonth(),    
                year =  date.getFullYear();
        }
      });
    </script>
 
  </body>
  </html>