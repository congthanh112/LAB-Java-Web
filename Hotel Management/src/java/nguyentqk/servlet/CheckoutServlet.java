/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyentqk.servlet;

import authuser.AuthUserDAO;
import authuser.AuthUserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import nguyentqk.booking.BookingDAO;
import nguyentqk.booking.BookingDTO;
import nguyentqk.bookingdetail.BookingDetailDAO;
import nguyentqk.bookingdetail.BookingDetailDTO;
import nguyentqk.raw.Cart;
import nguyentqk.room.RoomDTO;

/**
 *
 * @author Apple
 */
public class CheckoutServlet extends HttpServlet {

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
    private final String SEARCH_ROOM = "searchRoom";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String url = ERROR_PAGE;
        try {
            HttpSession session = request.getSession(false);
            AuthUserDTO user = (AuthUserDTO) session.getAttribute("AUTHUSER");
            Cart cart = (Cart) session.getAttribute("CART");
            BookingDAO bkDAO = new BookingDAO();
            BookingDetailDAO detailDAO = new BookingDetailDAO();

            BookingDTO bk = new BookingDTO();
            bk.setEmail(user.getEmail());
            bk.setTotal(cart.getTotalMoney());
            if (bkDAO.addBooking(bk)) {
                Map<RoomDTO, Integer> items = cart.getItems();
                Map<Integer, Float> prices = cart.getItemsTotalMoney();
                for (RoomDTO rm : items.keySet()) {
                    BookingDetailDTO detail = new BookingDetailDTO();
                    detail.setAmount(items.get(rm));
                    detail.setBookID(bk.getBookID());
                    detail.setCheckIn(rm.getCheckIn());
                    detail.setCheckOut(rm.getCheckOut());
                    detail.setPrice(rm.getPrice());
                    detail.setRoomID(rm.getRoomID());
                    detail.setTotal(prices.get(rm.getRoomID()));
                    detailDAO.addBookingDetail(detail);
                }
                url = SEARCH_ROOM;
                request.setAttribute("MSGRESPONSE", "Your booking has been added! The booking ID is " + bk.getBookID());
                session.removeAttribute("CART");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CheckoutServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(CheckoutServlet.class.getName()).log(Level.SEVERE, null, ex);
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
