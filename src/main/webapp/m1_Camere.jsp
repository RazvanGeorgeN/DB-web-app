<%-- 
    Document   : m1_Medic
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
        <title>Tabela Camere</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
    <a class="homeButton" href="index.html"><b>HOTEL AURORA</b></a>
    <p class="titlutop">
        <h1 align="center">Tabela Camere</h1>
        </p>
        
        <br/>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceLinieDupaId("camere", "idcamera", aux);
            rs.first();
            int Capacitate = rs.getInt("capacitate");
            int Pret = rs.getInt("pret");
            rs.close();
            jb.disconnect();
        %>
        <form action="m2_Camere.jsp" method="post">
            <table class="tabelCamereAdd" align="center">
                <tr>
                    <td align="left">IdCamera:</td>
                    <td> <input class="inputbox" type="text" name="idcamera" size="10" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="left">Capacitate:</td>
                    <td> <input class="inputbox" type="text" name="capacitate" size="10" value="<%= Capacitate%>"/></td>
                </tr>
                <tr>
                    <td align="left">Pret $:</td>
                    <td> <input class="inputbox" type="text" name="pret" size="10" value="<%= Pret%>"/></td>
                </tr>
            </table><p align="center">
                <input class="addButton" type="submit" value="Modifica linia">
            </p>
        </form>
            <br/>
    </body>
</html>