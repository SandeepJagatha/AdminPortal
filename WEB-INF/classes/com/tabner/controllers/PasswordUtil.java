package com.tabner.controllers;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Random;

import org.apache.commons.codec.binary.Base64;
/*import org.apache.tomcat.util.codec.binary.Base64;
import java.util.Base64;
*/
public class PasswordUtil {
    
    /*  This code uses SHA-256. If this algorithm isn't available to you,
        you can try a weaker level of encryption such as SHA-128.
    */    
    public  String hashPassword(String password)
            throws NoSuchAlgorithmException {        
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        md.reset();
        md.update(password.getBytes());
        byte[] mdArray = md.digest();
        StringBuilder sb = new StringBuilder(mdArray.length * 2);
        for (byte b : mdArray) {
            int v = b & 0xff;
            if (v < 16) {
                sb.append('0');
            }
            sb.append(Integer.toHexString(v));
        }        
        return sb.toString();        
    }
    
    public String  getSalt() {
        Random r = new SecureRandom();
        byte[] saltBytes = new byte[32];
        r.nextBytes(saltBytes);
        //return Base64.encodeBase64String(saltBytes);
        
        byte[] encodedBytes = Base64.encodeBase64(saltBytes);
        System.out.println("encodedBytes " + new String(encodedBytes));
//        byte[] decodedBytes = Base64.decodeBase64(encodedBytes);
//        System.out.println("decodedBytes " + new String(decodedBytes));
        return new String(encodedBytes);
       //return Base64.getEncoder().encodeToString(saltBytes);
    }
    
}