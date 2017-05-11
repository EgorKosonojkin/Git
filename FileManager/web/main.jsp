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
            <input type="text" name="path" value="/" size="85"/>
            <input type="submit" value="Brows"/>
            
            <% request.setCharacterEncoding("UTF-8");
            // определяем объект для каталога
            File f = new File(request.getParameter("path")+"/");
            %>
            
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
                            out.println(action.getFileName());
                            // имя файла
                        %> 
                </td>
                <td align="right">    <% //размер файла
                            out.println(action.getFileSize(item)); 
                        %>
                </td>
                <td>    <% //тип файла
                            out.println(action.getFileType(item)); 
                        %>
                </td>
                <td>
                        <%//дата поседней модификации
                            out.println(action.getLastMod(item)); //разобраться с переводом в нормальную дату
                        %>
                </td>
                <td>    <% //тип файла
                            out.println(action.getFileParant(item)); 
                        }
                }%>
                </td></tr> 
            </table>
    </form>            
    </body>
</html>
