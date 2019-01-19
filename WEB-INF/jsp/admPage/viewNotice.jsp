<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/bootstrap.css">
<script type="text/javascript">
function deleteNotice(bt) {
	var id = bt.id;
	$.ajax({
		url: "deleteNotice",
		type: "post",
		data: {"noticeId": id},
		success: function() {
			alert("删除成功");
		},
		error: function() {
			alert("错误发生，请以管理员身份操作");
		}
	})
}
function addNotice() {
	var name = $("#newName").val();
	var info = $("#newInfo").val();
	$.ajax({
		url: "addNotice",
		data: {"name": name, "info": info},
		type: "POST",
		success: function() {
			alert("发布公告成功");
			viewNotice();
		},
		error: function() {
			alert("错误，身份不是管理员");
		}
	})
}
</script>
</head>
<body>
	<blockquote class="layui-elem-quote news_search">
		<h3>教师名单</h3>
	</blockquote>
	<table class="table">
		<colgroup>
				<col width="10%">
				<col width="10%">
				<col width="30%">
				<col width="10%">
	    </colgroup>
		<thead class="thead-light">
		  <tr>
			<th>公告名称</th>
			<th>发布日期</th>
			<th>公告内容</th>
			<th>删除公告</th>
		  </tr>
		</thead>
		<tbody>
			<c:forEach var="notice" items="${notices}" varStatus="status">
					<tr>
						<td>${notice.getName()}</td>
						<td>${notice.getDate() }</td>
						<td>${notice.getInfo() }</td>
						<td><button id="${notice.getId() }" class="btn btn-danger" onclick="deleteNotice(this)">删除</button></td>
					</tr>
			</c:forEach>
			<tr>
				<td><input id="newName" type="text"></td>
				<td> </td>
				<td><input style="width: 60%;" id="newInfo" type="text"></td>
				<td><button class="btn btn-primary"  id="addNotice" onclick="addNotice()">发布公告</button>
			</tr>
		</tbody>
	</table>

	
</html>