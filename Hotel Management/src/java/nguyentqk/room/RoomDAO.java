/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyentqk.room;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import nguyentqk.hotel.HotelDTO;
import nguyentqk.util.DBHelper;

/**
 *
 * @author Apple
 */
public class RoomDAO implements Serializable {

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

    public List<RoomDTO> queryRooms(String hotelName, String hotelArea, int amount, Date checkIn, Date checkOut)
            throws NamingException, SQLException {
        List<RoomDTO> list = new ArrayList<>();

        try {
            connection = DBHelper.makeConnection();

            String sql = "-- nullable fields\n"
                    + "DECLARE @name AS nvarchar(255) = ?;\n"
                    + "DECLARE @area AS nvarchar(255) = ?; \n"
                    + "--non-null fields\n"
                    + "DECLARE @amount as int = ?;\n"
                    + "DECLARE @checkIn as date = ?;\n"
                    + "DECLARE @checkOut as date = ?;\n"
                    + "select * \n"
                    + "from Room as R \n"
                    + "JOIN Hotel as H ON R.hotelID = H.hotelID \n"
                    + "AND R.available = 1 \n"
                    + "AND (@name is null or H.hotelName LIKE @name)\n"
                    + "AND (@area is null or H.hotelArea LIKE @area)\n"
                    + "AND (	\n"
                    + "	select COALESCE(SUM(D.amount),0) \n"
                    + "	from BookingDetail as D \n"
                    + "	where D.roomID = R.roomID \n"
                    + "	and D.status = 1 \n"
                    + "	and ((@checkIn between D.checkIn and D.checkOut) or (@checkOut between D.checkIn and D.checkOut))\n"
                    + ") <= (SELECT R.quantity - @amount);";

            ps = connection.prepareStatement(sql);

            ps.setString(1, "%" + hotelName + "%");
            ps.setString(2, "%" + hotelArea + "%");
            ps.setInt(3, amount);
            ps.setDate(4, checkIn);
            ps.setDate(5, checkOut);

            rs = ps.executeQuery();

            while (rs.next()) {

                RoomDTO room = new RoomDTO();
                room.setRoomID(rs.getInt("roomID"));
                room.setAvailable(rs.getBoolean("available"));
                room.setHotelID(rs.getInt("hotelID"));
                room.setPrice(rs.getFloat("price"));
                room.setQuantity(rs.getInt("quantity"));
                room.setRoomType(rs.getString("roomType"));

                HotelDTO ht = new HotelDTO();
                ht.setHotelName(rs.getString("hotelName"));
                ht.setHotelID(rs.getInt("hotelID"));
                ht.setHotelArea(rs.getString("hotelArea"));

                room.setHotel(ht);

                list.add(room);
            }
        } finally {
            closeConnection();
        }
        return list;

    }

    public List<RoomDTO> getAvailableRoomList() throws SQLException, NamingException {
        List<RoomDTO> list = new ArrayList<>();
        try {
            connection = DBHelper.makeConnection();
            String sql = "select * from Room as R JOIN Hotel as H "
                    + "ON R.hotelID = H.hotelID "
                    + "AND R.available = 1";
            ps = connection.prepareStatement(sql);

            rs = ps.executeQuery();

            while (rs.next()) {

                RoomDTO room = new RoomDTO();
                room.setRoomID(rs.getInt("roomID"));
                room.setAvailable(rs.getBoolean("available"));
                room.setHotelID(rs.getInt("hotelID"));
                room.setPrice(rs.getFloat("price"));
                room.setQuantity(rs.getInt("quantity"));
                room.setRoomType(rs.getString("roomType"));

                HotelDTO ht = new HotelDTO();
                ht.setHotelName(rs.getString("hotelName"));
                ht.setHotelID(rs.getInt("hotelID"));
                ht.setHotelArea(rs.getString("hotelArea"));

                room.setHotel(ht);

                list.add(room);
            }

        } finally {
            closeConnection();
        }
        return list;
    }

    public List<RoomDTO> getRoomListOfHotel(int hotelID) throws SQLException, NamingException {
        List<RoomDTO> list = new ArrayList<>();

        try {
            connection = DBHelper.makeConnection();
            String sql = "select roomID, roomType, available, price, quantity, hotelID from Room where hotelID = ?";
            ps = connection.prepareStatement(sql);
            ps.setInt(1, hotelID);
            rs = ps.executeQuery();
            while (rs.next()) {
                RoomDTO room = new RoomDTO();
                room.setRoomID(rs.getInt("roomID"));
                room.setAvailable(rs.getBoolean("available"));
                room.setHotelID(rs.getInt("hotelID"));
                room.setPrice(rs.getFloat("price"));
                room.setQuantity(rs.getInt("quantity"));
                room.setRoomType(rs.getString("roomType"));

                list.add(room);
            }
        } finally {
            closeConnection();
        }
        return list;
    }

    public RoomDTO getRoom(int roomID) throws SQLException, NamingException {

        try {
            connection = DBHelper.makeConnection();
            String sql = "select * from Room as R JOIN Hotel as H ON"
                    + " H.hotelID = R.hotelID"
                    + " AND R.roomID = ?";
            ps = connection.prepareStatement(sql);
            ps.setInt(1, roomID);
            rs = ps.executeQuery();
            if (rs.next()) {
                RoomDTO room = new RoomDTO();

                room.setRoomID(rs.getInt("roomID"));
                room.setAvailable(rs.getBoolean("available"));
                room.setHotelID(rs.getInt("hotelID"));
                room.setPrice(rs.getFloat("price"));
                room.setQuantity(rs.getInt("quantity"));
                room.setRoomType(rs.getString("roomType"));

                HotelDTO ht = new HotelDTO();
                ht.setHotelName(rs.getString("hotelName"));
                ht.setHotelID(rs.getInt("hotelID"));
                ht.setHotelArea(rs.getString("hotelArea"));

                room.setHotel(ht);

                return room;
            }
        } finally {
            closeConnection();
        }
        return null;
    }

}
