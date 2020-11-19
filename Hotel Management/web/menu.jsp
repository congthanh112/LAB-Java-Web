<%-- 
    Document   : menu
    Created on : Oct 27, 2020, 8:08:22 AM
    Author     : Apple
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav>
    <c:if test="${not empty sessionScope.AUTHUSER}">
        <span>
            Welcome ${sessionScope.AUTHUSER.name}
        </span>
        <a href="logout">Logout</a>
        <a href="searchRoom">Home</a>
        <a href="showBookingHistory">History</a>
    </c:if>
    <c:if test="${empty sessionScope.AUTHUSER}">
        <a href="registration.jsp">Register</a>
        <a href="login.jsp">Login</a>
    </c:if>

    <c:if test="${sessionScope.AUTHUSER ne null and sessionScope.AUTHUSER.role ne 'admin'}">
        <a href="showCart">Cart</a>
    </c:if>
</nav>