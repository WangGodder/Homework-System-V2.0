<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="../css/studentCourse.css" media="all" />
	<script type="text/javascript">
	function deleteStudent(bt) {
		var studentId = bt.id.split("_")[1];
		var teachCourseId = $("#teachCourseId").val();
		$.ajax({
			url: "deleteStudent",
			type: "POST",
			data: {"teachCourseId": teachCourseId, "studentId": studentId},
			success: function(data) {
				alert(data + "已从本课程中删除");
				studentList();
			}, 
			error: function(data) {
				alert("错误，请重试");
			}
		});
	}
	function scoreStudent(bt) {
		var studentId = bt.id.split("_")[1];
		var usualScore = $("#usual_" + studentId).val();
		var teachCourseId = $("#teachCourseId").val();
		$.ajax({
			url: "usualScore",
			type: "POST",
			data: {"teachCourseId": teachCourseId, "studentId": studentId, "score": usualScore},
			success: function(data) {
				alert("修改成功");
				studentList();
			}, 
			error: function(data) {
				alert("错误，请重试");
			}
		});
	}
	function biggerScore(score) {
		var teachCourseId = $("#teachCourseId").val();
		$.ajax({
			url: "studentList",
			data: {"teachCourseId": teachCourseId, "bigger":score, "smaller":""},
			type: "POST",
			success: function (data) {
				$("#subpage").html(data);
			},
			error: function() {
				alert("错误发生,请输入数字");
			}
		})
	}
	function smallerScore(score) {
		var teachCourseId = $("#teachCourseId").val();
		$.ajax({
			url: "studentList",
			data: {"teachCourseId": teachCourseId, "bigger":"", "smaller":score},
			type: "POST",
			success: function (data) {
				$("#subpage").html(data);
			},
			error: function() {
				alert("错误发生,请输入数字");
			}
		})
	}
	function biggerBox() {
		var score = prompt("输入大于某一个值的分数", '');
		if (score != null) {
			biggerScore(score);
		}
	}
	function smallerBox() {
		var score = prompt("输入小于某一个值的分数", '');
		if (score != null) {
			smallerScore(score);
		}
	}
	function saveUsualScore() {
		var data = {};
		$(".usualScores").each(function() {
			data[$(this).attr("studentid")] = $(this).val();
		})
		var teachCourseId = $("#teachCourseId").val();
		$.ajax({
			url: "saveUsualScore/" + teachCourseId,
			type: "POST",
			data: data,
			success: function(data) {
				if (data == "success") {
					alert("保存成功");
					studengList();
				}
			},
			error: function() {
				alert("错误");
			}
		})
	}
	function createFinalScore() {
		var usualProp = prompt("输入平时成绩的分数占比（小数）", '0.3');
		if (usualProp != null) {
			var teachCourseId = $("#teachCourseId").val();
			$.ajax({
				url: "createFinalScore",
				type: "post",
				data: {"teachCourseId": teachCourseId, "usualProp":usualProp},
				success: function(data) {
					if (data == "success") {
						alert("操作成功");
						studentList();
					}
				},
				error: function() {
					alert("错误");
				}
			})
			
		}
		
	}
	</script>
</head>
<body class="childrenBody">
	<blockquote class="layui-elem-quote news_search">
		<h3>
		学生名单 
		<a href="javascript:biggerBox();" class="btn btn-primary" style="float:right; margin-left:5%;">获取成绩高于指定分数的名单</a>
		<a href="javascript:smallerBox();" class="btn btn-primary"  style="float:right; margin-left:5%;">获取成绩低于指定分数的名单</a>
		<a href="javascript:createFinalScore();" class="btn btn-primary"  style="float:right; margin-left:5%;">生成课程总成绩</a>
		<a href="javascript:saveUsualScore();" class="btn btn-primary"  style="float:right; margin-left:5%;">保存平时成绩</a>		
		</h3>
	</blockquote>
	<div class="layui-form users_list">
	  	<table class="layui-table">
		    <colgroup>
				<col width="10%">
				<col width="10%">
				<col width="10%">
				<col width="10%">
				<col width="10%">
				<col width="10%">
				<col width="10%">
				<col width="10%">
		    </colgroup>
		    <thead>
				<tr>
					<th>学号</th>
					<th>姓名</th>
					<th>班级</th>
					<th>平时成绩</th>
					<th>作业成绩</th>
					<th>最终成绩</th>
					<th>删除学生</th>
				</tr> 
				<c:forEach var="list" items="${studentList}" varStatus="status">
				<tr>
					<td>${list[0] }</td>
					<td>${list[1] }</td>
					<td>${list[2] }</td>
					<td><input type="number" studentid="${list[0]}" class="usualScores" value="${list[3] }"></td>
					<td>${list[4] }</td>									
					<td>${list[5] }</td>
					<td><button id="delete_${list[0]}" onclick="deleteStudent(this)">删除学生</button></td>
				</tr>
				</c:forEach>
		    </thead>
		    <tbody class="users_content"></tbody>
		</table>
	</div>
	<div id="page"></div>
</body>
</html>