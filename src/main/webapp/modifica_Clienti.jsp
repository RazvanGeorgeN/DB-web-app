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
        <title>Tabela Pacienti</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
    	<a class="homeButton" href="index.html"><b>HOTEL AURORA</b></a>
        <h1 align="center"> Tabela Clienti</h1>
        <br/>
        <p align="center"><a class="adaugaButon" href="nou_Clienti.jsp"><b>Adauga un nou client</b></a></p>
        <form action="m1_Clienti.jsp" method="post">
            <table class="tabelClienti" align="center">
                <tr>
                    <td><b>Mark</b></td>
                    <td><b>IdClient</b></td>
                    <td><b>Nume</b></td>
                    <td><b>Prenume</b></td>
                    <td><b>Email</b></td>
                    <td><b>Data Nasterii</b></td>
                </tr>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeTabela("clienti");
                    long x;
                    while (rs.next()) {
                        x = rs.getLong("idclient");
                %>
                <tr>
                    <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td>
                    <td><%= x%></td>
                    <td><%= rs.getString("nume")%></td>
                    <td><%= rs.getString("prenume")%></td>
                    <td><%= rs.getString("email")%></td>
                    <td><%= rs.getString("data_nastere")%></td>
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