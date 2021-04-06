<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	/**
		path是以/开头，不以/结尾
		http://localhost:3306/ssm-crud
		path=http://localhost:3306
	*/
	pageContext.setAttribute("path", request.getContextPath());
%>
	<!-- 引入样式 -->
	<link href="${path}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
		rel="stylesheet">
	<!-- 引入jQuery -->
	<script src="${path}/static/js/jquery-1.7.2.min.js"></script>
	<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
	<script src="${path}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

</head>
<body>
<div class="container">
	<!-- 标题 -->
	<div class="row">
		<div class="col-md-12">
			<h1>SSM-CRUD</h1>
		</div>
	</div>
	
	<!-- 按钮 -->
	<div class="row">
		<div class="col-md-4 col-md-offset-8">
			<button type="button" class="btn btn-primary">新增</button>
			<button type="button" class="btn btn-danger">删除</button>
		</div>
	</div>
	
	<!-- 显示表格数据 -->
	<div class="row"></div>
		<div class="col-md-12">
			<table class="table table-hover">
	 			<tr>
					<th>#</th>
					<th>姓名</th>
					<th>性别</th>
					<th>邮件</th>
					<th>部门</th>
					<th>操作</th>
				</tr> 
				<c:forEach items="${pageInfo.list}"  var="emp">
					<tr>
						<th>${emp.empId}</th>
						<th>${emp.empName}</th>
						<th>${emp.gender=="m"?"男":"女"}</th>
						<th>${emp.email}</th>
						<th>${emp.dept.deptName}</th>
						<th>
							<button type="button" class="btn btn-primary btn-sm">
								<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
								编辑
							</button>
							<button type="button" class="btn btn-danger btn-sm">
								<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
								删除
							</button>
						</th>
					</tr>			
				</c:forEach>
			</table> 

		</div>
	<!-- 显示分页信息 -->
	<div class="row ">
		<div id="page_bar" class="row col-md-6">
			当前是${pageInfo.pageNum}页, 总共${pageInfo.pages}页, 总共${pageInfo.total}条记录
		</div>
		
		<div class="row col-md-6">
			<nav aria-label="Page navigation">
			  <ul class="pagination">

			  <li><a href="${path}/emps?pn=1">首页</a></li>


			  <c:if test="${pageInfo.pageNum>1}">
			    <li>
			      <a href="${path}/emps?pn=${pageInfo.prePage}" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			    
			   </c:if>
					<c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
						<c:if test="${page_Num==pageInfo.pageNum}">
							<li class="active"><a href="#">${page_Num}</a></li>
						</c:if>					
						<c:if test="${page_Num!=pageInfo.pageNum}">
							<li><a href="${path}/emps?pn=${page_Num}">${page_Num}</a></li>
						</c:if>
						
					</c:forEach>
				<c:if test="${pageInfo.pageNum<pageInfo.pages}">
					<li>
				      <a href="${path}/emps?pn=${pageInfo.nextPage}" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				</c:if>

				<li><a href="${path}/emps?pn=${pageInfo.pages}">末页</a></li>

			  </ul>
			</nav>
		</div>
		
	</div>

</div>

		
</body>
</html>