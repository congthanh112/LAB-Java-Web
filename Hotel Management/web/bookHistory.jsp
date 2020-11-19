<%-- 
    Document   : bookHistory
    Created on : Oct 28, 2020, 7:14:39 PM
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
        <h1>Your Booking History</h1>
        <c:set var="bkList"  value="${requestScope.BK_LIST}" />
        <div>
            ${requestScope.MSGRESPONSE}
        </div>
        <form action="showBookingHistory">
            Booking ID: <input type="text"  name="bkID" />
            Booking Date: <input type="date" name="bkDate" />
            <input type="submit" value="Search" />
            <input type="reset" value="Reset"/>
        </form>

        <c:forEach items="${bkList}"  var="bk">
            <div>
                <h3>ID: ${bk.bookID}</h3>
                <div>
                    Book Date: ${bk.createdAt}
                </div>
                <div>
                    Total Cart: $${bk.total}
                </div>
                <div>
                    Status: ${bk.status}
                </div>
                <div>
                    User confirmed: ${bk.userConfirmed ? 'Yes' : 'No'}
                </div>
                <c:if test="${bk.status eq 'pending'}">
                    <form action="deleteBooking" onsubmit="return confirm('Are you really want to cancle this booking?')">
                        <input type="hidden" name="bkID" value="${bk.bookID}" />
                        <input type="submit" value="Cancle Booking" />
                    </form>
                </c:if>
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
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${bk.detailList}" var="detail">
                            <tr>
                                <td>${detail.hotelName}</td>
                                <td>${detail.roomType}</td>
                                <td>${detail.amount}</td>
                                <td>$${detail.price}</td>
                                <td>$${detail.total}</td>
                                <td>${detail.checkIn}</td>
                                <td>${detail.checkOut}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:forEach>
    </body>
</html>
