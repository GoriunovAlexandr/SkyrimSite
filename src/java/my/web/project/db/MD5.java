
package my.web.project.db;

import javax.swing.JOptionPane;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;


public class MD5 {



  /**
   * MD5 BASE64 checksum for the specified input string.
   * 
   * @param input -
   *          Specified input string
   * @return String - MD5 BASE64 sum
   */
  public static String checkMD5(String input) {
    try {
      MessageDigest md = MessageDigest.getInstance("MD5");
      md.update(input.getBytes());
      byte[] enc = md.digest();
      String md5Sum = new sun.misc.BASE64Encoder().encode(enc);
      return md5Sum;
    } catch (NoSuchAlgorithmException nsae) {
      System.out.println(nsae.getMessage());
      return null;
    }
  }
  /*
    public static void main(String[] args) {
        String encriptpass = MD5.checkMD5("1234");
        //gdyb21LQTcIANtvYMT7QVQ==
        System.out.println("Encript pass: "+ encriptpass);
    }*/
}

   