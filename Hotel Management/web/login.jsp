<%-- 
    Document   : login
    Created on : Oct 27, 2020, 7:30:17 AM
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
        <jsp:include page="menu.jsp"/>
        <h1>Login</h1>
        <div>
            ${requestScope.MSGRESPONSE}
        </div>
        <form action="login" method="POST">
            Email: <input type="text" name="email" value="${param.email}"/>
            Password <input type="password" name="password"/>
            <input type="submit" value="Login" />
        </form>
    </body>
</html>
