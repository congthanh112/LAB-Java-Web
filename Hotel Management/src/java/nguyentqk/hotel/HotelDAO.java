/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyentqk.hotel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import nguyentqk.room.RoomDTO;
import nguyentqk.util.DBHelper;

/**
 *
 * @author Apple
 */
public class HotelDAO {

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

    public List<HotelDTO> getHotelList() throws SQLException, NamingException {
        List<HotelDTO> list = new ArrayList<>();

        try {
            connection = DBHelper.makeConnection();
            String sql = "select hotelID, hotelName, hotelArea from Hotel";
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                HotelDTO hotel = new HotelDTO();
                hotel.setHotelID(rs.getInt("hotelID"));
                hotel.setHotelName(rs.getString("hotelName"));
                hotel.setHotelArea(rs.getString("hotelArea"));
                list.add(hotel);
            }
        } finally {
            closeConnection();
        }

        return list;
    }
}
