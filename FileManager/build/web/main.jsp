<%-- 
    Document   : main
    Created on : 04.05.2017, 17:44:10
    Author     : monknax
--%>

<%@page import="classes.FileService"%>
<%@page import="classes.OpSys"%>
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
            File spath = FileService.getPath(request.getParameter("path"));
           
            %>
            Path <br>
            <input type="text" name="path" value="<%out.println(spath);%>" size="85"/>
            <input type="submit" value="Brows"/> <br>
            CreateFile<br>
            <input type="text" name="create" value="" size="15"/>
            <input type="submit" value="Create"/> <br>
            DeleteFile <br>
            <input type="text" name="delete" value="" size="15"/>
            <input type="submit" value="Delete"/> <br>
            FileName <br>
            <input type="text" name="file" value="test" size="15"/><br>
            CopyFileName <br>
            <input type="text" name="cfile" vlue="testcopy" size="15"/>
            <input type="submit" value="Copy"/><br>
            Rename<br>
            <input type="text" name="rename" value="" size="15"/>
            <input type="submit" value="Rename"/><br>
            <p>Вы находитесь здесь
                <%out.println(spath.getAbsolutePath());%>
            </p>
            <p>Для перехода к каталогу введите его имя</p>
            <%
                Actions.createFile(spath.getAbsolutePath().toString() + request.getParameter("create"));
                
                Actions.deleteFile(spath.getAbsolutePath().toString() + request.getParameter("daelete"));
                
                Actions.copyFile(spath.getAbsolutePath().toString() + request.getParameter("file"),request.getParameter("cfile"));
                
                Actions.renameFile(spath.getAbsolutePath().toString() + request.getParameter("rename"));
            
            //получаем список директорий и файлов
            if(spath.isDirectory()){%>
            <table border="1px" bgcolor="#FFFFCC" >
                <tr>
                    <th>Name</th>
                    <th>Size</th>
                    <th>Type</th>
                    <th>LastModified</th>
                    <th>Path</th>
                </tr>
                <%  
                        for(File item : spath.listFiles()){
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
                %>
                </td></tr> 
            </table>
    </form>            
    </body>
</html>
