<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
 	<div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">作业查重情况 ${studentId}</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
    </div>
     <div class="modal-body">
       	<table style="text-align:center; width:100%;">
		<colgroup>
				<col width="30%">
				<col width="70%">
	    </colgroup>
		<tr>
			<th>学生姓名</th>
			<th>重复比例%</th>
		</tr>
		<c:forEach var="entry" items="${check.entrySet()}">
		<tr>
			<td>${entry.getKey() }</td>
			<td>${entry.getValue()}</td>
		</tr>
		</c:forEach>
		</table>
     </div>
     <div class="modal-footer">
         <button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
     </div>

</body>
</html>