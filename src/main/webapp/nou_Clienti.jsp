<%-- 
    Document   : nou_Pacient
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
        <title>Adauga client</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
            String Nume = request.getParameter("nume");
            String Prenume = request.getParameter("prenume");
            String Email = request.getParameter("email");
            String Data_Nasterii = request.getParameter("data_nastere");
            if (Nume != null) {
                jb.connect();
                jb.adaugaClienti(Nume, Prenume, Email, Data_Nasterii);
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
        <h1 class="adaugatext" align="center"> Adauga un nou client</h1>
        <form action="nou_Clienti.jsp" method="post">
            <table class="tabelCamereAdd" align="center">
                <tr>
                    <td>Nume Client:</td>
                    <td> <input class="inputbox" type="text" name="nume" size="30" /></td>
                </tr>
                <tr>
                    <td>Prenume Client:</td>
                    <td> <input class="inputbox" type="text" name="prenume" size="30" /></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td> <input class="inputbox" type="text" name="email" size="30" /></td>
                </tr>
                <tr>
                    <td>Data Nasterii:</td>
                    <td> <input class="inputbox" type="text" name="data_nastere" size="30" /></td>
                </tr>
            </table>
            <p align="center">
            <input class="addButton" type="submit" value="Adauga client" />
            </p>
        </form>
        <%
            }
        %>
        <br/>
        <br/>
    </body>
</html>