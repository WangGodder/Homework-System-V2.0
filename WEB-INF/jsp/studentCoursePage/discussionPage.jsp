<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function submitDiscussion() {
		var teachCourseId = $("#teachCourseId").val();
		var discussion = $("#discussion").val();
		$.ajax({
			url: "submitDiscussion",
			data: {"teachCourseId": teachCourseId, "discussion": discussion},
			type: "POST",
			success: function(data) {
				if (data == "sensitiveWord") {
					alert("讨论中不可出现敏感词汇");
					$("#discussion").val("");
				}
				if (data == "success") {
					alert("发布成功");
					goDiscussion();
				}
			},
			error : function() {
				alert("错误发生");
			}
		})
	}
</script>
</head>
<body>	
	<c:forEach var="info" items="${discussions}">
		<div class="discussionBox" style="margin: 20px;">
			<p style="margin-bottom: 0px;"><strong style="font-size: 20px;">${info[0] }</strong>&nbsp;<small>${info[1] }</small></p>
			<p style="margin-top: 0px">${info[2] }</p>
		</div>
	</c:forEach>
	<h3>留言：</h3>
	<textarea name="discussion" id="discussion" cols="30" rows="4"></textarea>
	<br>
	<a style="margin-left: 90px" class="btn btn-primary btn-large" href="javascript:submitDiscussion()">提交</a>
</body>
</html>