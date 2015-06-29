<%@ page contentType="text/html" import="java.sql.*" %>
<%@ taglib uri="WEB-INF/lib/dbtags.jar" prefix="sql" %>
<%
String cedulalumno = request.getParameter("cedulalumno");
String periodo = request.getParameter("periodo");
//String consulta = request.getParameter("tipodeconsulta");
String ref = request.getParameter("ref");
%>
<html>
 <head>
  <title>Colegio Universitario "Dr. Rafael Belloso Chac&iacute;n" - M&oacute;dulo de Consultas - Identificador de Usuario</title>
 </head>
<body>
<sql:connection id="conn1">
  <sql:url>jdbc:informix-sqli://IP:PUERTO/BASE_DE_DATOS:informixserver=online_tcp</sql:url> 
  <sql:driver initParameter="ifxDriver"/>
  <sql:userId initParameter="dbUserId"/> 
  <sql:password initParameter="dbPassword"/>
</sql:connection>
<sql:statement id="stmt1" conn="conn1">
  <sql:query>
    select * from datos_personales where cedula='<sql:escapeSql><%=cedulalumno%></sql:escapeSql>'
  </sql:query>
  <sql:resultSet id="rset2" loop="false">
   <% 
    //ResultSet rs = null;
    ResultSet rs = (ResultSet) pageContext.getAttribute("rset2");
    if (rs.next())
    {
     session.setAttribute("Periodo", rs.getString("periodo_semestre"));
     session.setAttribute("Cedula", cedulalumno);
     //session.setAttribute("TipodeConsulta", consulta);
     if (ref != null)
     {
      response.sendRedirect(response.encodeURL(ref));
     }
     else
     {
      response.sendRedirect(response.encodeURL("datper.jsp"));
     }
    }
    else
    {
    response.sendRedirect(response.encodeURL("login.jsp?msg=1"));
    }
   %>
  </sql:resultSet>
</sql:statement>
<sql:closeConnection conn="conn1" />
</body>
</html>