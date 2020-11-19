/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyentqk.booking;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;
import nguyentqk.bookingdetail.BookingDetailDTO;

/**
 *
 * @author Apple
 */
public class BookingDTO implements  Serializable {
    private int bookID;
    private String email;
    private Date createdAt;
    private float total;
    private boolean userConfirmed;
    private String status;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    

    public List<BookingDetailDTO> getDetailList() {
        return detailList;
    }

    public void setDetailList(List<BookingDetailDTO> detailList) {
        this.detailList = detailList;
    }
    
    private List<BookingDetailDTO> detailList;

    public int getBookID() {
        return bookID;
    }

    public void setBookID(int bookID) {
        this.bookID = bookID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public boolean isUserConfirmed() {
        return userConfirmed;
    }

    public void setUserConfirmed(boolean userConfirmed) {
        this.userConfirmed = userConfirmed;
    }
    
    
    
}
