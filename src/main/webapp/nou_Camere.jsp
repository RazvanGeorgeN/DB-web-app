<%-- 
    Document   : nou_Medic
    Created on : Nov 14, 2016, 1:08:21 PM
    Author     : vali
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styleadd.css">
    	<link href="https://fonts.googleapis.com/css?family=Montserrat:500,600,700" rel="stylesheet">
        <title>Adauga Camera</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
            String Capacitate = request.getParameter("capacitate");
            String Pret = request.getParameter("pret");
            if (Capacitate != null) {
                jb.connect();
                jb.adaugaCamera(Capacitate, Pret);
                jb.disconnect();
        %>
        <p>Datele au fost adaugate.</p>
        <p align="center">
        <a class="homeButton" href="index.html"><b>HOME</b></a>
        </p>
        <%
        } else {
        %>
        <a class="homeButton" href="index.html"><b>HOTEL AURORA</b></a>
        <h1 class="adaugatext" align="center" > Adauga o noua camera</h1>
        <form action="nou_Camere.jsp" method="post">
            <table class="tabelCamereAdd" align="center">
                <tr>
                    <td>Capacitate:</td>
                    <td> <input class="inputbox" type="text" name="capacitate" size="10" /></td>
                </tr>
                <tr>
                    <td>Pret:</td>
                    <td> <input class="inputbox" type="text" name="pret" size="10" /></td>
                </tr>
            </table>
            <p align="center">
            <input class="addButton" type="submit" value="Adauga camera" />
            </p>
        </form>
        <%
            }
        %>
        <br/>
        <br/>
    </body>
</html>