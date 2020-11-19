/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyentqk.servlet;

import authuser.AuthUserDAO;
import authuser.AuthUserDTO;
import authuser.AuthUserError;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import nguyentqk.util.AlgoUtil;
import nguyentqk.util.StringUtil;

/**
 *
 * @author Apple
 */
public class RegisterServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private final String LOGIN_PAGE = "login.jsp";
    private final String REGISTER_PAGE = "registration.jsp";
    private final String ERROR_PAGE = "error.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String confirm = request.getParameter("confirm");

        String url = ERROR_PAGE;
        boolean foundErr = false;
        AuthUserError err = new AuthUserError();

        if (!StringUtil.validateEmailFormat(email)) {
            foundErr = true;
            err.setErrEmailFormat("Email empty or wrong format, expected i.e: nguyen@exmaple.com");
        }

        if (!StringUtil.validateLength(password, 1)) {
            foundErr = true;
            err.setErrPasswordLength("Password must not be empty");
        }

        if (!StringUtil.validateEqualValues(password, confirm)) {
            foundErr = true;
            err.setErrConfirmNotMatch("Confirm password do not match");
        }

        if (!StringUtil.validateLength(name, 1)) {
            foundErr = true;
            err.setErrNameLength("Name must not be empty");
        }

        if (!StringUtil.validatePhoneNumber(phone)) {
            foundErr = true;
            err.setErrPhoneFormat("Phone number must be 10-digit length");
        }

        if (!StringUtil.validateLength(address, 1)) {
            foundErr = true;
            err.setErrAddressLength("Address must not be empty");
        }
        try {
            if (!foundErr) {
                AuthUserDAO userDAO = new AuthUserDAO();
                AuthUserDTO user = new AuthUserDTO();
                user.setEmail(email);
                user.setPassword(AlgoUtil.hashStringSHA256(password));
                user.setPhone(phone);
                user.setName(name);
                user.setAddress(address);
                if (userDAO.createAccount(user)) {
                    request.setAttribute("MSGRESPONSE", "Successfully registered. Let's login to your account!");
                    url = LOGIN_PAGE;
                }
            }
        } catch (SQLException ex) {
            if (ex.getMessage().contains("duplicate")) {
                foundErr = true;
                err.setErrEmailExisted("Email've already existed");
            }
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (foundErr) {
                url = REGISTER_PAGE;
                request.setAttribute("AUTHUSER_ERROR", err);
            }
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
