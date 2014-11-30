/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package beans;

/**
 *
 * @author eMaM
 */
public class LoginBeans {
    private int userid=0;
    private String username=null;
    private int usertype=0;
    
    public void setUserId(int id){
        this.userid=id;
    }
    
   public int getUserId(){
        return userid;
    }
    
    public void setUserName(String name){
        this.username=name;
    }
    
    public String getUserName(){
        return username;
    }
    
    public void setUserType(int type){
        this.usertype=type;
    }
    
    public int getUserType(){
        return usertype;
    }
    
}
