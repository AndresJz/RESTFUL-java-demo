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
<title>New/Edit Entry</title>
</head>
<body>
    <div align="center">
        <h1>New/Edit Entry</h1>
        <form:form action="saveMathematic" method="post" modelAttribute="mathematic">
        <table>
            <form:hidden path="id"/>
            <tr>
                <td>Location</td>
                <td><form:input path="location" /></td>
            </tr>
            <tr>
                <td>Indicator</td>
                <td><form:input path="indicator_m" /></td>
            </tr>
            <tr>
                <td>Subject</td>
                <td><form:input path="subject" /></td>
            </tr>
            <tr>
                <td>Measure</td>
                <td><form:input path="measure" /></td>
            </tr>
            <tr>
                <td>Frequency</td>
                <td><form:input path="frequency" /></td>
            </tr>
            <tr>
                <td>Times</td>
                <td><form:input path="times" /></td>
            </tr>
            <tr>
                <td>Value</td>
                <td><form:input path="value_m" /></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" value="Save"></td>
            </tr>
        </table>
        </form:form>
    </div>
</body>
</html>