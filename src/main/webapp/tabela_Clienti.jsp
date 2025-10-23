<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="style1.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:500,600,700" rel="stylesheet">
<title>Tabela Clienti</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<a class="homeButton" href="index.html"><b>HOTEL AURORA</b></a>
	<h1 align="center">Tabela Clienti</h1>
	<br />
	<p align="center">
		<a class="adaugaButon" href="nou_Clienti.jsp"><b>Adauga un nou client</b></a>
	</p>
	<form action="sterge_Clienti.jsp" method="post">
		<table class="tabelClienti" align="center">
			<tr>
				<td><b>Select</b></td>
				<td><b>IdClient</b></td>
				<td><b>Nume</b></td>
				<td><b>Prenume</b></td>
				<td><b>Email</b></td>
				<td><b>DataNastere</b></td>

			</tr>
			<%
                    jb.connect();
                    ResultSet rs = jb.vedeTabela("clienti");
                    long x;
                    while (rs.next()) {
                        x = rs.getInt("idclient");
                %>
			<tr>
				<td><input type="checkbox" name="primarykey" value="<%= x%>" /></td>
				<td><%= x%></td>
				<td><%= rs.getString("nume")%></td>
				<td><%= rs.getString("prenume")%></td>
				<td><%= rs.getString("email")%></td>
				<td><%= rs.getDate("data_nastere")%></td>
				<%
                        }
                    %>
			</tr>
		</table>
		<br />
		<p align="center">
			<input class="addButton" type="submit" value="Sterge liniile marcate">
		</p>
	</form>
	<%
            rs.close();
            jb.disconnect();
        %>
	<br />
</body>
</html>