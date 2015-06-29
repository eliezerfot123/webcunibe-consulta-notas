/*
 * ident.java
 * Se encarga de la identificacion de usuarios web
 * Created on 20 de junio de 2002, 03:11 PM
 * Modificado el 02 de Agosto de 2003, 1:45 PM
 */

import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

/**
 *
 * @author Alfredo Jose Ramirez-Garcia
 * @author Leonardo J. Caballero G.
 * @version 2.0
 */

 public class ident extends HttpServlet
 {
  /** Initializes the servlet.
  */
   private String username = null;
   //private String password = null;
   private String ref = null;
   //private String tipoest = null;
    
   Connection conn = null;

   public void init(ServletConfig config) throws ServletException
   {
    super.init(config);
    String url = new String("jdbc:informix-sqli://IP:PUERTO/BASE_DE_DATOS:informixserver=online_tcp");
        
    try
    {
     Class.forName("com.informix.jdbc.IfxDriver");
    }
    catch (ClassNotFoundException ex)
    {
     System.out.println("No se pudo cargar el Driver Manager");
     System.out.println(ex.getMessage());
    }
    try
    {
     conn = DriverManager.getConnection(url,"USUARIO","CONTRASENA");
    }
    catch (SQLException sqlEx)
    {
     System.out.println("Se ha producido un error al intentar establecer la conexion con la Base de Datos");
     System.out.println(sqlEx.getMessage());
    }
    System.out.println("Servlet Iniciado Conexion Correctamente...");
   } //init
    
  /** Destroys the servlet.
  */
   public void destroy() 
   {
    System.out.println("Servlet Cerrando Conexion Correctamente...");
    try 
    {
     conn.close();
    }
    catch(SQLException sqlEx) 
    {
     System.out.println("No se pudo cerrar la conexion con la Base de Datos");
     System.out.println(sqlEx.getMessage());
    }        
   }
    
  /** Handles the HTTP <code>POST</code> method.
   * @param request servlet request
   * @param response servlet response
   */
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, java.io.IOException 
    {
     boolean hayError = false;
     String tSQL = null;
     Statement stmt = null;
     ResultSet rs = null;
        
     if (request.getParameter("username")!=null)
      username = request.getParameter("username");
     else
      hayError = true;

     /*if (request.getParameter("password")!=null)
      password = request.getParameter("password");
     else
      hayError = true;*/
        
     //tipoest = request.getParameter("tipoest");

     if (!hayError) 
     {
      try
      {
       tSQL = "select * from datos_basicos_alumnos where cedula='" + username + "'";
       stmt = conn.createStatement();
       rs = stmt.executeQuery(tSQL);
       boolean hayRegistro = rs.next();
       if (hayRegistro) 
       {
        HttpSession miSesion = request.getSession();
        miSesion.setAttribute("Cedula", username);
        miSesion.setAttribute("Periodo", rs.getString("periodo_semestre"));
        //miSesion.setAttribute("TipoEst", tipoest);
        ref = request.getParameter("url");
        if (ref!=null||ref!="null")
        {
         response.sendRedirect(response.encodeRedirectURL("../"+ref));
        }
        else 
        {
         response.sendRedirect(response.encodeRedirectURL("../datper.jsp"));
        }
       } 
       else
        response.sendRedirect(response.encodeRedirectURL("../login.jsp"));
      } 
      catch (SQLException sqlEx) 
      {
       System.out.println("Error creando el statement: " + " select * from datos_basicos where cedula='" + username + "'");
       System.out.println(sqlEx.getMessage());
      }
      finally 
      {
       if(stmt!=null) 
       {
        try 
        {
         stmt.close();
        }
        catch(SQLException sqlEx) 
        {
         System.out.println("Error cerrando el statement");
         System.out.println(sqlEx.getMessage());
         //return -3;
        }
       } 
       //return 0;
      } // finally
     } 
     else 
     {
      response.sendError(500);
      System.out.println("Error");
     }
    }
    
    /** Retorna una breve descripcion del servlet.
     */
    public String getServletInfo() 
    {
     return "Identificacion de Usuarios WEB";
    }
 }
