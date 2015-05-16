/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.URISyntaxException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author emam
 */
public class mailprop {

    String propFileName = "mails.properties";
    public String authaddress = null;
    public String smtpserver = null;
    public String password = null;
    public String smtpport = null;

    public void mailsetting() {
        try {

            InputStream io = getClass().getResourceAsStream(propFileName);
            Properties prop = new Properties();
            prop.load(io);
            authaddress = prop.getProperty("autaddress");
            smtpserver = prop.getProperty("smtpserver");
            smtpport =prop.getProperty("smtpport");
            password = prop.getProperty("mailpassword");

        } catch (FileNotFoundException ex) {
            Logger.getLogger(mailprop.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(mailprop.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
