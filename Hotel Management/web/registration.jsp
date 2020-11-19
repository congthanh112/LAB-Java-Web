<%-- 
    Document   : registration
    Created on : Oct 27, 2020, 8:12:38 AM
    Author     : Apple
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="menu.jsp" />
        <h1>Register</h1>
        <c:set var="err" value="${requestScope.AUTHUSER_ERROR}" />
        <div>
            ${requestScope.MSGRESPONSE}
        </div>
        <div style="font-weight: bold">
            <c:if test="${not empty err}">
                <c:forEach var="field" items="${err['class'].declaredFields}">
                    <div>${err[field.name]}</div>
                </c:forEach>
            </c:if>
        </div>
        <form action="register" method="POST">
            <div>
                Email: <input type="text" name="email" value="${param.email}" />
            </div>
            <div>
                Phone Number: <input type="text" name="phone" value="${param.phone}" />
            </div>
            <div>
                Password: <input type="password" name="password"  />
            </div>
            <div>
                Confirm Password: <input type="password" name="confirm" />
            </div>
            <div>
                Full Name: <input type="text" name="name" value="${param.name}" />

            </div>
            <div>
                Address: <input type="text" name="address" value="${param.address}" />
            </div>

            <div>
                <input type="submit" value="Register Account" />
            </div>
        </form>
    </body>
</html>
