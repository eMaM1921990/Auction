<%-- 
    Document   : check
    Created on : Apr 29, 2015, 10:52:49 PM
    Author     : emam
--%>

<%@page import="java.io.IOException"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.io.UnsupportedEncodingException"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="org.apache.http.HttpResponse"%>
<%@page import="org.apache.http.client.methods.HttpGet"%>
<%@page import="org.apache.http.impl.client.DefaultHttpClient"%>
<%@page import="paypal.PaypalProp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="paypal.GetExpressCheckout"%>
<%
    GetExpressCheckout express = new GetExpressCheckout();
    express.getExperess(request.getParameter("token"));
     PaypalProp p=new PaypalProp();
        try {
            p.read();
            DefaultHttpClient client = new DefaultHttpClient();
            String paypal_NVP = p.URL;
            paypal_NVP += "?USER=" + URLEncoder.encode(p.USER, "UTF-8");
            paypal_NVP += "&PWD=" + URLEncoder.encode(p.PWD, "UTF-8");
            paypal_NVP += "&SIGNATURE=" + URLEncoder.encode(p.SIGNATURE, "UTF-8");
            paypal_NVP += "&VERSION=" + URLEncoder.encode(p.VERSION, "UTF-8");
            paypal_NVP += "&METHOD=" + URLEncoder.encode("GetExpressCheckoutDetails", "UTF-8");
            paypal_NVP += "&TOKEN=" + URLEncoder.encode(request.getParameter("token"), "UTF-8");
            HttpGet post = new HttpGet(paypal_NVP);
            HttpResponse response_client = client.execute(post);
            BufferedReader rd = new BufferedReader(new InputStreamReader(response_client.getEntity().getContent()));
            String line = "";
            while ((line = rd.readLine()) != null) {
                out.println(URLDecoder.decode(line, "UTF-8"));
                
            }

        } catch (UnsupportedEncodingException ex) {
            Logger.getLogger(GetExpressCheckout.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(GetExpressCheckout.class.getName()).log(Level.SEVERE, null, ex);
        }
    

%>