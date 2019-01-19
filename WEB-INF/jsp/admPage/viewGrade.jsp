<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/bootstrap.css">
<script type="text/javascript">
function editorGrade(bt) {
	var id = bt.id;
	var info = $("#info_" + id).val();
	var name = $("#name_" + id).val();
	var year = $("#year_" + id).val();
	$.ajax({
		url: "editorGrade",
		type: "post",
		data: {"gradeId": id, "info": info, "name": name},
		success: function() {
			alert(id + "信息修改成功");
		},
		error: function() {
			alert("错误发生，请以管理员身份操作");
		}
	})
}
function addGrade() {
	var name = $("#newName").val();
	var info = $("#newInfo").val();
	$.ajax({
		url: "addNotice",
		data: {"name": name, "info": info},
		type: "POST",
		success: function() {
			alert("创建成功");
			viewTeacher();
		},
		error: function() {
			alert("错误,操作身份不是管理员");
		}
	})
}
</script>
</head>
<body>
	<blockquote class="layui-elem-quote news_search">
		<h3>班级名单</h3>
	</blockquote>
	<table class="table">
		<colgroup>
				<col width="10%">
				<col width="10%">
				<col width="30%">
				<col width="10%">
				<col width="10%">
	    </colgroup>
		<thead class="thead-light">
		  <tr>
			<th>班级ID</th>
			<th>班级姓名</th>
			<th>班级介绍</th>
			<th>班级人数</th>
			<th>修改班级</th>
		  </tr>
		</thead>
		<tbody>
			<c:forEach var="grade" items="${grades}" varStatus="status">
					<tr>
						<td>${grade.getId()}</td>
						<td><input style="width: 100%;" value="${grade.getName() }" id="name_${grade.getId() }" type="text"></td>
						<td><input style="width: 60%;" type="text" id="info_${grade.getId() }" value="${grade.getInfo() }"></td>
						<td>${nums[status.index]}</td>
						<td><button id="${grade.getId() }" class="btn btn-success"  onclick="editorgrade(this)">保存修改</button></td>
					</tr>
			</c:forEach>
			<tr>
				<td> </td>
				<td><input style="width: 100%;" id="newName" type="text"></td>
				<td><input style="width: 60%;" id="newInfo" type="text"></td>
				<td> </td>
				<td><button class="btn btn-primary"  id="addTeacher" onclick="addGrade()">创建课程</button>
			</tr>
		</tbody>
	</table>

	
</html>