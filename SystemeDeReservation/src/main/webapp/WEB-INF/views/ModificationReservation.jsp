<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form"  prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Liste des reservations</title>
<link href ="<%=request.getContextPath() %>/resources/asset/css/bootstrap.css" rel="stylesheet" media = "screen"/>
<link href ="<%=request.getContextPath() %>/resources/datepicker/css/datepicker.css" rel="stylesheet" media = "screen"/>  
 <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
 <link href ="<%=request.getContextPath() %>/resources/datepicker/js/bootstrap-datepicker.js" rel="stylesheet" media = "screen"/>
 <link href ="<%=request.getContextPath() %>/resources/datepicker/less/datepicker.less" rel="stylesheet" media = "screen"/>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
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
<jsp:include page="menuReservation.jsp"></jsp:include>
<page>
<form:form id="form1" name="form1" modelAttribute="reservation" action="${pageContext.request.contextPath}/reservation/edit/${reservation.id}" method="post">
<fieldset>

<!-- Form Name -->
<legend>Modification d'une réservation</legend>

<!-- Text input-->
<div class="control-group">
  <label class="control-label" for="NomEmploye">Employé</label>
  <form:errors cssClass="error" path="employe"></form:errors>
  <div class="controls">
    <form:select id="choix" name="choix" class="input-xlarge" path="employe">
    <c:forEach var="employen" items="${employes}">
          <form:option id="${employen.id}" value="${employen.id}">${employen.nom}-${employen.prenom}</form:option>
    </c:forEach>
    </form:select>
    
  </div>
</div>

<!-- Text input-->
<div class="control-group">
  <label class="control-label" for="ImmaVoiture">Voiture</label>
   <form:errors cssClass="error" path="voiture"></form:errors>
  <div class="controls">
  
    <form:select id="choix" name="choix" class="input-xlarge" path="voiture">
    <c:forEach var="voituren" items="${voitures}">
          <form:option id="${voituren.id}" value="${voituren.id}">${voituren.marque}-${voituren.modele}</form:option>
    </c:forEach>
    </form:select>
   
  </div>
</div>

<div class="control-group">
  <label class="control-label" for="DebutReservation">Début réservation</label>
    <form:errors cssClass="error" path="jour"></form:errors>
  <div class="controls">
  <input id="DebutReservation" name="DebutReservation" type="text" class="datepicker"/>
    </div>
   </div>


<!-- Text input-->
<div class="control-group">
  <label class="control-label" for="FinReservation">Fin réservation</label>
  <form:errors cssClass="error" path="jourf"></form:errors>
  <div class="controls">
  <input id="FinReservation" name="FinReservation" type="text" class="datepicker"/>
    </div>
   </div>

<!-- Text -->
<div class="control-group">
  <label class="control-label" for="RaisonRervation">Raison de la réservation</label>
  <form:errors cssClass="error" path="raisonReservation"></form:errors>
  <div class="controls">                     
    <form:input id="RaisonRervation" name="RaisonRervation" placeholder=""  path="raisonReservation" type="text"></form:input>
    
  </div>
</div>


<div class="control-group">
  <label class="control-label" for="anneedebutreservation"/>
  <div class="controls">   
<form:input type="hidden" id="anneeR1" path="annee"/>
 </div>
</div>


<div class="control-group">
  <label class="control-label" for="anneedebutreservation"/>
  <div class="controls">   
<form:input type="hidden" id="anneefR1" path="anneef"/>
 </div>
</div>


<div class="control-group">
  <label class="control-label" for="anneedebutreservation"/>
  <div class="controls">   
<form:input type="hidden" id="moisR1" path="mois"/>
 </div>
</div>

<div class="control-group">
  <label class="control-label" for="anneedebutreservation"/>
  <div class="controls">   
<form:input type="hidden" id="moisfR1" path="moisf"/>
 </div>
</div>


<div class="control-group">
  <label class="control-label" for="anneedebutreservation"/>
  <div class="controls">   
<form:input type="hidden" id="jourR1" path="jour"/>
 </div>
</div>


<div class="control-group">
  <label class="control-label" for="anneedebutreservation"/>
  <div class="controls">   
<form:input type="hidden" id="jourfR1" path="jourf"/>
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
    $('#DebutReservation.datepicker').datepicker({
   
        onSelect: function(dateText, inst) { 
        	
            var date =  $('#DebutReservation').datepicker('getDate'),
                day  = date.getDate(),  
                month = date.getMonth(),    
                year =  date.getFullYear();
            	document.forms['form1'].jourR1.value = day;
            	document.forms['form1'].moisR1.value = month;
            	document.forms['form1'].anneeR1.value = year;
        }
      });
    $('#FinReservation.datepicker').datepicker({
    	
        onSelect: function(dateText, inst) { 
        	
            var date =  $('#FinReservation').datepicker('getDate'),
                day  = date.getDate(),  
                month = date.getMonth(),    
                year =  date.getFullYear();
           		document.forms['form1'].jourfR1.value = day;
           		document.forms['form1'].moisfR1.value = month;
           		document.forms['form1'].anneefR1.value = year;
        }
      });
    </script>
   
  </body>
  </html>