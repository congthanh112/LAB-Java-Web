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
import java.util.Collections;
import java.util.List;
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
import nguyentqk.util.CommonUtil;
import nguyentqk.util.StringUtil;

/**
 *
 * @author Apple
 */
public class ShowBookingHistoryServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private final String BOOKING_HISTORY_PAGE = "bookHistory.jsp";
    private final String ERROR_PAGE = "error.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String url = ERROR_PAGE;
        String bkID = request.getParameter("bkID");
        String bkDate = request.getParameter("bkDate");

        try {
            HttpSession session = request.getSession(false);
            AuthUserDTO user = (AuthUserDTO) session.getAttribute("AUTHUSER");
            BookingDAO bkDAO = new BookingDAO();
            BookingDetailDAO detailDAO = new BookingDetailDAO();

            List<BookingDTO> bkList = bkDAO.getAllUserBooking(user.getEmail());
            if (StringUtil.validateNotEmpty(bkID)) {
                bkList = CommonUtil.filter(bkList, (x) -> String.valueOf(x.getBookID()).contains(bkID));
            }
            if (StringUtil.validateNotEmpty(bkDate)) {
                bkList = CommonUtil.filter(bkList, (x) -> x.getCreatedAt().toString().equals(bkDate));
            }

            Collections.sort(bkList, (x, y) -> -x.getCreatedAt().compareTo(y.getCreatedAt()));

            for (BookingDTO bk : bkList) {
                bk.setDetailList(detailDAO.listAllDetails(bk.getBookID()));
            }
            
            request.setAttribute("BK_LIST", bkList);
            url = BOOKING_HISTORY_PAGE;

        } catch (SQLException ex) {
            Logger.getLogger(ShowBookingHistoryServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(ShowBookingHistoryServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
            out.close();;
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
