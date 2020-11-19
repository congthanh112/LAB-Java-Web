/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyentqk.util;

import java.security.SecureRandom;

/**
 *
 * @author Apple
 */
public class StringUtil {

    private static final String EMAIL_REGEX_PATTERN = "^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$";

    public static boolean validateEmailFormat(String email) {
        return email != null && email.matches(EMAIL_REGEX_PATTERN);
    }

    public static boolean validateLength(String input, int lmin, int lmax) {
        return input != null && input.length() >= lmin && input.length() <= lmax;
    }

    public static boolean validateLength(String input, int lmin) {
        return input != null && input.length() >= lmin;
    }

    public static boolean validateNotEmpty(String input) {
        return input != null && !input.isEmpty();
    }

    public static boolean validateEqualValues(String s1, String s2) {
        return s1 != null && s2 != null && s1.equals(s2);
    }

    public static boolean validatePhoneNumber(String s) {
        if (s == null) return false;
        if (s.length() != 10) return false;
        for(int i = 0; i < s.length(); ++i) if (!Character.isDigit(s.charAt(i))) return false;
        return true;
    }

    private static SecureRandom srd;
    private static final String dictToken = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    private static final String dictOTP = "0123456789";

    public static String generateToken(int length) {
        if (srd == null) {
            srd = new SecureRandom();
        }
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < length; ++i) {
            char c = dictToken.charAt(srd.nextInt(dictToken.length()));
            sb.append(c);
        }
        return sb.toString();
    }

    public static String generateOTP(int length) {
        if (srd == null) {
            srd = new SecureRandom();
        }
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < length; ++i) {
            char c = dictOTP.charAt(srd.nextInt(dictOTP.length()));
            sb.append(c);
        }
        return sb.toString();
    }
}
