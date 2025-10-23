<%-- 
    Document   : nou_Consultatie
    Created on : Nov 14, 2016, 1:08:21 PM
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
        <title>Adauga rezervare</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
            int idcamera, idclient;
            String id1, id2, Nume, Prenume, Email, Data_Nasterii, CheckIn, CheckOut;
            int Capacitate, Pret;
            id1 = request.getParameter("idcamera");
            id2 = request.getParameter("idclient");
            CheckIn = request.getParameter("checkin");
            CheckOut = request.getParameter("checkout");
            if (id1 != null) {
                jb.connect();
                jb.adaugaRezervare(java.lang.Integer.parseInt(id1), java.lang.Integer.parseInt(id2), CheckIn, CheckOut);
                jb.disconnect();
        %>
        <p>Datele au fost adaugate.</p>
        <p align="center">
        <a class="homeButton" href="index.html"><b>HOME</b></a>
        </p>
        <%
        } else {
        jb.connect();
        ResultSet rs1 = jb.vedeTabela("clienti");
        ResultSet rs2 = jb.vedeTabela("camere");
        %>
         <a class="homeButton" href="index.html"><b>HOTEL AURORA</b></a>
        <h1 align ="center"> Adauga o noua rezervare</h1>
        <form action="nou_Rezervari.jsp" method="post">
            <table align="center">
                <tr>
                   
                    <td> 
                        Selectati Clientul:
			<SELECT class="selectMenu" NAME="idclient">
                                <%
                                    while(rs1.next()){
                                        idclient = rs1.getInt("idclient");
                                        Nume = rs1.getString("nume");
                                        Prenume= rs1.getString("prenume");
                                        Email = rs1.getString("email");
                                        Data_Nasterii = rs1.getString("data_nastere");
                                %>
                                    <OPTION VALUE="<%= idclient%>"> <%= Nume%>,<%= Prenume%>,<%= Email%></OPTION>
                                <%
                                    }
                                %>
			</SELECT>
                    
                    </td>
                </tr>
                <tr>
                    
                    <td> 
                        Selectati Camera:
			<SELECT class="selectMenu" NAME="idcamera">
				<!-- OPTION selected="yes" VALUE="iris1">Iris 1</OPTION -->
                                <%
                                    while(rs2.next()){
                                        idcamera = rs2.getInt("idcamera");
                                        Capacitate = rs2.getInt("capacitate");
                                        Pret = rs2.getInt("pret");
                                %>
                                    <OPTION VALUE="<%= idcamera%>"><%= idcamera%>, <%= Capacitate%>,<%= Pret%></OPTION>
                                <%
                                    }
                                %>
			</SELECT>
                     </td>
                </tr>
                <tr class="tabelCamereAdd">
                    <td>Check In:</td>
                    <td> <input class="inputbox" type="text" name="checkin" size="30" /></td>
                </tr>
                <tr class="tabelCamereAdd">
                    <td>Check Out:</td>
                    <td> <input class="inputbox" type="text" name="checkout" size="30" /></td>
                </tr>
            </table>
            <p align="center">
            <input class="addButton" type="submit" value="Adauga rezervarea" />
            </p>
        </form>
        <%
            }
        %>
        <br/>
        <br/>
    </body>
</html>