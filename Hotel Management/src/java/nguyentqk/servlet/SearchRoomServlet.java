/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyentqk.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import nguyentqk.hotel.HotelDAO;
import nguyentqk.hotel.HotelDTO;
import nguyentqk.room.RoomDAO;
import nguyentqk.room.RoomDTO;
import nguyentqk.util.CommonUtil;

/**
 *
 * @author Apple
 */
public class SearchRoomServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private final String HOME_PAGE = "home.jsp";
    private final String ERROR_PAGE = "error.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String checkIn = request.getParameter("checkIn");
        String checkOut = request.getParameter("checkOut");
        String htName = request.getParameter("hotelName");
        String htArea = request.getParameter("hotelArea");
        String amount = request.getParameter("amount");

        String url = ERROR_PAGE;
        ArrayList<String> err = new ArrayList<>();
        try {
            RoomDAO rmDAO = new RoomDAO();
            List<RoomDTO> rmList;
            try {
                int amountInt = Integer.parseUnsignedInt(amount);
                Date checkInDate = Date.valueOf(checkIn);
                Date checkOutDate = Date.valueOf(checkOut);
                rmList = rmDAO.queryRooms(htName, htArea, amountInt, checkInDate, checkOutDate);;
            } catch (Exception ex) {
                err.add("Please fill in check in date, check out date and amount before searching");
                rmList = rmDAO.getAvailableRoomList();
            }
            request.setAttribute("ROOM_LIST", rmList);
            request.setAttribute("SEARCH_ERR", err);
            url = HOME_PAGE;
        } catch (SQLException ex) {
            Logger.getLogger(SearchRoomServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(SearchRoomServlet.class.getName()).log(Level.SEVERE, null, ex);
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
