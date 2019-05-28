<%@page import="java.util.ArrayList"%>
<%@page import="booking.Booking"%>
<%@page import="booking.BookingDAO"%>
<%@page import="java.util.List"%>
<HTML>
<HEAD>
<TITLE>Admin page</TITLE>
</HEAD>
<META http-equiv="Content-Type" content="text/html; charset=UTF-8">
<BODY>
	<h1>Admin informations :</h1>
	
	<h2>Bookings on Air Asmus:</h2>
	<%
	BookingDAO bookingDAO = new BookingDAO();
	
	ArrayList<Booking> liste = bookingDAO.findAll();
	//do it with a table > better

	%>
	<table>
	<tr><th>Booking ID</th><th>FlightID</th><th>Category</th><th>Insurance</th>       </tr>
	<% for (Booking booking : liste) {%>
		<tr>
			<td> <%=booking.getBookingID()%></td>
			<td> <%=booking.getFlightid() %></td>
			<td> <%=booking.getCategory() %></td>
			<td> <%=booking.getInsurance() %></td>
		</tr>
	<%
	}
	%>
	</table>
</BODY>
</HTML>
