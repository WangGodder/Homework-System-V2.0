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
	function downloadHomework(bt) {
		var studentId = bt.id.split("_")[1];
		var teachCourseId = $("#teachCourseId").val();
		var homeworkId = $("#homeworkId").val();
		
		$.ajax({
			url: "downloadHomework",
			type: "POST",
			data: {"homeworkId": homeworkId, "studentId": studentId},
			success: function(data) {
				$("#subpage").html(data);
			}, 
			error: function(data) {
				alert("错误，请重试");
			}
		});
	}
	function viewOnWeb(bt) {
		var studentId = bt.id.split("_")[1];
		var teachCourseId = $("#teachCourseId").val();
		var homeworkId = $("#homeworkId").val();
		
		$.ajax({
			url: "viewHomework",
			type: "POST",
			data: {"homeworkId": homeworkId, "studentId": studentId},
			success: function(data) {
				if (data == "empty") {
					alert("未找到该学生的作业");
					return;
				}
				if (data == "nondocx") {
					alert("作业文档不是docx格式，无法查看");
					return;
				}
				else {
					docxHtml = window.open("../page/viewDocx.html");
					docxHtml.document.write(data);
					docxHtml.focus();
				}
			}, 
			error: function() {
				alert("错误，请重试");
			}
		});
	}
	function saveScore() {
		var data = {};
		$(".score").each(function() {
			data[$(this).attr("studentid")] = $(this).val();
		})
		var homeworkId = $("#homeworkId").val();
		$.ajax({
			url: "saveScore/" + homeworkId,
			data: data,
			type: "POST",
			success: function(data) {
				if (data == "wrong") {
					alert("错误，请以教师身份操作");
				}
				if (data == "success") {
					alert("分数保存成功");
				}
			},
			error: function() {
				alert("错误");
			}
		})
	}
	function checkHomework(bt) {
		var studentId = bt.id.split("_")[1];
		var teachCourseId = $("#teachCourseId").val();
		var homeworkId = $("#homeworkId").val();
		$.ajax({
			url: "checkHomework",
			type: "post",
			data: {"homeworkId": homeworkId, "studentId": studentId},
			success: function(data) {
				$("#checkResult").modal("show");
				$("#checkContent").html(data);
				alert($("#checkResult").css())
			},
			error: function() {
				alert("错误");
			}
		})
	}
	</script>
</head>
<body class="childrenBody">
	<input type="hidden" name="homeworkId" value="${homework.getId() }">
	<input id="homeworkId" type="hidden" value="${homework.getId() }">
	<blockquote class="layui-elem-quote news_search">
		<h3>${homework.getName() }
		已提交${num}/${totalNum}
		<button style="float:right; margin-left: 50px;" onclick="saveScore()">保存成绩</button>
		<form action="downloadAllHomework" method="post"  style="float:right;">
			<input type="hidden" name="homeworkId" value="${homework.getId() }">
			<input type="submit" value="下载全部作业">
		</form>
		</h3>	
	</blockquote>
	<div class="layui-form users_list">
	  	<table class="layui-table">
		    <colgroup>
				<col width="18%">
				<col width="8%">
				<col width="18%">
				<col width="8%">
				<col width="20%">
				<col width="10%">
				<col width="10%">
				<col width="10%">
		    </colgroup>
		    <thead>
				<tr>
					<th>学号</th>
					<th>姓名</th>
					<th>提交时间</th>
					<th>评分</th>
					<th>评语</th>
					<th>下载</th>
					<th>在线查看</th>
					<th>查重</th>
				</tr> 
				<c:forEach var="info" items="${infos}" varStatus="status">
				<tr>
					<td>${info[0] }</td>
					<td>${info[1] }</td>
					<td>${info[2] }</td>
					<td><input style="width:80px;" id="score_${info[4]}" studentid="${info[4]}" class="score" type="number" value="${info[3]}"></td>
					<td>${info[5] }</td>
					<td><form action="downloadHomework" method="post">
						<input type="hidden" name="homeworkId" value="${homework.getId() }">
						<input type="hidden" name="studentId" value="${info[4] }">
						<input type="submit" value="下载作业">
					</form></td>
					<td><button id="view_${info[4] }" onclick="viewOnWeb(this)">在线查看</button></td>
					<td><button id="check_${info[4] }" onclick="checkHomework(this)">查重</button></td>
				</tr>
				</c:forEach>
		    </thead>
		    <tbody class="users_content"></tbody>
		</table>
	</div>
	<div id="page"></div>
	
	
	
	 <!-- Modal -->
      <div class="modal fade" id="checkResult" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div id="checkContent" class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalCenterTitle">Modal title</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              ...
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
            </div>
          </div>
        </div>
      </div>
</body>
</html>