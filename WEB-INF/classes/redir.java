/*
 * redir.java
 *
 * Created on 21 de junio de 2002, 04:28 PM
 */

import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author  alfredo
 * @version
 */
public class redir extends HttpServlet {
    
    /** Initializes the servlet.
     */
    String pagina = null;
    String periodo = null;
    //PageContext pagecontext = null;

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        System.out.println("Inicializado...");
    }
    
    /** Destroys the servlet.
     */
    public void destroy() {
        System.out.println("Destruyendo...");
    }
   
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, java.io.IOException {

        String pagina = request.getParameter("pagina");
        String periodo = request.getParameter("periodo");
        HttpSession miSesion = request.getSession();
        
        if (periodo!=miSesion.getAttribute("periodo"))
            miSesion.setAttribute("Periodo", periodo);
        
        response.sendRedirect(response.encodeRedirectURL(pagina));
    }
    
    /** Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "Short description";
    }
    
}
