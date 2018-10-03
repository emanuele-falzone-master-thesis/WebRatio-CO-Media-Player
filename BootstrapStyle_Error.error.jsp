<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="webratio" uri="http://www.webratio.com/2006/TagLib/JSP20" %>
<%@ page import="com.webratio.struts.WRGlobals" %>
<%@ page import="com.webratio.rtx.RTXManager" %>
<%@ page import="com.webratio.struts.exceptions.ErrorInterpreter" %> 
<% response.setHeader("X-UA-Compatible", "IE=edge"); %>
<%
  	RTXManager rtx = (RTXManager) application.getAttribute(WRGlobals.RTX_KEY); 
	ErrorInterpreter interpreter = new ErrorInterpreter(request);
	String baseURI = com.webratio.struts.Requests.newUriBuilder(request).setPath("/").setAbsolute(true).build();
%>
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	<base href="<%=baseURI.endsWith("/") ? baseURI : (baseURI + '/')%>"/>
	<title>Error</title>
  <c:if test="${not webratio:isWindow(pageContext)}">
	<link href="BootstrapStyle/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="BootstrapStyle/css/app.css" rel="stylesheet">
	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
		<script src="BootstrapStyle/assets/js/html5shiv.js"></script>
		<script src="BootstrapStyle/assets/js/respond.min.js"></script>
	<![endif]-->
  </c:if>
</head>
<body>
<c:if test="${not webratio:isWindow(pageContext)}">
<div class="container">
</c:if>
	<div class="page-header">
		<h1>An error occurred</h1>
		<p class="lead"><%=interpreter.getMessage(ErrorInterpreter.XML_FORMAT)%></p>
    </div>
    
    <% if (interpreter.hasOccurred()) { %>
		<h3>Occurred on:</h3>
		<p><%=interpreter.getOccurred()%></p>
	<% } %>
	<% if (interpreter.hasDetails()) { %>
		<h3>Details:</h3>
		<ul>
		<% for (java.util.Iterator it = interpreter.getDetails(ErrorInterpreter.XML_FORMAT).iterator(); it.hasNext(); ) { %>
			<li><%=it.next()%></li>
		<% } %>
		</ul>
	<% } %>
	<% if (interpreter.hasFixes()) { %>
		<h3>Suggestions:</h3>
		<ul>
		<% for (java.util.Iterator it = interpreter.getFixes(ErrorInterpreter.XML_FORMAT).iterator(); it.hasNext(); ) { %>
			<li><%=it.next()%></li>
		<% } %>
		</ul>
	<% } %>
	<%if(rtx.getConfiguration().isDevelopmentMode()){%>
	<!--
	<%=interpreter.getExceptionStackTrace(ErrorInterpreter.XML_FORMAT)%>
	-->
	<%}%>
<c:if test="${not webratio:isWindow(pageContext)}">
	<hr class="footer-bar"/>
	<footer class="copy-footer">
		<p class="text-center">Generated by <a href="http://www.webratio.com" target="_blank" title="High Productivity Web and Mobile App Dev Platform">WebRatio<sup>&reg;</sup></a></p>
	</footer>
</div>
</c:if>
</body>
</html> 
