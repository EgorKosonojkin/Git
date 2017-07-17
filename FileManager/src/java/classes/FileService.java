/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.io.File;

/**
 *
 * @author qwerty
 */
public class FileService {
   
    public static File getPath(String spath){
            String os = OpSys.getOS();
            if ((os.indexOf("nix"))>=0){
                    spath="/";
            }
            if ((os.indexOf("windows"))>=0){
                    spath="C:/";
                }
            File file = new File(spath);
            
        return file;
            
    }
}
