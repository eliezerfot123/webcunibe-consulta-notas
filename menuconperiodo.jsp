<%@page contentType="text/html" %>
<%
String cedula = (String)request.getParameter("cedula");
String periodoacademico = (String)request.getParameter("periodoacademico");
%>
                <form action="redir.jsp" method="POST">
                  <table align="center" width="718" border="0" cellspacing="2" cellpadding="4">
                    <tr bgcolor="#FFFFFF" width="37%">
                        <td align="left" bgcolor="#3184bd" valign="middle">
                            &nbsp;<font color="#FFFFFF" face="tahoma,arial"><b>Buscar:</b></font>
                                <select name="consulta">
                                    <option value='nuevaconsulta'>Realizar nueva consulta</option>
                                    <option value="cortedenotas">Cortes de Notas</option>
                                    <option value="registroacademico">Registro Acad&eacute;mico</option>
                                    <!--<option value='<%=response.encodeURL("horcla.jsp")%>'>Horario de Clases</option>-->
                                    <option value="pagosdecuotas">Pagos de Cuotas</option>
                                    <option value="informaciondeegresados">Informaci&oacute;n de Egresados</option>
                                </select>
                            &nbsp;
                                <select name="periodoacademico">
                                    <option value="104N"<% if (periodoacademico.equals("104N")) out.write("selected"); %>>Marzo 2004 - Julio 2004</option>
                                    <option value="203V"<% if (periodoacademico.equals("203V")) out.write("selected"); %>>Febrero 2004</option>
                                    <option value="203N"<% if (periodoacademico.equals("203N")) out.write("selected"); %>>Septiembre 2003 - Enero 2004</option>
                                </select>
                             &nbsp;&nbsp;<input type="submit" value="Aceptar" name="Submit">
                             <input type="hidden" name="cedula" value="<%=cedula%>">
                             <input type="hidden" name="periodoacademico" value="<%=periodoacademico%>">
                        </td>
                    </tr>
                  </table>
                </form>