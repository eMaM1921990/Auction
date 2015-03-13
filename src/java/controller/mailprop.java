/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URISyntaxException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author emam
 */
public class mailprop {

    String propFileName = "../mails.properties";
    public String authaddress=null;
    public String smtpserver=null;
    public String password=null;
    public String smtpport=null;
    public void mailsetting() {
        try {
            String path = Thread.currentThread().getContextClassLoader().getResource("/").toURI().resolve(propFileName).getPath();
            Properties prop = new Properties();
            prop.load(new FileInputStream(path));
            authaddress = prop.getProperty(prop.getProperty("autaddress"));
            smtpserver = prop.getProperty(prop.getProperty("smtpserver"));
            smtpport=prop.getProperty(prop.getProperty("smtpport"));
            password = prop.getProperty(prop.getProperty("mailpassword"));
        } catch (URISyntaxException ex) {
            Logger.getLogger(mailprop.class.getName()).log(Level.SEVERE, null, ex);
        } catch (FileNotFoundException ex) {
            Logger.getLogger(mailprop.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(mailprop.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
