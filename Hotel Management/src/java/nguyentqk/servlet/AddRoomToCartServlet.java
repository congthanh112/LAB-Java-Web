/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyentqk.servlet;

import authuser.AuthUserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
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
public class AddRoomToCartServlet extends HttpServlet {

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
    private final String SEARCH_CONTROLLER = "searchRoom";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String roomID = request.getParameter("roomID");
        String checkIn = request.getParameter("cartCheckIn");
        String checkOut = request.getParameter("cartCheckOut");

        String url = ERROR_PAGE;

        ArrayList<String> userErr = new ArrayList<>();

        try {
            RoomDAO rmDAO = new RoomDAO();
            int roomIDInt = -1;
            Date checkInDate = null;
            Date checkOutDate = null;
            try {
                roomIDInt = Integer.parseInt(roomID);
                checkInDate = Date.valueOf(checkIn);
                checkOutDate = Date.valueOf(checkOut);
            } catch (Exception ex) {
                userErr.add("Please fill in check in date, check out date before booking");
                request.setAttribute("BOOK_ERROR", userErr);
                url = SEARCH_CONTROLLER + "?" + request.getParameter("q");
            }

            if (userErr.isEmpty()) {
                HttpSession session = request.getSession(false);
                Cart cart = (Cart) session.getAttribute("CART");

                if (cart == null) {
                    cart = new Cart();
                }

                RoomDTO rm = rmDAO.getRoom(roomIDInt);
                rm.setCheckIn(checkInDate);
                rm.setCheckOut(checkOutDate);

                cart.addItem(rm);
                session.setAttribute("CART", cart);
                request.setAttribute("MSGRESPONSE", "Successfully added!");
                url = SEARCH_CONTROLLER + "?" + request.getParameter("q");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AddRoomToCartServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(AddRoomToCartServlet.class.getName()).log(Level.SEVERE, null, ex);
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
