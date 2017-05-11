/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.io.File;
import java.text.SimpleDateFormat;

/**
 *
 * @author monknax
 */
public class Actions {
    
    private String FileName;
    private String FilelSize;
    private String LastMod;
    private String FileParant;
    private String FileType;
    
    public Actions(File file){
        FileName=file.getName();
        FilelSize=getFileSize(file);
        LastMod=getLastMod(file);
        FileParant=getFileParant(file);
        FileType=getFileType(file);
        
    }
    
    public String getFileName(){
        return FileName;
    }
    
    public String getFileSize(File file){
        String size = "";
        
        if(file.length()>=1024){
                if(file.length()>=1024*1024){
                    if(file.length()>1024*1024*1024){
                        size=""+file.length()/1024/1024/1024+" Tb";    
                    }
                    size=file.length()/1024/1024+" Gb";    
                }
            size=file.length()/1024+" Mb";        
                }
        else
        size=file.length()+" byte";
        return size;
        }
    public String getLastMod(File file){
        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
        return sdf.format(file.lastModified()).toString();
    }
    
    public String getFileType(File file){
        String type = "";
        if(file.isDirectory()){
            type="Directory";
        }
        if(file.isFile()){
            type="File";
        }
        return type;
    }
    
    public String getFileParant(File file){
        return file.getParent();
    }
    
    public 
    
    /*public Actions getFileList(File[] fileList){
        for(File item: fileList){
            Actions.this.FileName=item.getName();
            Actions.this.FilelSize=getFileSize(item);
            Actions.this.LastMod=getLastMod(item);
        }
        return Actions.this;
    }*/
}
