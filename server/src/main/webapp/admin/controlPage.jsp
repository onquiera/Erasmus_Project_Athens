<%@page import="connexion.UsersDAO"%>
<%@page import="connexion.Users"%>
<%@page import="java.util.List"%>
<HTML>
<HEAD>
<TITLE>Admin page</TITLE>
</HEAD>
<META http-equiv="Content-Type" content="text/html; charset=UTF-8">
<BODY>
	<h1>Admin informations :</h1>
	<h2>Users signed in to Air  Asmus : </h2>
	<h4>precision on genre : 0 = woman, 1 = man, 2 = other</h4>
	<%
	UsersDAO dao = new UsersDAO();
	
	List<Users> liste = dao.findAll();

	for (Users users : liste) {
		out.println("<p>"+users.toString()+"</p>");
	}
	%>
</BODY>
</HTML>
