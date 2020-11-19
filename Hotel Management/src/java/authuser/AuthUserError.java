/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package authuser;

import java.io.Serializable;

/**
 *
 * @author Apple
 */
public class AuthUserError implements Serializable {
    private String errEmailExisted;
    private String errEmailFormat;
    private String errPasswordLength;
    private String errNameLength;
    private String errPhoneFormat;
    private String errAddressLength;
    private String errConfirmNotMatch;    
    
    
  
    
    public String getErrPhoneFormat() {
        return errPhoneFormat;
    }

    public void setErrPhoneFormat(String errPhoneFormat) {
        this.errPhoneFormat = errPhoneFormat;
    }
    
    

    public String getErrConfirmNotMatch() {
        return errConfirmNotMatch;
    }

    public void setErrConfirmNotMatch(String errConfirmNotMatch) {
        this.errConfirmNotMatch = errConfirmNotMatch;
    }
    
    

    public String getErrEmailFormat() {
        return errEmailFormat;
    }

    public void setErrEmailFormat(String errEmailFormat) {
        this.errEmailFormat = errEmailFormat;
    }
    
    

    public String getErrEmailExisted() {
        return errEmailExisted;
    }

    public void setErrEmailExisted(String errEmailExisted) {
        this.errEmailExisted = errEmailExisted;
    }


    public String getErrPasswordLength() {
        return errPasswordLength;
    }

    public void setErrPasswordLength(String errPasswordLength) {
        this.errPasswordLength = errPasswordLength;
    }

    public String getErrNameLength() {
        return errNameLength;
    }

    public void setErrNameLength(String errNameLength) {
        this.errNameLength = errNameLength;
    }


    public String getErrAddressLength() {
        return errAddressLength;
    }

    public void setErrAddressLength(String errAddressLength) {
        this.errAddressLength = errAddressLength;
    }
    
    
}
