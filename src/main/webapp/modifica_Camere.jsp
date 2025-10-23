<%-- 
    Document   : modifica_Consultatie
    Created on : Nov 14, 2016, 1:36:40 PM
    Author     : vali
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="style1.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:500,600,700" rel="stylesheet">
        <title>Tabela Camere</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
    <a class="homeButton" href="index.html"><b>HOTEL AURORA</b></a>
        <h1 align="center"> Tabela Camere</h1>
        <br/>
        <p align="center"><a class="adaugaButon" href="nou_Camere.jsp"><b>Adauga o noua camera</b></a></p>
        <form action="m1_Camere.jsp" method="post">
            <table class="tabelCamere" align="center">
                <tr>
                    <td><b>Mark</b></td>
                    <td><b>IdCamera</b></td>
                    <td><b>Capacitate</b></td>
                    <td><b>Pret $</b></td>
                </tr>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeTabela("camere");
                    long x;
                    while (rs.next()) {
                        x = rs.getLong("idcamera");
                %>
                <tr>
                    <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td>
                    <td><%= x%></td>
                    <td><%= rs.getInt("capacitate")%></td>
                    <td><%= rs.getInt("pret")%></td>
                    <%
                        }
                    %>
                </tr>
            </table><br/>
            <p align="center">
                <input class="addButton" type="submit" value="Modifica linia">
            </p>
        </form>
        <%
    jb.disconnect();%>
        <br/>
    </body>
</html>