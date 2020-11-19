/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyentqk.util;

import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 *
 * @author Apple
 */
public class AlgoUtil {
    
    private static byte[] getSHA(String input) throws NoSuchAlgorithmException {
        if (input == null) {
            return null;
        }
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        return md.digest(input.getBytes(StandardCharsets.UTF_8));
    }
    
    private static String toHexString(byte[] hash) {
        if (hash == null) {
            return null;
        }
        BigInteger bi = new BigInteger(1, hash);
        StringBuilder sb = new StringBuilder(bi.toString(16));
        while (sb.length() < 32) {
            sb.insert(0, '0');
        }
        return sb.toString();
    }
    
    public static String hashStringSHA256(String input) throws NoSuchAlgorithmException{
        return toHexString(getSHA(input));
    }
    
    public static void main(String[] args) throws Exception {
        System.out.println(hashStringSHA256("kn"));
    }
    
    
    
}
