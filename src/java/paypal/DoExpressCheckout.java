/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package paypal;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Arrays;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import static paypal.setExpressCheckout.param;

/**
 *
 * @author emam
 */
public class DoExpressCheckout {

    public static HashMap<String, String> param = new HashMap<String, String>();
    PaypalProp p = new PaypalProp();

    public void doexpress(String token, String payerid, String amount) {
        try {
            p.read();
            DefaultHttpClient client = new DefaultHttpClient();
            String paypal_NVP = p.URL;
            paypal_NVP += "?USER=" + URLEncoder.encode(p.USER, "UTF-8");
            paypal_NVP += "&PWD=" + URLEncoder.encode(p.PWD, "UTF-8");
            paypal_NVP += "&SIGNATURE=" + URLEncoder.encode(p.SIGNATURE, "UTF-8");
            paypal_NVP += "&VERSION=" + URLEncoder.encode(p.VERSION, "UTF-8");
            paypal_NVP += "&METHOD=" + URLEncoder.encode("DoExpressCheckoutPayment", "UTF-8");
            paypal_NVP += "&TOKEN=" + URLEncoder.encode(token, "UTF-8");
            paypal_NVP += "&PAYERID=" + URLEncoder.encode(payerid, "UTF-8");
            paypal_NVP += "&PAYMENTREQUEST_0_AMT=" + URLEncoder.encode(amount, "UTF-8");
            paypal_NVP += "&PAYMENTREQUEST_0_CURRENCYCODE=" + URLEncoder.encode("USD", "UTF-8");
            paypal_NVP += "&PAYMENTREQUEST_0_PAYMENTACTION=" + URLEncoder.encode("Sale", "UTF8");

            HttpGet post = new HttpGet(paypal_NVP);
            HttpResponse response = client.execute(post);
            BufferedReader rd = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
            String line = "";
            while ((line = rd.readLine()) != null) {
                System.out.println(line);
                FormatString(URLDecoder.decode(line, "UTF-8"));

            }

        } catch (UnsupportedEncodingException ex) {
            Logger.getLogger(DoExpressCheckout.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(DoExpressCheckout.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void FormatString(String responseString) {
        java.util.List<String> elephantList = Arrays.asList(responseString.split("&"));
        for (int i = 0; i < elephantList.size(); i++) {

            String Key = elephantList.get(i).substring(0, elephantList.get(i).indexOf("="));
            String Value = elephantList.get(i).substring(elephantList.get(i).indexOf("=") + 1, elephantList.get(i).length());
            param.put(Key, Value);
        }

    }
    
    
//    public static void main(String args[]){
//        DoExpressCheckout d=new DoExpressCheckout();
//        d.doexpress("EC-12E975068D4862618", "5WQL52ARD2FNA", "30");
//        System.out.println("Data :"+d.param.get("PAYMENTINFO_0_TRANSACTIONID"));
//                
//    }
}
