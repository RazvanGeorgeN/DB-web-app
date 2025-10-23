<%-- 
    Document   : sterge_Medic
    Created on : Nov 14, 2016, 1:32:42 PM
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
        <title>Tabela Camere</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
            String[] s = request.getParameterValues("primarykey");
            jb.connect();
            jb.stergeDateTabela(s, "camere", "idcamera");
            jb.disconnect();
        %>
         <p>Liniile selectate au fost sterse cu succes.</p>
        <p align="center">
             <a class="homeButton" href="index.html"><b>HOME</b></a>
            <br/>
        </p>
    </body>
</html>