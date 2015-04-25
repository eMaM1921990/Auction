/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package paypal;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.URISyntaxException;
import java.security.AuthProvider;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author emam
 */
public class PaypalProp {

    static String FILE = "Paypal.properties";

     public String URL;
     public String USER;
     public String PWD;
     public String SIGNATURE;
     public String VERSION;
     public String CANCELURL;
     public String RETURNURL;
     public String EXPRESS_CHECKOUT_URL;

    public PaypalProp() {
        try {
            
            InputStream io=getClass().getResourceAsStream(FILE);
            Properties prop = new Properties();
             prop.load(io);
            URL = prop.getProperty("URL");
            USER = prop.getProperty("USER");
            PWD = prop.getProperty("PWD");
            SIGNATURE = prop.getProperty("SIGNATURE");
            VERSION = prop.getProperty("VERSION");
            CANCELURL = prop.getProperty("CANCELURL");
            RETURNURL = prop.getProperty("RETURNURL");
            EXPRESS_CHECKOUT_URL=prop.getProperty("EXPRESS_CHECKOUT_URL");
        }  catch (FileNotFoundException ex) {
            Logger.getLogger(PaypalProp.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(PaypalProp.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    
    public  void read(){
        try {
            System.out.println("Reading");
            InputStream io=getClass().getResourceAsStream(FILE);
            Properties prop = new Properties();
             prop.load(io);
            URL = prop.getProperty("URL");
            USER = prop.getProperty("USER");
            PWD = prop.getProperty("PWD");
            SIGNATURE = prop.getProperty("SIGNATURE");
            VERSION = prop.getProperty("VERSION");
            CANCELURL = prop.getProperty("CANCELURL");
            RETURNURL = prop.getProperty("RETURNURL");
            EXPRESS_CHECKOUT_URL=prop.getProperty("EXPRESS_CHECKOUT_URL");
            System.out.println("EXPRESS_CHECKOUT_URL"+prop.getProperty("EXPRESS_CHECKOUT_URL"));
        }  catch (FileNotFoundException ex) {
            Logger.getLogger(PaypalProp.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(PaypalProp.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
   
}
