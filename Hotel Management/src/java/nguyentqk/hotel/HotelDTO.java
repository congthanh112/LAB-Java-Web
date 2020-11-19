/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyentqk.hotel;

import java.io.Serializable;
import java.util.List;
import nguyentqk.room.RoomDTO;

/**
 *
 * @author Apple
 */
public class HotelDTO implements Serializable {
    private int hotelID;
    private String hotelName;
    private String hotelArea;

    public int getHotelID() {
        return hotelID;
    }

    public void setHotelID(int hotelID) {
        this.hotelID = hotelID;
    }

    public String getHotelName() {
        return hotelName;
    }

    public void setHotelName(String hotelName) {
        this.hotelName = hotelName;
    }

    public String getHotelArea() {
        return hotelArea;
    }

    public void setHotelArea(String hotelArea) {
        this.hotelArea = hotelArea;
    }

    @Override
    public String toString() {
        return "HotelDTO{" + "hotelID=" + hotelID + ", hotelName=" + hotelName + ", hotelArea=" + hotelArea + ", roomList=" + roomList + '}';
    }
    
    List<RoomDTO> roomList;

    public List<RoomDTO> getRoomList() {
        return roomList;
    }

    public void setRoomList(List<RoomDTO> roomList) {
        this.roomList = roomList;
    }
}
