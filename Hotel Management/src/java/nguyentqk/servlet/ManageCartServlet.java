/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyentqk.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import nguyentqk.raw.Cart;
import nguyentqk.room.RoomDAO;
import nguyentqk.room.RoomDTO;

/**
 *
 * @author Apple
 */
public class ManageCartServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private final String ERROR_PAGE = "error.jsp";
    private final String CART_PAGE = "cart.jsp";
    private final String SHOW_CART = "showCart";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String url = ERROR_PAGE;

        String operation = request.getParameter("operation");
        String[] items = request.getParameterValues("selectedItem");

        try {
            HttpSession session = request.getSession(false);
            Cart cart = (Cart) session.getAttribute("CART");
            RoomDAO rmDAO = new RoomDAO();
            if (items != null) {
                for (String rmID : items) {
                    int rmIDInt = Integer.parseInt(rmID);
                    if ("Increase Amount".equals(operation)) {
                        RoomDTO rm = rmDAO.getRoom(rmIDInt);
                        cart.addItem(rm);
                    }
                    if ("Remove Room".equals(operation)) {
                        RoomDTO rm = rmDAO.getRoom(rmIDInt);
                        cart.removeEntireItem(rm);
                    }
                }
            }
            session.setAttribute("CART", cart);
            url = SHOW_CART;
        } catch (SQLException ex) {
            Logger.getLogger(ManageCartServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(ManageCartServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
