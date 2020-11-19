/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package authuser;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;
import nguyentqk.util.DBHelper;

/**
 *
 * @author Apple
 */
public class AuthUserDAO implements Serializable {
     private Connection connection;
    private ResultSet rs;
    private PreparedStatement ps;

    private void closeConnection() throws SQLException {
        if (connection != null) {
            connection.close();
        }
        if (rs != null) {
            rs.close();
        }
        if (ps != null) {
            ps.close();
        }
    }
    
    public AuthUserDTO getAccount(String email, String password) throws NamingException, SQLException {
        AuthUserDTO user = null;
        try {
            connection = DBHelper.makeConnection();
            String sql = "select phone,name,address,createdAt, status, role from AuthUser where email=? and password=?";
            ps = connection.prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, password);
            rs = ps.executeQuery();

            if (rs.next()) {
                user = new AuthUserDTO();
                user.setEmail(email);
                user.setPhone(rs.getString("phone"));
                user.setName(rs.getString("name"));
                user.setAddress(rs.getString("address"));
                user.setCreatedAt(rs.getTimestamp("createdAt"));
                user.setStatus(rs.getString("status"));
                user.setRole(rs.getString("role"));
            }
        } finally {
            closeConnection();
        }
        return user;
    }
    
   public boolean createAccount(AuthUserDTO user) throws SQLException, NamingException {
        try {
            connection = DBHelper.makeConnection();
            String sql = "insert into AuthUser (email,password,phone,name,address) values (?,?,?,?,?)";
            ps = connection.prepareStatement(sql);

            ps.setString(1, user.getEmail());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getPhone());
            ps.setString(4, user.getName());
            ps.setString(5, user.getAddress());
            
            int cnt = ps.executeUpdate();
            return cnt > 0;
        } finally {
            closeConnection();
        }
   }
}
