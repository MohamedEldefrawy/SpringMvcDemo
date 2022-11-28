<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html xmlns:spring="http://www.springframework.org/tags">
<!DOCTYPE html>
<html lang="en">
<head>
    <title>all users</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
</head>
<body class="container">
<span><spring:message code="lang.change"/></span>:
<select id="locales">
    <option selected><spring:message code="lang.default"/></option>
    <option value="en"><spring:message code="lang.en"/></option>
    <option value="ar"><spring:message code="lang.ar"/></option>
</select>
<table class="table">
    <thead class="table table-dark">
    <tr>
        <td>firstName</td>
        <td>lastName</td>
        <td>salary</td>
    </tr>
    </thead>
    <tbody>
    <c:if test="${!empty users}">
        <c:forEach var="user" items="${users}">
            <tr>
                <td>${user.firstName}</td>
                <td>${user.lastName}</td>
                <td>${user.salary}</td>
            </tr>
        </c:forEach>

    </c:if>
    </tbody>

</table>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js">
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#locales").change(function () {
            console.log("fired");
            var selectedOption = $('#locales').val();
            if (selectedOption != '') {
                window.location.replace('users.htm?lang=' + selectedOption);
            }
        });
    });
</script>
</html>
