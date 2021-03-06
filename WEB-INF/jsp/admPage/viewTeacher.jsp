<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/bootstrap.css">
<script type="text/javascript">
function editorInfo(bt) {
	var id = bt.id;
	var info = $("#info_" + id).val();
	$.ajax({
		url: "editorTeacherInfo",
		type: "post",
		data: {"teacherId": id, "info": info},
		success: function() {
			alert(id + "信息修改成功");
		},
		error: function() {
			alert("错误发生，请以管理员身份操作");
		}
	})
}
function addTeacher() {
	var teacherId = $("#newId").val();
	var name = $("#newName").val();
	var info = $("#newInfo").val();
	$.ajax({
		url: "addTeacher",
		data: {"teacherId": teacherId, "name": name, "info": info},
		type: "POST",
		success: function() {
			alert("创建成功,教师初始密码与ID相同");
			viewTeacher();
		},
		error: function() {
			alert("错误，老师ID重复或操作身份不是管理员");
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
			<th>教师ID</th>
			<th>教师姓名</th>
			<th>教师介绍</th>
			<th>修改介绍</th>
		  </tr>
		</thead>
		<tbody>
			<c:forEach var="teacher" items="${teachers}" varStatus="status">
					<tr>
						<td>${teacher.getId()}</td>
						<td>${teacher.getName() }</td>
						<td><input style="width: 60%;" type="text" id="info_${teacher.getId() }" value="${teacher.getInfo() }"></td>
						<td><button id="${teacher.getId() }" class="btn btn-success" onclick="editorInfo(this)">保存介绍</button></td>
					</tr>
			</c:forEach>
			<tr>
				<td><input id="newId" type="text"></td>
				<td><input id="newName" type="text"></td>
				<td><input style="width: 60%;" id="newInfo" type="text"></td>
				<td><button id="addTeacher" class="btn btn-primary" onclick="addTeacher()">创建老师</button>
			</tr>
		</tbody>
	</table>

	
</html>