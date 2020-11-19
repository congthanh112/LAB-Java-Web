<%-- 
    Document   : home
    Created on : Oct 27, 2020, 7:58:26 AM
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

        <c:set var="rmList" value="${requestScope.ROOM_LIST}"/>
        <h1>Home</h1>
        <div style="font-weight: bold">
            ${requestScope.MSGRESPONSE}
        </div>
        <div style="font-weight: bold">
            <c:forEach items="${requestScope.SEARCH_ERR}" var="err">
                <div>
                    ${err}
                </div>
            </c:forEach>
        </div>
        <form action="searchRoom">
            <div>
                Check In(*): <input type="date" name="checkIn" value="<c:out value="${param.checkIn}" default="${param.cartCheckIn}"/>" 
                                    id="checkIn" required/>
            </div>
            <div>
                Check Out(*): <input type="date" name="checkOut" value="<c:out value="${param.checkOut}" default="${param.cartCheckOut}" />"
                                     id="checkOut" required/>
            </div>
            <div>
                Hotel Name: <input type="text" name="hotelName" value="${param.hotelName}"  />
            </div>
            <div>
                Area: <input type="text" name="hotelArea" value="${param.hotelArea}" />
            </div>
            <div>
                Amount(*): <input type="number" name="amount" value="${param.amount}" required />
            </div>
            <div>
                <input type="submit" value="Search" />
            </div>
        </form>

        <c:if test="${empty rmList}">
            No room found.
        </c:if>
        <c:if test="${not empty rmList}">
            <div style="font-weight: bold">
                <c:forEach  items="${requestScope.BOOK_ERROR}" var="err">
                    <div>
                        ${err}
                    </div>
                </c:forEach>
            </div>
            <table border="1">
                <thead>
                    <tr>
                        <th>Hotel Name</th>
                        <th>Hotel Area</th>
                        <th>Type</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${rmList}" var="rm">
                        <tr>
                            <td>${rm.hotel.hotelName}</td>
                            <td>${rm.hotel.hotelArea}</td>
                            <td>${rm.roomType}</td>
                            <td>${rm.price}</td>
                            <td>${rm.quantity}</td>
                            <td>
                                <form action="addRoomToCart">
                                    <input type="hidden" name="roomID" value="${rm.roomID}" />
                                    <input type="hidden" name="cartCheckIn" class="cartCheckIn" value="${param.checkIn}" />
                                    <input type="hidden" name="cartCheckOut" class="cartCheckOut" value="${param.checkOut}" />
                                    <input type="hidden" name="q" value="${pageContext.request.queryString}"/>
                                    <input type="submit" value="Book"/>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous"></script>
        <script>
            $("#checkIn").on("change", (e) => {
                updateCheckInCart();
            })

            $("#checkOut").on("change", (e) => {
                updateCheckOutCart();
            })

            function updateCheckInCart() {
                $(".cartCheckIn").each(function (index, value) {
                    this.value = $("#checkIn").val();
                })
            }

            function updateCheckOutCart() {
                $(".cartCheckOut").each(function (index, value) {
                    this.value = $("#checkOut").val();
                })
            }

            $(document).ready((e) => {
                updateCheckInCart();
                updateCheckOutCart();
            })
        </script>
    </body>
</html>
