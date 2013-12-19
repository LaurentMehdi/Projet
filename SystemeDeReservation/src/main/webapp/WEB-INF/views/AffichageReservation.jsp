<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form"  prefix="form" %>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Affichage des réservations</title>
<link type="text/css" href="<%=request.getContextPath() %>/resources/asset/css/bootstrap.css" rel="stylesheet"/>
<link href="<%=request.getContextPath() %>/resources/fullcalendar-1.6.4/fullcalendar/fullcalendar.css" rel="stylesheet" />
<link href="<%=request.getContextPath() %>/resources/fullcalendar-1.6.4//fullcalendar/fullcalendar.print.css" rel="stylesheet" media="print" />
<script src="<%=request.getContextPath() %>/resources/fullcalendar-1.6.4/lib/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/fullcalendar-1.6.4/lib/jquery-ui.custom.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/fullcalendar-1.6.4/fullcalendar/fullcalendar.min.js"></script>


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

	#calendar {
		width: 750px;
		margin: 0 auto;
		}
</style>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="menuReservation.jsp"></jsp:include>
<script>

	$(document).ready(function() {
		var calendar = $('#calendar').fullCalendar({

			 eventClick: function(calEvent, jsEvent, view) {
				 document.forms['form1'].suppr.value = calEvent.id;
				 disabledFunc("SupprimerButton");
				 disabledFunc("ModifierButton");
			    },
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			selectable: true,
			selectHelper: true,
			editable: false,
			
			events: [

						<c:forEach var="reservation" items="${reservations}">
						{
							id: '${reservation.id}',
							title: '${reservation.raisonReservation}',
							start: '${reservation.début}',
							end:  '${reservation.fin}'
						},
						</c:forEach>
						{
							title: '',
							start: new Date(2000, 10, 28),
							end: new Date(2000, 10, 29)
						}
						],
						evenClick: function( event, jsEvent, view ) {
							alert('Event: ' + eve,t.title);
							 $(this).css('border-color', 'red');
							 
							calendar.fullCalendar('unselect');
						}
		});
	});
	function disabledFunc(id)
	{
	    var divObj = document.getElementById(id);
	    divObj.disabled = false;
	}
	function aller()
	{
	var valeur = document.forms['form1'].elements['suppr'].value; // Contient la valeur de l'<input />
	document.location.href = '${pageContext.request.contextPath}/reservation/delete?suppr='+valeur;
	}
	function modifier()
	{
	var valeur = document.forms['form1'].elements['suppr'].value; // Contient la valeur de l'<input />
	document.location.href = '${pageContext.request.contextPath}/reservation/edit?modif='+valeur;
	}
</script>

<form id="form1" name="form1" class="form-horizontal" action="${pageContext.request.contextPath}/reservation/delete" method="POST">
<div id='calendar'></div>
<input type="HIDDEN" id="suppr" name="suppr" path="suppr"/>
<a href="javascript:aller();">
<button id="SupprimerButton" disabled="true" name="SupprimerButton" value="SupprimerButton" class="btn btn-success" type="button" onclick="return confirm('Voulez vous vraiment supprimer ?')" >Suppression</button>
</a>
<form>
<form id="form2" name="form2" class="form-horizontal" action="${pageContext.request.contextPath}/reservation/edit" method="POST">
<a href="javascript:modifier();">
<button id="ModifierButton" disabled="true" name="ModifierButton" value="ModifierButton" class="btn btn-success" type="button" >Modification</button>
</a>
</form>
</body>
</html>