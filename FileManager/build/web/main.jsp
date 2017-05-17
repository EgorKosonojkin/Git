<%-- 
    Document   : main
    Created on : 04.05.2017, 17:44:10
    Author     : monknax
--%>

<%@page import="classes.Actions"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <form name="leftForm" action="main.jsp" method="POST" target="leftForm">
            
            
            <% request.setCharacterEncoding("UTF-8");
            // определяем объект для каталога
            String spath = request.getParameter("path");
            File f = new File(spath+"/");
            %>
            <input type="text" name="path" value="<%out.println(spath);%>" size="85"/>
            <input type="submit" value="Brows"/>
            <input type="text" name="create" value="" size="15"/>
            <input type="submit" value="Create"/>
            <input type="text" name="delete" value="" size="15"/>
            <input type="submit" value="Delete"/>
            
            <p>Вы находитесь здесь
                <%out.println(f.getAbsolutePath());%>
            </p>
            <p>Для перехода к каталогу введите его имя</p>
            <%//получаем список директорий и файлов
            if(f.isDirectory()){%>
            <table border="1px" bgcolor="#FFFFCC" >
                <tr>
                    <th>Name</th>
                    <th>Size</th>
                    <th>Type</th>
                    <th>LastModified</th>
                    <th>Path</th>
                </tr>
                <%  
                        for(File item : f.listFiles()){
                        Actions action = new Actions(item);    
                %>
                <tr><td>
                        <%
                            out.println(action.getFileName());//имя файла
                        %> 
                </td>
                <td align="right">    <% 
                            out.println(action.getFileSize(item));//размер файла
                        %>
                </td>
                <td>    <% 
                            out.println(action.getFileType(item));//тип файла
                        %>
                </td>
                <td>
                        <%
                            out.println(action.getLastMod(item));//дата последнего изменения
                        %>
                </td>
                <td>    <% 
                            out.println(action.getFileParant(item)); //путь к файлу
                        }
                }
                
                Actions.createFile(spath + request.getParameter("create"));
                
                Actions.deleteFile(spath + request.getParameter("delete"));
                
                %>
                </td></tr> 
            </table>
    </form>            
    </body>
</html>
