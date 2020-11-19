<%-- 
    Document   : cart
    Created on : Oct 28, 2020, 4:08:07 PM
    Author     : Apple
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="menu.jsp"/>
        <h1>Your Cart</h1>
        <c:set var="items" value="${requestScope.ITEMS}"/>
        <c:set var="prices" value="${requestScope.PRICES}"/>
        <c:set var="total" value="${requestScope.TOTAL}"/>

        <c:if test="${empty items}">
            No cart found
        </c:if>

        <c:if test="${not empty items}">
            Total Cart: $${total}
            <form action="manageCart">
                <table border="1">
                    <thead>
                        <tr>
                            <th>Hotel Name</th>
                            <th>Room Type</th>
                            <th>Amount</th>
                            <th>Price</th>
                            <th>Total</th>
                            <th>Check In</th>
                            <th>Check Out</th>
                            <th>Select</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${items}">
                            <c:set var="rm" value="${item.key}" />
                            <tr>
                                <td>${rm.hotel.hotelName}</td>
                                <td>${rm.roomType}</td>
                                <td>${item.value}</td>
                                <td>$${rm.price}</td>
                                <td>$${prices[rm.roomID]}</td>
                                <td>${rm.checkIn}</td>
                                <td>${rm.checkOut}</td>
                                <td>
                                    <c:set var="selected" value="${false}" />
                                    <c:forEach var="x" items="${paramValues.selectedItem}">
                                        <c:if test="${x eq rm.roomID}">
                                            <c:set var="selected" value="${true}" />
                                        </c:if>
                                    </c:forEach>
                                    <input type="checkbox" name="selectedItem" value="${rm.roomID}" <c:if test="${selected eq true}">checked="true"</c:if> /> 
                                    </td>
                                </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div>
                    <input type="submit" name="operation" value="Increase Amount" />
                    <input type="submit" name="operation" value="Remove Room" onclick="alert('Are you sure to delete these rooms?')" />
                </div>
            </form>
            <div>
                <a href="checkout">Checkout</a>
            </div>
        </c:if>
    </body>
</html>
