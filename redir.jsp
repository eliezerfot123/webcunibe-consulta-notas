<%@page contentType="text/html" %>
<%
String cedula = request.getParameter("cedula");
String periodo = request.getParameter("periodoacademico");
String consulta = request.getParameter("consulta");
String destino = null;
if (consulta.equals("nuevaconsulta")) {
	destino = "index.html";
} else if (consulta.equals("datosperosnales")) {
	destino = "datper.jsp?cedula="+cedula+"&periodoacademico="+periodo;
} else if (consulta.equals("cortedenotas")) {
	//destino = "cornot.html?cedula="+cedula+"&periodoacademico="+periodo;
	destino = "cornot.jsp?cedula="+cedula+"&periodoacademico="+periodo;
} else if (consulta.equals("registroacademico")) {
	destino = "regaca.jsp?cedula="+cedula+"&periodoacademico="+periodo;
} else if (consulta.equals("informaciondeegresados")) {
	destino = "infegr.jsp?cedula="+cedula+"&periodoacademico="+periodo;
} else if (consulta.equals("pagosdecuotas")) {
	destino = "pagsem.jsp?cedula="+cedula+"&periodoacademico="+periodo;
}
response.sendRedirect(destino);
%>