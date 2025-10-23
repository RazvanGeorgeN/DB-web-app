<%-- 
    Document   : tabela_Consultatie
    Created on : Nov 14, 2016, 1:03:20 PM
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
        <title>Tabela Rezervari</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
    	<a class="homeButton" href="index.html"><b>HOTEL AURORA</b></a>
        <h1 align="center"> Tabela Rezervari:</h1>
        <br/>
        <p align="center"><a class="adaugaButon" href="nou_Rezervari.jsp"><b>Adauga o noua rezervare.</b></a></p>
        <form action="sterge_Rezervari.jsp" method="post">
            <table class="tabelRezervari" align="center">
                <tr class="top_row_style">
                    <td><b>Select</b></td>
                    <td><b>IdRezervare</b></td>
                    <td><b>Camera</b></td>
                    <td><b>Capacitate</b></td>
                    <td><b>Pret$</b></td>
                    <td><b>Client</b></td>
                    <td><b>NumeClient</b></td>
                    <td><b>PrenumeClient</b></td>
                    <td><b>Email</b></td>
                    <td><b>Data_Nasterii</b></td>
                    <td><b>CheckIn</b></td>
                    <td><b>CheckOut</b></td>
                </tr>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeRezervare();
                    long x;
                    while (rs.next()) {
                        x = rs.getInt("idrezervare");
                %>
                <tr>
                    <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td><td><%= x%></td>
                    <td><%= rs.getInt("idcamera_rezerv")%></td>
                    <td><%= rs.getInt("Capacitate")%></td>
                    <td><%= rs.getInt("Pret")%></td>
                    <td><%= rs.getInt("idclient_rezerv")%></td>
                    <td><%= rs.getString("Nume")%></td>
                    <td><%= rs.getString("Prenume")%></td>
                    <td><%= rs.getString("Email")%></td>
                    <td><%= rs.getDate("Data_Nasterii")%></td>
                    <td><%= rs.getTimestamp("checkin")%></td>
                    <td><%= rs.getTimestamp("checkout")%></td>
                    <%
                        }
                    %>
                </tr>
            </table><br/>
            <p align="center">
                <input class="addButton" type="submit" value="Sterge liniile marcate">
            </p>
        </form>
        <%
            rs.close();
            jb.disconnect();
        %>
        <br/>
    </body>
</html>