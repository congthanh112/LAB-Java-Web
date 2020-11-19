/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyentqk.room;

import java.io.Serializable;
import java.sql.Date;
import nguyentqk.hotel.HotelDTO;

/**
 *
 * @author Apple
 */
public class RoomDTO implements Serializable, Comparable<RoomDTO> {
    private int roomID;
    private String roomType;
    private boolean available;
    private float price;
    private int quantity;
    private int hotelID;
    
    private HotelDTO hotel;
    private Date checkIn;
    private Date checkOut;

    @Override
    public boolean equals(Object obj) {
        if (obj instanceof RoomDTO == false) return false;
        RoomDTO o = (RoomDTO) obj;
        return o.roomID == this.roomID;
    }

    @Override
    public int hashCode() {
        return this.roomID;
    }
    
    

    public HotelDTO getHotel() {
        return hotel;
    }

    public void setHotel(HotelDTO hotel) {
        this.hotel = hotel;
    }

    public Date getCheckIn() {
        return checkIn;
    }

    public void setCheckIn(Date checkIn) {
        this.checkIn = checkIn;
    }

    public Date getCheckOut() {
        return checkOut;
    }

    public void setCheckOut(Date checkOut) {
        this.checkOut = checkOut;
    }
    
    

    @Override
    public String toString() {
        return "RoomDTO{" + "roomID=" + roomID + ", roomType=" + roomType + ", available=" + available + ", price=" + price + ", quantity=" + quantity + ", hotelID=" + hotelID + '}';
    }
    
    

    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }

    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }

    public boolean isAvailable() {
        return available;
    }

    public void setAvailable(boolean available) {
        this.available = available;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getHotelID() {
        return hotelID;
    }

    public void setHotelID(int hotelID) {
        this.hotelID = hotelID;
    }

    @Override
    public int compareTo(RoomDTO o) {
        return Integer.compare(this.roomID, o.getRoomID());
    }
    
    
}
