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
<!--员工修改模态框  -->
	<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" >员工修改</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal" id="update_form">
			  <div class="form-group">
			    <label for="update_empName" class="col-sm-2 control-label">empName</label>
			    <div class="col-sm-10">
			      <p class="form-control-static" id="empName_update"></p>
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="update_email" class="col-sm-2 control-label">email</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control"  name="email" id="update_email" placeholder="email">
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label class="col-sm-2 control-label">gender</label>
			    <div class="col-sm-10">
				    <label class="radio-inline">
					  <input type="radio" name="gender" id="update_man" value="M" checked="checked"> 男
					</label>
					<label class="radio-inline">
					  <input type="radio" name="gender" id="update_woman" value="F"> 女
					</label>
				</div>
			  </div>
			  
			  <div class="form-group">
			    <label class="col-sm-2 control-label">deptName</label>
			    <div class="col-sm-4">
			    <!-- 提交部门id -->
			      <select class="form-control" name="dId" id="update_select">
					  
				  </select>
			    </div>
			  </div>
			</form>
	      </div>
	      
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="update_save">更新</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!--添加模态框  -->
	<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">员工增加</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal" id="add_form">
			  <div class="form-group">
			    <label for="empName" class="col-sm-2 control-label">empName</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" name="empName" id="add_empName" placeholder="empName">
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="email" class="col-sm-2 control-label">email</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control"  name="email" id="add_email" placeholder="email">
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label class="col-sm-2 control-label">gender</label>
			    <div class="col-sm-10">
				    <label class="radio-inline">
					  <input type="radio" name="gender" id="add_man" value="M" checked="checked"> 男
					</label>
					<label class="radio-inline">
					  <input type="radio" name="gender" id="add_woman" value="F"> 女
					</label>
				</div>
			  </div>
			  
			  <div class="form-group">
			    <label class="col-sm-2 control-label">deptName</label>
			    <div class="col-sm-4">
			    <!-- 提交部门id -->
			      <select class="form-control" name="dId" id="add_select">
					  
				  </select>
			    </div>
			  </div>
			</form>
	      </div>
	      
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="add_save">保存</button>
	      </div>
	    </div>
	  </div>
	</div>

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
			<button type="button" class="btn btn-primary" id="emp_add_modal_btn">新增</button>
			<button type="button" class="btn btn-danger"  id="emp_del_modal_btn">删除</button>
		  </div>
		</div>
		  
		<!-- 表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="emps_table">
					<thead>
						<tr>
							<th>#</th>
							<th>empName</th>
							<th>gender</th>
							<th>email</th>
							<th>department</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						
					</tbody>
					
				</table>
			</div>
		</div>
		
		<!-- 分页 -->
		<div class="row">
			<!-- 分页文字 -->
			<div class="col-md-6" id="page_info_area">
				
			</div>
			
			<!-- 分页条 -->
			<div class="col-md-6" id="page_nav_area">
				
			</div>
			
		</div>
	</div>
	
	<script type="text/javascript">
		var total;
		var currentPage;
		//1.页面加载完成后发送ajax请求，要到分页数据 
		$(document).ready(function(){
			to_page(1);
		});
		
		//
		function to_page(pn){
			$.ajax({
				url:"${pageContext.request.contextPath}/emps",
				data:"pn="+pn,
				datatype:"json",
				type:"GET",
				success:function(result){
					//1.解析显示员工数据
					//alert("hh")
					build_emps_table(result);
					//2.解析显示分页数据
					build_page_info(result);
					//2.解析显示条
					build_page_nav(result);
				}
				
			});
		}
		
		//显示员工数据
		function build_emps_table(result){
			//清空表格数据
			$("#emps_table tbody").empty();
			var emps = result.returnData.pageInfo.list;
			$.each(emps,function(index,emp){
					var empId = $("<td></td>").append(emp.empId)	
					var empName = $("<td></td>").append(emp.empName)	
					var gender = $("<td></td>").append(emp.gender=="M"?"男":"女" )	
					var email = $("<td></td>").append(emp.email)	
					var deptName = $("<td></td>").append(emp.department.deptName)	
					/*
							<button class="btn btn-primary btn-sm"> 	
							<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
							编辑
							</button>
							<button class="btn btn-danger btn-sm">
							<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
							删除
							</button>
					*/
					var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
					.append($("<span></sapn>").addClass("glyphicon glyphicon-pencil")).append("编辑");
					editBtn.attr("edit_id",emp.empId);
					
					var deleteBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
					.append($("<span></sapn>").addClass("glyphicon glyphicon-trash")).append("删除");
					deleteBtn.attr("delete_id",emp.empId);
					var btn = $("<td></td>").append(editBtn).append(" ").append(deleteBtn);
					$("<tr></tr>").append(empId)
					.append(empName)
					.append(gender)
					.append(email)
					.append(deptName)
					.append(btn)
					.appendTo("#emps_table tbody")
			});
		}
		
		//解析显示分页信息
		function build_page_info(result){
			$("#page_info_area").empty();
			$("#page_info_area").append("当前 "+result.returnData.pageInfo.pageNum 
					+"页,共"+result.returnData.pageInfo.pages +"页,共"+result.returnData.pageInfo.total +"记录");
			total=result.returnData.pageInfo.total+1;
			currentPage=	result.returnData.pageInfo.pageNum ;	
		}
		
		//解析显示分页条,添加点击动作
		function build_page_nav(result){
			$("#page_nav_area").empty();
			var ul =$("<ul></ul>").addClass("pagination");
			var homePage =$("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
			var prePage  =$("<li></li>").append($("<a></a>").append("&laquo;"));
			if(result.returnData.pageInfo.hasPreviousPage ==false){
				homePage.addClass("disabled");
				prePage.addClass("disabled");
			}else {
				homePage.click(function() {
					to_page(1);
				});
				prePage.click(function() {
					to_page(result.returnData.pageInfo.pageNum-1);
				});
			}
			
			var nextPage =$("<li></li>").append($("<a></a>").append("&raquo;"));
			var lastPage =$("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
			if(result.returnData.pageInfo.hasNextPage ==false){
				nextPage.addClass("disabled");
				lastPage.addClass("disabled");
			}else{
				nextPage.click(function() {
					to_page(result.returnData.pageInfo.pageNum+1);
				});
				lastPage.click(function() {
					to_page(result.returnData.pageInfo.pages);
				})	
			}
			
			ul.append(homePage).append(prePage);
			
			$.each(result.returnData.pageInfo.navigatepageNums,function(index,navigatepageNum){
					var numLi =$("<li></li>").append(
							$("<a></a>").append(navigatepageNum)	);
					if(result.returnData.pageInfo.pageNum == navigatepageNum){
						numLi.addClass("active");
					}
					numLi.click(function() {
						to_page(navigatepageNum);
					});
					
					ul.append(numLi);
			});
			ul.append(nextPage).append(lastPage);
			var nav = $("<nav></nav>").append(ul);
			nav.appendTo("#page_nav_area");
		}
		
		//新增模块框	
		$("#emp_add_modal_btn").click(function() {
			//发送ajax，查部门信息
			getDepts("#add_select");
			//弹出 模态框
			$('#empAddModal').modal({
				backdrop: "static"
			})
		}) 
		
		//获取部门信息
		function getDepts(ele){
			$(ele).empty();
			$.ajax({
				url:"${pageContext.request.contextPath}/depts",
				type: "GET",
				success: function(result) {
					//显示部门信息在下拉列表
					$.each(result.returnData.depts,function(){
						var option = $("<option></option>").append(this.deptName).attr("value",this.deptId);
						option.appendTo(ele);
					})
				}
			});
		}
		
		//add
		$("#add_save").click(function() {
			//1.提交表单数据to server
		
			$.ajax({
				url:"${pageContext.request.contextPath}/emp",
				type: "POST",
				data:	$("#add_form").serialize(),
				success: function(result) {
					//alert(result.msg);
					//员工保存成功后：1.关闭modal 2.跳转到最后一页
					$('#empAddModal').modal('hide');
					to_page(total);
				}
			});
		})
		
		
		//编辑按钮
		$(document).on("click",".edit_btn",function(){
			//1查出部门信息并显示
			getDepts("#update_select");
			//2查出员工信息并显示
			getEmp($(this).attr("edit_id"));
			//3.把员工id传给更新模态框的更新按钮
			$("#update_save").attr("edit_id",$(this).attr("edit_id"));
			//弹出 模态框
			$('#empUpdateModal').modal({
				backdrop: "static"
			})
		})
		//获取员工信息
		function getEmp(id) {
			$.ajax({
				url:"${pageContext.request.contextPath}/emp/"+id,
				type: "GET",
				success: function(result) {
					//console.log(result); 
					var emp=result.returnData.emp;
					$("#empName_update").text(emp.empName);
					$("#update_email").val(emp.email);
					$("#empUpdateModal input[name=gender]").val([emp.gender]);
					$("#update_select").val([emp.dId]);
					
				}
			})
			
		}
	
		//update
		$("#update_save").click(function() {
			//
			$.ajax({
				url:"${pageContext.request.contextPath}/emp/"+$(this).attr("edit_id"),
				type: "PUT",
				data:$("#update_form").serialize(),
				success: function(result){
					//alert(result.msg);
					//1.关闭模态框
					$("#empUpdateModal").modal("hide");
					//2.回到本页面
					to_page(currentPage);
				}
			});
		})
		
		//删除按钮
		$(document).on("click",".delete_btn",function(){
			var empName =$(this).parents("tr").find("td:eq(1)").text();
			var empId =$(this).attr("delete_id");
			//1.弹出是否删除对话框
			//alert($(this).parents("tr").find("td:eq(1)").text());
			if(confirm("确认删除【"+ empName +"】?")){
				//确认，发送ajax 删除
				$.ajax({
					url:"${pageContext.request.contextPath}/emp/"+empId,
					type: "DELETE",
					success: function(result){
						alert(result.msg);
						//huidao本页
						to_page(currentPage);
					}
				})
			}
		})
	</script>
</body>
</html>