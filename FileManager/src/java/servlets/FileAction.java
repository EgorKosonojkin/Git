/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author monknax
 */
public class FileAction extends HttpServlet {

    public static void ViewFileList(File file) throws IOException{
        if(file.isDirectory()){
            try{
        out.println("<table border='1px' bgcolor='#FFFFCC'>"
                + "<tr> "
                + "<th>Name</th>"
                + "<th>Size</th>"
                + "<th>LastModified</th>"
                + "</tr>");
            for(File item : file.listFiles()){
        out.println("<tr><td>");
            out.println(item.getName());// имя файла
        out.println("</td>"
                + "<td align='right'>");
                    //размер файла
            out.println(item.length()+" byte"); //не забыть написать нормальный метод
        out.println("</td>"
                + "<td>");
                    //дата поседней модификации
            out.println(item.lastModified());} //разобраться с переводом в нормальную дату
                }
            catch(Exception ex){
                out.println("<h2>Каталог не найден</h2>");
            }
        }
        if(file.isFile()){
            try{
            Runtime.getRuntime().exec(file.getName());
            }
            catch(IOException ex){
                out.println("<h2>Не удалось открыть файл</h2>");
            }
        }   
        out.println("</td></tr>"
                + "</table>");
    }
    
    public static String getFileSize(File file){
        String size = "";
        
        if(file.length()>=1024){
                if(file.length()>=1024*1024){
                    if(file.length()>=1024*1024*1024){
                    size=""+file.length()/1024/1024+"Gb";    
                    }
                size=file.length()/1024+"Mb";    
                }
        size=file.length()+"byte";        
                }
        return size;
        }
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
          
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

