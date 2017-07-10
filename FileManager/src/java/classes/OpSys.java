/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

/**
 *
 * @author qwerty
 */
public class OpSys {
    
    private static boolean sysNix(){
        String os = System.getProperty("os.name").toLowerCase();
        return ((os.indexOf("nix")) >=0 || (os.indexOf("nux")) >= 0);
    }
    
    private static boolean sysWindows(){
        String os = System.getProperty("os.name").toLowerCase();
        return (os.indexOf("windows"))>=0;
    }
    
    public static boolean sysMac(){
        String os = System.getProperty("os.name").toLowerCase();
        return (os.indexOf("mac"))>=0;
    }
    
    public static String getOS(){
        String os = null;
        if(sysNix()){
            os="*nix system";
        }else if (sysWindows()){
            os="microsoft windows system";
        }
        return os;
    }
}
