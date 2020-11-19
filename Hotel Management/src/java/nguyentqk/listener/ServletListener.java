/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyentqk.listener;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * Web application lifecycle listener.
 *
 * @author Apple
 */
public class ServletListener implements ServletContextListener {
    
    Map<String,String> smap;

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        smap = new HashMap<>();
        
        smap.put("login", "LoginServlet");
        smap.put("", "login.jsp");
        smap.put("register", "RegisterServlet");
        smap.put("logout", "LogoutServlet");
        smap.put("searchRoom", "SearchRoomServlet");
        smap.put("addRoomToCart", "AddRoomToCartServlet");
        smap.put("showCart", "ShowCartServlet");
        smap.put("manageCart", "ManageCartServlet");
        smap.put("checkout", "CheckoutServlet");
        smap.put("showBookingHistory", "ShowBookingHistoryServlet");
        smap.put("deleteBooking", "DeleteBookingServlet");
        
        ServletContext context = sce.getServletContext();
        context.setAttribute("SITE_MAP", smap);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        smap.clear();;
    }
}
