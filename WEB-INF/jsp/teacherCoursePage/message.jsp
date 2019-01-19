<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/message.js"></script>
</head>
<body>
	<div class="layui-form users_list">
	  	<table class="layui-table">
		    <colgroup>
				<col width="10%">
				<col width="20%">
				<col width="10%">
				<col width="10%">
				<col width="10%">
				<col width="10%">
		    </colgroup>
		    <thead>
				<tr>
					<th>消息名称</th>
					<th>消息内容</th>
					<th>发布日期</th>
					<th>编辑消息</th>
					<th>删除消息</th>
				</tr> 
				<c:forEach var="message" items="${messages}" varStatus="status">
				<tr>
					<td><input id="name_${message.getId() }" type="text" value="${message.getName() }"></td>
					<td><input id="info_${message.getId() }" type="text" value="${message.getInfo() }"></td>
					<td>${message.getDate() }</td>
					<td><button id="editor_${message.getId()}" onclick="editorMessage(this)">编辑消息</button></td>										
					<td><button class="btn btn-danger" id="delete_${message.getId()}" onclick="deleteMessage(this)">删除消息</button></td>
				</tr>
				</c:forEach>
				<tr>
					<td><input id="name_new" type="text" ></td>
					<td><input id="info_new" type="text" ></td>
					<td></td>
					<td></td>
					<td><button id="addHomework" onclick="addMessage()">添加消息</button></td>

				</tr>
		    </thead>
		    <tbody class="users_content"></tbody>
		</table>
	</div>
</body>
</html>