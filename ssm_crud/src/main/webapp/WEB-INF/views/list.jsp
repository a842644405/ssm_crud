<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>员工列表 </title>
	<script type="text/javascript" src="static/js/jquery-3.4.1.js"></script>
	<link rel="stylesheet" type="text/css" 
	href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
	<script type="text/javascript" src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
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
	  
	<!-- 表格数据 -->
	<div class="row">
		<div class="col-md-12">
			<table class="table table-hover" >
				<tr>
					<th>#</th>
					<th>empName</th>
					<th>gender</th>
					<th>email</th>
					<th>department</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${pageInfo.list }" var="emp">
					<tr>
						<th>${emp.empId }</th>
						<th>${emp.empName }</th>
						<th>${emp.gender=="M"?"男":"女" }</th>
						<th>${emp.email}</th>
						<th>${emp.department.deptName }</th>
						<th>
							<button class="btn btn-primary btn-sm"> 	
							<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
							编辑
							</button>
							<button class="btn btn-danger btn-sm">
							<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
							删除
							</button>
						</th>
					</tr>
				</c:forEach>
				
			</table>
		</div>
	</div>
	
	<!-- 分页 -->
	<div class="row">
		<!-- page info -->
		<div class="col-md-6">
			当前${pageInfo.pageNum }页,共${pageInfo.pages }页，共${pageInfo.total }记录
		</div>
		<!-- page nav -->
		<div class="col-md-6">
			<nav aria-label="Page navigation">
			  <ul class="pagination">
			  	<li><a href="${pageContext.request.contextPath}/emps?pn=1">首页</a></li>
			  	<c:if test="${pageInfo.hasPreviousPage }">
			  		 <li>
				      <a href="${pageContext.request.contextPath}/emps?pn=${pageInfo.pageNum-1}" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
			  	</c:if>
			   
			    <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
				    <c:if test="${page_Num == pageInfo.pageNum }">
				    	 <li class="active"><a href="#">${page_Num }</a></li>
				    </c:if> 
				    	    <c:if test="${page_Num != pageInfo.pageNum }">
				    	 <li><a href="${pageContext.request.contextPath}/emps?pn=${page_Num }">${page_Num }</a></li>
				    </c:if> 
				   
			    </c:forEach>
			    
			    <c:if test="${pageInfo.hasNextPage }">
		    	    <li>
				      <a href="${pageContext.request.contextPath}/emps?pn=${pageInfo.pageNum+1}" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
			    </c:if>
						    
			  	<li><a href="${pageContext.request.contextPath}/emps?pn=${pageInfo.pages}">末页</a></li>
			  </ul>
			</nav>
		</div>
		
	</div>
</div>
</body>
</html>