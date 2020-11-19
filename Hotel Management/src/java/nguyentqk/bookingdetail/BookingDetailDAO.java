/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyentqk.bookingdetail;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import nguyentqk.booking.BookingDTO;
import nguyentqk.util.DBHelper;

/**
 *
 * @author Apple
 */
public class BookingDetailDAO implements Serializable {

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

   

    public List<BookingDetailDTO> listAllDetails(int bookID) throws NamingException, SQLException {
        List<BookingDetailDTO> list = new ArrayList<>();

        try {
            connection = DBHelper.makeConnection();
            String sql = "select * "
                    + "from BookingDetail as D JOIN Room as R "
                    + "ON D.bookID = ? AND D.roomID = R.roomID "
                    + "JOIN Hotel as H "
                    + "ON H.hotelID = R.hotelID";
            ps = connection.prepareStatement(sql);
            ps.setInt(1, bookID);
            rs = ps.executeQuery();

            while (rs.next()) {
                BookingDetailDTO detail = new BookingDetailDTO();

                detail.setDetailID(rs.getInt("detailID"));
                detail.setBookID(bookID);
                detail.setRoomID(rs.getInt("roomID"));
                detail.setCheckIn(rs.getDate("checkIn"));
                detail.setCheckOut(rs.getDate("checkOut"));
                detail.setAmount(rs.getInt("amount"));
                detail.setPrice(rs.getFloat("price"));
                detail.setTotal(rs.getFloat("total"));
                detail.setStatus(rs.getBoolean("status"));
                detail.setRoomType(rs.getString("roomType"));
                detail.setHotelName(rs.getString("hotelName"));

                list.add(detail);
            }

        } finally {
            closeConnection();;
        }

        return list;
    }

    public boolean addBookingDetail(BookingDetailDTO detail) throws SQLException, NamingException {
        try {
            connection = DBHelper.makeConnection();

            String sql = "insert into BookingDetail (bookID, roomID, checkIn, checkOut, amount, price, total) values (?,?,?,?,?,?,?)";

            ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            ps.setInt(1, detail.getBookID());
            ps.setInt(2, detail.getRoomID());
            ps.setDate(3, detail.getCheckIn());
            ps.setDate(4, detail.getCheckOut());
            ps.setInt(5, detail.getAmount());
            ps.setFloat(6, detail.getPrice());
            ps.setFloat(7, detail.getTotal());

            int rows = ps.executeUpdate();

            if (rows > 0) {
                rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    int detailID = rs.getInt(1);
                    detail.setDetailID(detailID);
                    return true;
                }
            }
        } finally {
            closeConnection();
        }

        return false;
    }

}
