<%-- 
    Document   : m1_Consultatie
    Created on : Nov 14, 2016, 1:39:35 PM
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
     <a class="homeButton" href="index.html"><b>HOTEL AURORA</b></a>
        <h1 align="center">Tabela Rezervari</h1>
        <br/>
        <%
            jb.connect();
            String Nume, Prenume, Email, Data_Nasterii, CheckIn, CheckOut;
			int Capacitate, Pret;
            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceRezervareId(aux);
            rs.first();
            int id1 = rs.getInt("idcamera_rezerv");
            int id2 = rs.getInt("idclient_rezerv");

            Nume = rs.getString("nume");
            Prenume = rs.getString("prenume");
            Email = rs.getString("email");
            Capacitate = rs.getInt("capacitate");
            Pret = rs.getInt("pret");
            CheckIn = rs.getString("checkin");
            CheckOut = rs.getString("checkout");

            ResultSet rs1 = jb.vedeTabela("camere");
            ResultSet rs2 = jb.vedeTabela("clienti");
            int idclient, idcamera;


        %>
        <form action="m2_Rezervari.jsp" method="post">
            <table align="center">
                <tr class="tabelCamereAdd">
                    <td class = "tablecell" align="right">IdRezervare:</td>
                    <td align="center"> <input class="inputboxmodif" type="text" name="idrezervare" size="10" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="left">Camera:</td>
                    <td> 
                        <SELECT class="selectMenu" NAME="idcamera">
                            <%
                                while (rs1.next()) {
                                    idcamera = rs1.getInt("idcamera");
                                    Capacitate = rs1.getInt("capacitate");
                                    Pret = rs1.getInt("pret");
                                    if (idcamera != id1) {
                            %>
                            <OPTION VALUE="<%= idcamera%>"><%= idcamera%>, <%= 	Capacitate%>, <%= Pret%></OPTION>
                                <%
                                        } else {
                                %>                
                            <OPTION selected="yes" VALUE="<%= idcamera%>"><%= idcamera%>, <%= Capacitate%>, <%= Pret%></OPTION>
                                <%
                                        }
                                    }
                                %>
                        </SELECT>

                    </td>
                </tr>
                <tr>
                    <td align="left">Client:</td>
                    <td> 
                        <SELECT class="selectMenu" NAME="idclient">
                            <%
                                while (rs2.next()) {
                                    idclient = rs2.getInt("idclient");
                                    Nume = rs2.getString("nume");
                                    Prenume = rs2.getString("prenume");
                                    Email = rs2.getString("email");
                                    Data_Nasterii = rs2.getString("data_nastere");
                            if (idclient != id2) {
                            %>
                            <OPTION VALUE="<%= idclient%>"><%= idclient%>, <%= Nume%>, <%= Prenume%>, <%= Email%>, <%= Data_Nasterii%></OPTION>
                                <%
                                        } else {
                                %>                
                            <OPTION selected="yes" VALUE="<%= idclient%>"><%= idclient%>, <%= Nume%>, <%= Prenume%>, <%= Email%>, <%= Data_Nasterii%></OPTION>
                                <%
                                        }
                                    }
                                %>
                        </SELECT>

                    </td>
                </tr>
                <tr class="tabelCamereAdd">
                    <td class = "tablecell"  align="left">Check In:</td>
                    <td align="right"> <input class="inputbox" type="text" name="checkin" size="30" value="<%= CheckIn%>"/></td>
                </tr>
                <tr class="tabelCamereAdd">
                    <td class = "tablecell"  align="left">Check Out:</td>
                    <td align="right"> <input class="inputbox" type="text" name="checkout" size="30" value="<%= CheckOut%>"/></td>
                </tr>
            </table><p align="center">
                <input class="addButton" type="submit" value="Modifica linia">
            </p>
        </form>
            <br/>
    </body>
    <%
        rs.close();
        rs1.close();
        rs2.close();
        jb.disconnect();
    %>
</html>