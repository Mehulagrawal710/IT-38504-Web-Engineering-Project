<%@page import="java.util.ArrayList"%>
<%@page import="code.GeneratingDirectObservation"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Swachh Survekshan</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" type="text/css" media="screen and (min-width: 840px)" href="stylefeedhome2.css">
		<link rel="stylesheet" media="screen and (max-width: 840px)" href="stylefeedhome.css">
		<link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
</head>
<body>

<%
	GeneratingDirectObservation test=new GeneratingDirectObservation();
ArrayList questions= test.showques("2");
%>
<form action="Direct_Observation_Response" method="post">
<div id="citizen-feedback" class="content-block">
<h1 align="center" class="ques_head">Certification</h1>

<b>Enter City :</b><span class="req">*</span> <input type="text" name="city" required > <br><br><br>
<c:forEach items="<%=questions %>" var="question">

	&nbsp;&nbsp;&nbsp;<b>${question.ques}.${question.question }<span class="req">*</span></b>
	<br>
	<%
	ArrayList options=test.showoptions();%>
	<div class="options">
	<c:forEach  items="<%=options %>" var="option">
	<c:choose>
	<c:when test="<%=test.ques_no==3  %>">
		&nbsp;&nbsp;&nbsp;<input type="checkbox" name=${option.question_category} value=${option.marks} >${option.option_name}
		<br>
	</c:when>
	<c:when test="<%=test.ques_no==9  %>">
		&nbsp;&nbsp;&nbsp;<input type="checkbox" name=${option.question_category} value=${option.marks}  >${option.option_name}
		<br>
	</c:when>
	<c:otherwise>
	&nbsp;&nbsp;&nbsp;<input type="radio" name=${option.question_category} value=${option.marks} required >${option.option_name}
	
	<br>
	</c:otherwise>
	</c:choose>
	
	
	<br>
	
	</c:forEach>
	</div>
</c:forEach>
<input type="submit" value="Submit">
</div>
</form>
</body>
</html>