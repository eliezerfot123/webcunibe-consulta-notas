<%@ page contentType="text/html" session="true" %>
<%@ taglib uri="/dbtags" prefix="sql" %>
<%
String cedula = (String)request.getParameter("cedula");
String periodo = (String)request.getParameter("periodoacademico");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
  <!--Etiquetas META JSP-->
  <meta http-equiv="Pragma" content="no-cache">
  <meta http-equiv="Cache-Control" content="no-cache">
  <!--Etiquetas META-->
  <meta http-equiv="content-type" content="text/html;charset=iso-8859-1">
  <meta http-equiv="resource-type" content="document">
  <meta http-equiv="distribution" content="global">  
  <meta name="robots" content="all">
  <meta name="rating" content="general">  
  <meta name="author" content="Leonardo Caballero,  (leonardo_caballero@email.com)">
  <meta name="creator" content="Leonardo Caballero,  (leonardo_caballero@email.com)">
  <meta name="copyright" content="Colegio Universitario Dr. Rafael Belloso Chac&iacute;n, Todos los Derechos Reservados &copy; Estado Zulia, Maracaibo, Venezuela - 1998, 2004">
  <meta name="owner" content="Colegio Universitario Dr. Rafael Belloso Chacín, (webmater@cunibe.org)">
  <meta name="organization" content="Dr. Rafael Belloso Chac&iacute;n">
  <meta name="subject" content="Colegio Universitario Dr. Rafael Belloso Chacín, CUNIBE">
  <meta name="keywords" content="CUNIBE, Tecnologicos, Administraci&oacute;n de Empresas, Mercadeo, Contadur&iacute;a, Dise&ntilde;o Gr&aacute;fico, Electr&oacute;nica, Inform&aacute;tica, Mantenimiento Industrial, Preescolar, Relaciones Industriales, Turismo, Dr. Oscar Belloso Medina, La Instituci&oacute;n, Rese&ntilde;a Hist&oacute;rica, Objetivos Institucionales, Misi&oacute;n, Visi&oacute;n, Estructura Organizativa, Perfil de Ingreso, Perfil Profesional, Pensun de Estudio, Proceso de Admisi&oacute;n, Requisitos de Ingreso, Inscripci&oacute;n, Formas de Pago, Banos Autorizados, Laboratorio de Computaci&oacute;n, Laboratorio de Electr&oacute;nica y F&iacute;sica, Tecnolog&iacute;a Educativa, Servicios M&eacute;dicos, Coordinaci&oacute;n de Cultura, Coordinaci&oacute;n de Deportes, Servicio de Internet, TELENOTAS, Campus, Fotos, Galeria de imagenes, Biblioteca, Vistas 360&deg;, Vistas 360 grados, Ubicaci&oacute;n, Consultas Acad&eacute;micas, Corte de Notas, Indice Acad&eacute;mico, Horarios de Clases, PAI, PAN, Perio, Periodo Acad&eacute;mico Normal, Periodo Acad&eacute;mico Intensivo, Eventos, EXPOCUNIBE, Estudios, Contactanos, Tecnol&oacute;gicos, Universidad, T&eacute;cnico Superior Universitario, T&eacute;cnico, Universitario, Dr. Rafael Belloso Chac&iacute;n, Colegio Universitario, Dr. Rafael Belloso Chac&iacute;n, www.cunibe.org, www.cunibe.org/bibio, www.cunibe.org/expocunibe, biblio, Bibliotecas, Consultas, Venezuela, Computaci&oacute;n, Internet, On line, en linea, Investigaci&oacute;n">
  <meta name="description" content="CUNIBE, nuestro inter&eacute;s primordial se dirige a la formaci&oacute;n de T&eacute;cnicos Superiores Universitarios; impartiendo a los estudiantes una s&oacute;lida preparaci&oacute;n altamente profesional y de definida significaci&oacute;n universitaria. A fin de lograr profesionales que garanticen el desarrollo pleno de las potencialidades socioecon&oacute;micas nacionales.">
  <!--Incono del CUNIBE-->
  <link rel="shortcut icon" href="favicon.ico"> 
  <!--Hoja de Estilos para todo el documento-->
  <link rel="stylesheet" href="styles.css" type="text/css">
  <!--Hoja de Estilos para la barra de scroll del browser-->
  <style type="text/css"> 
    <!-- 
     body 
     { 
       scrollbar-face-color: #3184BD;
       scrollbar-shadow-color: #689cd0;
       scrollbar-highlight-color: #F1F2F4;
       scrollbar-3dlight-color: #000000; 
       scrollbar-darkshadow-color: #000000;
       scrollbar-track-color: #84B5D6;
       scrollbar-arrow-color: #ffffff
      }
    -->
   </style>
   <!--Libreria Script del Software Softkink DHTML Menu-->
   <script type="text/javascript" language="JavaScript1.2" src="imagenes/stm31.js"></script>
   <!--Libreria de Funciones JavaScript-->
   <script type="text/javascript" language="JavaScript1.2" src="js/stm312.js"></script>
   <!--Funciones JavaScript-->   
   <script type="text/javascript" language="JavaScript1.2">
     /*
      Auto Maximize Window Script- By Nick Lowe (nicklowe@ukonline.co.uk)
      For full source code, 100's more free DHTML scripts, and Terms Of Use
      Visit http://www.dynamicdrive.com
     */

     top.window.moveTo(0,0);
     if (document.all)
     {
      top.window.resizeTo(screen.availWidth,screen.availHeight);
     }
     else if (document.layers||document.getElementById)
     {
      if (top.window.outerHeight < screen.availHeight || top.window.outerWidth < screen.availWidth)
      {
       top.window.outerHeight = screen.availHeight;
       top.window.outerWidth = screen.availWidth;
      }
     }
   </script> 
  <title>Colegio Universitario &quot;Dr. Rafael Belloso Chac&iacute;n&quot; - M&oacute;dulo de Consultas - Registro Acad&eacute;mico del Alumno</title>
 </head>
 <body background="imagenes/background.gif" bgcolor="#FFFFFF">
    <!-- Tabla de Banner de la imagen superior -->
    <jsp:include page="bannerarriba.jsp"/>
    <table align="center" width="718" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>
        <!-- Tabla de titulo de REGISTRO ACAD&Eacute;MICO DEL ALUMNO -->
        <table width="719" border="0" cellpadding="2" cellspacing="3" align="center">
          <tr>
            <td bgcolor="#3184bd">
              <div align="center">
                <table  width="713" border="0" bgcolor="#3184bd" cellpadding="4">
                  <tr>
                    <td bgcolor="white">
                      <div align="center">
                        <b><font color="#310000" face="tahoma,arial">REGISTRO ACAD&Eacute;MICO DEL ALUMNO</font></b>
                      </div>
                    </td>
                  </tr>
                </table>
              </div>
            </td>
          </tr>
        </table>
        <br>
        <!-- Objeto de Conexion -->
        <sql:connection id="conn1">
            <sql:url>jdbc:informix-sqli://IP:PUERTO/BASE_DE_DATOS:informixserver=online_tcp</sql:url>
            <sql:driver initParameter="ifxDriver"/>
            <sql:userId initParameter="dbUserId"/>
            <sql:password initParameter="dbPassword"/>
        </sql:connection>
        <!-- 1 era Consulta de Datos Personales del Alumno -->
        <table align="center" width="718" border="1" cellspacing="0" cellpadding="2">
          <sql:statement id="stmt1" conn="conn1">
            <sql:query>SELECT cedula,nombres_alumno,apellidos_alumno,nummero_ficha,carrera FROM datos_personales WHERE cedula = '<sql:escapeSql><%=cedula%></sql:escapeSql>'</sql:query> 
            <sql:resultSet id="rset1">
          <tr> 
            <td bgcolor="#3184bd" width="20%"><b><font color="#FFFFFF" face="tahoma,arial">&nbsp;C&eacute;dula de Identidad:</font></b></td>
            <td bgcolor="#FFFFFF" width="80%"><font color="#310000" face="tahoma,arial">&nbsp;<sql:getColumn position="1"/></font></td>
          </tr>
          <tr> 
            <td bgcolor="#3184bd" width="20%"><b><font color="#FFFFFF" face="tahoma,arial">&nbsp;Nombres:</font></b></td>
            <td bgcolor="#FFFFFF" width="80%"><font color="#310000" face="tahoma,arial">&nbsp;<sql:getColumn position="2"/></font></td>
          </tr>
          <tr> 
            <td bgcolor="#3184bd" width="20%"><b><font color="#FFFFFF" face="tahoma,arial">&nbsp;Apellidos:</font></b></td>
            <td bgcolor="#FFFFFF" width="80%"><font color="#310000" face="tahoma,arial">&nbsp;<sql:getColumn position="3"/></font></td>
          </tr>
          <tr> 
            <td bgcolor="#3184bd" width="20%"><b><font color="#FFFFFF" face="tahoma,arial">&nbsp;N&uacute;mero de Ficha:</font></b></td>
            <td bgcolor="#FFFFFF" width="80%"><font color="#310000" face="tahoma,arial">&nbsp;<sql:getColumn position="4"/></font></td>
          </tr>
          <tr> 
            <td bgcolor="#3184bd" width="25%"><b><font color="#FFFFFF" face="tahoma,arial">&nbsp;Carrera:</font></b></td>
            <td bgcolor="#FFFFFF" width="75%"><font color="#310000" face="tahoma,arial">&nbsp;<sql:getColumn position="5"/></font></td>
          </tr>
            </sql:resultSet>
          </sql:statement> 
        </table>
        <br>
        <!-- 2 da. Consulta de Registro Académico del Alumno -->
        <table align="center" width="718" border="1" cellspacing="0" cellpadding="2">
          <tr bgcolor="#003366">
            <td bgcolor="#3184bd" align="center" width="21%"><b><font color="#FFFFFF" face="tahoma,arial">C&oacute;digo de Materia</font></b></td>
            <td bgcolor="#3184bd" align="center" width="51%"><b><font color="#FFFFFF" face="tahoma,arial">&nbsp;Nombre de la Materia</font></b></td>
            <td bgcolor="#3184bd" align="center" width="5%"><b><font color="#FFFFFF" face="tahoma,arial">&nbsp;U.C.</font></b></td>
            <td bgcolor="#3184bd" align="center" width="16%"><b><font color="#FFFFFF" face="tahoma,arial">Periodo</font></b></td>
            <td bgcolor="#3184bd" align="center" width="7%"><b><font color="#FFFFFF" face="tahoma,arial">Nota</font></b></td>
          </tr>
          <sql:statement id="stmt2" conn="conn1">
            <sql:query>SELECT cedula,codigo_materia,nombre_materia,unidad_credito,titsem,nota_final FROM registro WHERE cedula = '<sql:escapeSql><%=cedula%></sql:escapeSql>' ORDER BY 2 </sql:query>
            <sql:resultSet id="rset2">
          <tr bgcolor="#FFFFFF">
            <td align="center" width="21%"><font color="#310000" face="tahoma,arial"><sql:getColumn position="2"/></font></td>
            <td align="left" width="51%"><font color="#310000" face="tahoma,arial">&nbsp;<sql:getColumn position="3"/></font></td>
            <td align="center" width="5%"><font color="#310000" face="tahoma,arial"><sql:getColumn position="4"/></font></td>
            <td align="center" width="16%"><font color="#310000" face="tahoma,arial"><sql:getColumn position="5"/></font></td>
            <td align="center" width="7%"><font color="#310000" face="tahoma,arial"><sql:getColumn position="6"/></font></td>
          </tr>
          </sql:resultSet>
        </table>
        <!-- Tabla de Validación Si no hay registro alguno -->
        <table width="723" border="0" cellpadding="2" cellspacing="3" align="center">
          <tr>
            <td bgcolor="#3184bd">
                <div align="center">
                    <table width="713" border="0" bgcolor="#3184bd" cellpadding="4">
                        <tr>
                            <td align="right" colspan="2" bgcolor="#ffffff">
                               <sql:wasEmpty>
                               <div align="center">
                                   <br><b><font color="#000000" face="tahoma,arial">&nbsp;&nbsp;&nbsp;&quot;<u>NO SE HA ENCONTRADO NINGUN REGISTRO</u>&quot;&nbsp;</font></b><br><br>
                                   <br><div align="justify"><b><font color="#000000" face="tahoma,arial">&nbsp;&nbsp;&nbsp;<u>CAUSAS POR LA QUE NO MUESTRE LA CONSULTA:</u>&nbsp;</font></b><br><br>
                                   <b><font color="#000000" face="tahoma,arial">&nbsp;&nbsp;&nbsp;&nbsp;<IMG SRC="imagenes/vineta.gif" alt="" WIDTH=15 HEIGHT=12>&nbsp;&nbsp;Se ha introducido incorrectamente la c&eacute;dula de identidad.</font></b><br><br>
                                   <b><font color="#000000" face="tahoma,arial">&nbsp;&nbsp;&nbsp;&nbsp;<IMG SRC="imagenes/vineta.gif" alt="" WIDTH=15 HEIGHT=12>&nbsp;&nbsp;Probablemente aun no ha aprobado ninguna materia.&nbsp;</f.</font></b><br><br>
                                   <b><font color="#000000" face="tahoma,arial">&nbsp;&nbsp;&nbsp;&nbsp;<IMG SRC="imagenes/vineta.gif" alt="" WIDTH=15 HEIGHT=12>&nbsp;&nbsp;Alumno no est&aacute; inscrito en el Colegio Universitario &quot;Dr. Rafael Belloso Chac&iacute;n&quot;.</font></b><br><br>
                               </div>
                                </sql:wasEmpty>
                                <sql:wasNotEmpty>
                                   <b><font color="#000000" face="tahoma,arial"><sql:rowCount/>&nbsp;materias aprobadas.&nbsp;</font></b><br>
                                </sql:wasNotEmpty>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
          </tr>
        </table>
          </sql:statement> 
          <br>
          <!-- Tabla de Mensaje de Advertencia -->
          <table border="0" cellPadding="2" cellSpacing="3" align="center">
            <tr>
              <td bgcolor="#3184bd">
                  <div align="center">
                      <table border="0" cellpadding="4" bgcolor="#3184bd" width="425">
                          <tr>
                              <td bgcolor="#FFFFFF">
                                  <div align="center">
                                      <b><font color="#310000" face="tahoma,arial">&nbsp;PARA INFORMACI&Oacute;N SOLAMENTE. NO ES CONSTANCIA DE NOTAS.</font></b>
                                  </div>
                              </td>
                          </tr>
                      </table>
                  </div>
              </td>
            </tr>
          </table>
          <!-- Tabla de Menu Desplegable -->
          <jsp:include page="menuconperiodo.jsp"/>
          <!-- Tabla de Pie de Página -->
          <jsp:include page="barraabajo.jsp"/>
          <sql:closeConnection conn="conn1"/>
          </td>
      </tr>
    </table>
 </body>
</html>