<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
	<blockquote class="layui-elem-quote news_search">
		<h3>操作日志</h3>
	</blockquote>
	<table class="table">
		<colgroup>
				<col width="10%">
				<col width="20%">
				<col width="10%">
				<col width="10%">
				<col width="10%">
	    </colgroup>
		<thead class="thead-light">
		  <tr>
			<th>操作类型</th>
			<th>操作内容</th>
			<th>操作时间</th>
			<th>操作ID</th>
			<th>来源IP</th>
		  </tr>
		</thead>
		<tbody>
			<c:forEach var="log" items="${logs}" varStatus="status">
					<tr>
						<td>${log.printType()}"</td>
						<td>${log.getContent() }</td>
						<td>${log.getTime() }</td>
						<td>${log.getOperatorId() }</td>
						<td>${log.getIP() }</td>
					</tr>
			</c:forEach>
		</tbody>
	</table>

	
</html>