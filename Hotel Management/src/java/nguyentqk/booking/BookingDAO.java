/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyentqk.booking;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import nguyentqk.util.DBHelper;

/**
 *
 * @author Apple
 */
public class BookingDAO implements Serializable {

    private Connection connection;
    private ResultSet rs;
    private PreparedStatement ps;

    public boolean deleteBooking(int bookID, String email) throws SQLException, NamingException {
        try {
            connection = DBHelper.makeConnection();
            String sql = "UPDATE Booking set status = ? WHERE bookID = ? and email = ?";
            ps = connection.prepareStatement(sql);
            ps.setString(1, "cancelled");
            ps.setInt(2, bookID);
            ps.setString(3, email);

            int rows = ps.executeUpdate();
            return rows > 0;

        } finally {
            closeConnection();;
        }
    }

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

    public List<BookingDTO> getAllUserBooking(String email) throws SQLException, NamingException {
        List<BookingDTO> list = new ArrayList<>();

        try {
            connection = DBHelper.makeConnection();

            String sql = "select bookID, createdAt, total, userConfirmed, status, email from Booking where email = ?";

            ps = connection.prepareStatement(sql);

            ps.setString(1, email);

            rs = ps.executeQuery();

            while (rs.next()) {
                BookingDTO bk = new BookingDTO();
                bk.setBookID(rs.getInt("bookID"));
                bk.setEmail(email);
                bk.setCreatedAt(rs.getDate("createdAt"));
                bk.setTotal(rs.getFloat("total"));
                bk.setUserConfirmed(rs.getBoolean("userConfirmed"));
                bk.setStatus(rs.getString("status"));

                list.add(bk);
            }

        } finally {
            closeConnection();
        }

        return list;
    }

    public boolean addBooking(BookingDTO bk) throws SQLException, NamingException {
        try {
            connection = DBHelper.makeConnection();

            String sql = "insert into Booking (email, total) values (?,?)";

            ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            ps.setString(1, bk.getEmail());
            ps.setFloat(2, bk.getTotal());

            int rows = ps.executeUpdate();

            if (rows > 0) {
                rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    int bkID = rs.getInt(1);
                    bk.setBookID(bkID);
                    return true;
                }
            }
        } finally {
            closeConnection();
        }

        return false;
    }

}
