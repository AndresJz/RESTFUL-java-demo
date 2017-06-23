<%-- 
    Document   : form
    Created on : 22/06/2017, 03:31:52 AM
    Author     : Andres
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Forms</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<body>
    <div align="center">
        <h1>New/Edit Entry</h1>
        <form:form action="saveMathematic" method="post" modelAttribute="mathematic" class="form-control">
            <table class="table">
                
            <tr>
                <form:hidden path="id"/>
                <td>Location</td>
                <td><form:input path="location" class="form-control" required="" /></td>
            </tr>
            <tr>
                <td>Indicator</td>
                <td><form:input path="indicator_m"class="form-control" required="" /></td>
            </tr>
            <tr>
                <td>Subject</td>
                <td><form:input path="subject" class="form-control" required=""/></td>
            </tr>
            <tr>
                <td>Measure</td>
                <td><form:input path="measure"class="form-control" required=""/></td>
            </tr>
            <tr>
                <td>Frequency</td>
                <td><form:input path="frequency" class="form-control" required=""/></td>
            </tr>
            <tr>
                <td>Times</td>
                <td><form:input path="times"class="form-control" required=""/></td>
            </tr>
            <tr>
                <td>Value</td>
                <td><form:input path="value_m" class="form-control" required=""/></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" class="form-control btn btn-info" value="Save"></td>
            </tr>
        </table>
        </form:form>
    </div>
</body>
</html>