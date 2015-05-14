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
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;

/**
 *
 * @author emam
 */
public class setExpressCheckout {

    public static String Token;
    public static HashMap<String, String> param = new HashMap<String, String>();
    PaypalProp p=new PaypalProp();
    public void setExpress(String total,String item,String desc,String amount,String quantity,String payerid,String auction_id) throws Exception {
        try {
            p.read();
            DefaultHttpClient client = new DefaultHttpClient();
            String paypal_NVP = p.URL;
            paypal_NVP += "?USER=" + URLEncoder.encode(p.USER, "UTF-8");
            paypal_NVP += "&PWD=" + URLEncoder.encode(p.PWD, "UTF-8");
            paypal_NVP += "&SIGNATURE=" + URLEncoder.encode(p.SIGNATURE, "UTF-8");
            paypal_NVP += "&VERSION=" + URLEncoder.encode("109.0", "UTF-8");
            paypal_NVP += "&PAYMENTREQUEST_0_PAYMENTACTION=" + URLEncoder.encode("Sale", "UTF8");
            paypal_NVP += "&PAYMENTREQUEST_0_AMT=" + URLEncoder.encode(total, "UTF-8");
            paypal_NVP += "&L_PAYMENTREQUEST_0_NAME0=" + URLEncoder.encode(item, "UTF-8");
            paypal_NVP += "&L_PAYMENTREQUEST_0_DESC0=" + URLEncoder.encode("Code:"+auction_id+"-"+item, "UTF-8");
            paypal_NVP += "&L_PAYMENTREQUEST_0_AMT0=" + URLEncoder.encode(amount, "UTF-8");
            paypal_NVP += "&L_PAYMENTREQUEST_0_QTY0=" + URLEncoder.encode(quantity, "UTF-8");
            paypal_NVP += "&L_PAYMENTREQUEST_0_ITEMCATEGORY0=" + URLEncoder.encode("Digital", "UTF-8");
            paypal_NVP += "&RETURNURL=" + URLEncoder.encode(p.RETURNURL, "UTF-8");
            paypal_NVP += "&CANCELURL=" + URLEncoder.encode(p.CANCELURL, "UTF-8");
            paypal_NVP += "&METHOD=" + URLEncoder.encode("SetExpressCheckout", "UTF-8");
            paypal_NVP += "&PAYMENTREQUEST_0_SELLERPAYPALACCOUNTID=" + URLEncoder.encode(payerid, "UTF-8");
            

            HttpGet get = new HttpGet(paypal_NVP);
            System.out.println("Asked URL "+paypal_NVP);
           
            HttpResponse response = client.execute(get);
            BufferedReader rd = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
            String line = "";
            while ((line = rd.readLine()) != null) {
                System.out.println("Cureent :"+URLDecoder.decode(line, "UTF-8"));
                FormatString(URLDecoder.decode(line, "UTF-8"));

            }
        } catch (UnsupportedEncodingException ex) {
            Logger.getLogger(setExpressCheckout.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(setExpressCheckout.class.getName()).log(Level.SEVERE, null, ex);
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
}
