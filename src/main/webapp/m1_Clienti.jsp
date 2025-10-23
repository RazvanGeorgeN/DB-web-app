<%-- 
    Document   : m1_Pacient
    Created on : Nov 14, 2016, 1:39:35 PM
    Author     : vali
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="stylerez.css">
    	<link href="https://fonts.googleapis.com/css?family=Montserrat:500,600,700" rel="stylesheet">
        <title>Tabela Clienti</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
     <a class="homeButton" href="index.html"><b>HOTEL AURORA</b></a>
        <h1 align="center">Tabela Clienti</h1>
        <br/>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceLinieDupaId("clienti", "idclient", aux);
            rs.first();
            String Nume = rs.getString("nume");
            String Prenume = rs.getString("prenume");
            String Email = rs.getString("email");
            String Data_Nasterii = rs.getString("data_nastere");
            rs.close();
            jb.disconnect();
        %>
        <form action="m2_Clienti.jsp" method="post">
            <table class="tabelCamereAdd" align="center">
                <tr>
                    <td align="left">IdClient:</td>
                    <td> <input class="inputbox" type="text" name="idclient" size="40" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="left">Nume:</td>
                    <td> <input class="inputbox" type="text" name="nume" size="40" value="<%= Nume%>"/></td>
                </tr>
                <tr>
                    <td align="left">Prenume:</td>
                    <td> <input class="inputbox" type="text" name="prenume" size="40" value="<%= Prenume%>"/></td>
                </tr>
                <tr>
                    <td align="left">Email:</td>
                    <td> <input class="inputbox" type="text" name="email" size="40" value="<%= Email%>"/></td>
                </tr>
                <tr>
                    <td align="left">Data Nasterii:</td>
                    <td> <input class="inputbox" type="text" name="data_nastere" size="40" value="<%= Data_Nasterii%>"/></td>
                </tr>
            </table><p align="center">
                <input class="addButton" type="submit" value="Modifica linia">
            </p>
        </form>
            <br/>
    </body>
</html>