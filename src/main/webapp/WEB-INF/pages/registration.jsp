<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns:spring="http://www.springframework.org/tags" xmlns:form="http://www.springframework.org/tags/form">
<head>
    <title>Registration Form</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <style>
        span.error {
            color: red;
            display: inline-block;
        }
    </style>

</head>
<body>
<div class="container">
    <span><spring:message code="lang.change"/></span>:
    <select id="locales">
        <option selected><spring:message code="lang.default"/></option>
        <option value="en"><spring:message code="lang.en"/></option>
        <option value="ar"><spring:message code="lang.ar"/></option>
    </select>
    <form:form method="post" modelAttribute="user">
        <div class="from-row md-4">
            <label for="firstName"><spring:message code="user.firstName"/></label>
            <form:input path="firstName" cssClass="form-control" id="firstName"/>
            <form:errors path="firstName" cssClass="error"/>
        </div>
        <div class="from-row">
            <label for="lastName"><spring:message code="user.lastName"/> </label>
            <form:input path="lastName" cssClass="form-control" id="lastName"/>
            <form:errors path="lastName" cssClass="error"/>
        </div>

        <div>
            <label for="salary"><spring:message code="user.salary"/> </label>
            <form:input path="salary" cssClass="form-control" id="salary" type="number" min="0" step="1"/>
            <form:errors path="salary" cssClass="error"/>
        </div>
        <br>
        <input type="submit" value="add user">
    </form:form>

</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js">
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#locales").change(function () {
            var selectedOption = $('#locales').val();
            if (selectedOption != '') {
                window.location.replace('registration.htm?lang=' + selectedOption);
            }
        });
    });
</script>
</html>
