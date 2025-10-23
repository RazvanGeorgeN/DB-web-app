<%-- 
    Document   : m2_Consultatie
    Created on : Nov 14, 2016, 1:42:49 PM
    Author     : vali
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="stylerezmod.css">
    	<link href="https://fonts.googleapis.com/css?family=Montserrat:500,600,700" rel="stylesheet">
        <title>Tabela Rezervari</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center"> Tabela Rezervari</h1>
        <br/>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("idrezervare"));
            String idclient = request.getParameter("idclient");
            String idcamera = request.getParameter("idcamera");
            String CheckIn = request.getParameter("checkin");
            String CheckOut = request.getParameter("checkout");

            String[] valori = {idclient, idcamera, CheckIn, CheckOut};
            String[] campuri = {"idclient", "idcamera", "checkin", "checkout"};
            jb.modificaTabela("rezervari", "idrezervare", aux, campuri, valori);
            jb.disconnect();
        %>
        <h1 align="center">Modificarile au fost efectuate!</h1>
        <p align="center">
            <a class="addButton" href="index.html"><b>HOME</b></a>
            <br/>
    </body>
</html>