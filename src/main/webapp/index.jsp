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
	<script src="${path}/static/js/jquery-3.4.1.min.js"></script>
	<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
	<script src="${path}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

</head>
<body>
	<!-- 编辑员工模态框 -->
	<div class="modal fade" id="updateEmps" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">编辑员工</h4>
	      </div>
	      <div class="modal-body">
			<form class="form-horizontal">
			  <div class="form-group">
			    <label class="col-sm-2 control-label">empName</label>
			    <div class="col-sm-10">
			    	<p class="form-control-static" id="update_empname">empName</p>
			      <!-- <input type="name" name="empName" value="" class="form-control" id="emp_update_name" placeholder="empName" readonly> -->
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label  class="col-sm-2 control-label">email</label>
			    <div class="col-sm-10">
			      <input type="email" name="email" class="form-control" id="emp_update_email" placeholder="hello@qq.com">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label  class="col-sm-2 control-label">gender</label>
			    <div class="col-sm-10">
			      	<label class="radio-inline">
					  <input type="radio" name="gender" id="emp_update_gender_male" value="m" checked="checked"> 男
					</label>
					<label class="radio-inline">
					  <input type="radio" name="gender" id="emp_update_gender_female" value="f"> 女
					</label>
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label  class="col-sm-2 control-label">departName</label>
			    <div class="col-sm-4">
			      <select class="form-control" name="dId" id="update_select">

				  </select>
			    </div>
			  </div>
			  
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
	      </div>
	    </div>
	  </div>
	</div>


	<!-- 添加员工模态框 -->
	<div class="modal fade" id="addEmps" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">添加员工</h4>
	      </div>
	      <div class="modal-body">
			<form class="form-horizontal">
			  <div class="form-group">
			    <label class="col-sm-2 control-label">empName</label>
			    <div class="col-sm-10">
			      <input type="name" name="empName" class="form-control" id="emp_add_name" placeholder="empName">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label  class="col-sm-2 control-label">email</label>
			    <div class="col-sm-10">
			      <input type="email" name="email" class="form-control" id="emp_add_email" placeholder="hello@qq.com">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label  class="col-sm-2 control-label">gender</label>
			    <div class="col-sm-10">
			      	<label class="radio-inline">
					  <input type="radio" name="gender" id="emp_add_gender_male" value="m" checked="checked"> 男
					</label>
					<label class="radio-inline">
					  <input type="radio" name="gender" id="emp_add_gender_female" value="f"> 女
					</label>
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label  class="col-sm-2 control-label">departName</label>
			    <div class="col-sm-4">
			      <select class="form-control" name="dId" id="add_select">

				  </select>
			    </div>
			  </div>
			  
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
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
			<button type="button" class="btn btn-primary" id="add_emp_btn">新增</button>
			<button type="button" class="btn btn-danger" id="delete_checked_emp_btn">删除</button>
		</div>
	</div>
	
	<!-- 显示表格数据 -->
	<div class="row"></div>
		<div class="col-md-12">
			<table id="emps_table" class="table table-hover">
				<thead>
					<tr>
						<th>
							<input type='checkbox' id="check_all"></input>
						</th>
						<th>#</th>
						<th>姓名</th>
						<th>性别</th>
						<th>邮件</th>
						<th>部门</th>
						<th>操作</th>
					</tr> 
				</thead>
				
				<tbody id="tbody">
					
				</tbody>

			</table> 
		</div>
	<!-- 显示分页信息 -->
	<div class="row ">
		<!-- 分页信息 -->
		<div id="page_info" class="row col-md-6">
			当前是 页, 总共 页, 总共 条记录
		</div>
		
		<!-- 分页条信息 -->
		<div id="page_bar" class="row col-md-6">
			
		</div>
	</div>


</div>

<script type="text/javascript">
	//1、页面加载完成以后，直接去发送ajax请求,要到分页数据
	$(function(){
		to_page(1);
	});
	
	var totalRecords;	//总记录数
	var currentPage;	//当前页数
	
	//发起ajax请求，获取数据
	function to_page(pn){
		$.ajax({
			url:"${path}/emps",
			data: "pn="+pn,
			type: "GET",	
			success: function(msg){
				build_table_emps(msg);
				split_page_info(msg);
				split_page_bar(msg);
			}	
		});	
	}
	
	//处理表单信息
	function build_table_emps(msg){
		//每次新的ajax请求前，清空内容：
		$("#tbody").empty();
		
		var emps=msg.extend.pageInfo.list;
		$.each(emps,function(index,e){
			var checkedBox = $("<td><input type='checkbox' class='check_item'></input></td>")
			var id = $("<td></td>").append(e.empId);
			var name = $("<td></td>").append(e.empName);
			var gender = $("<td></td>").append(e.gender=='m'?"男":"女");
			var email = $("<td></td>").append(e.email);
			var dName = $("<td></td>").append(e.dept.deptName);
			
			//创建编辑按钮
			var update_Btn = $("<button></button>").addClass("btn btn-primary btn-sm btn_update")
				.append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
				.append(" ").append("编辑");
		
			//给编辑按钮和更新按钮加上一个update_id的属性，值为当前员工的id号
			update_Btn.attr("update_id",e.empId);
			
			
			//创建删除按钮
			var delete_Btn = $("<button></button>").addClass("btn btn-danger btn-sm btn_delete")
			.append($("<span></span>").addClass("glyphicon glyphicon-trash"))
			.append(" ").append("删除");
			
			var btn = $("<td></td>").append(update_Btn).append(" ").append(delete_Btn);
			
			$("<tr></tr>").append(checkedBox)
							.append(id)
							.append(name)
							.append(gender)
							.append(email)
							.append(dName)
							.append(btn).appendTo("#tbody");
		});
		
	};
	
	//处理分页信息
	function split_page_info(msg){
		//每次新的ajax请求前，清空内容：
		$("#page_info").empty();
		
		$("#page_info").append("当前是"+msg.extend.pageInfo.pageNum
					+"页, 总共"+msg.extend.pageInfo.pages 
					+"页, 总共"+ msg.extend.pageInfo.total+"条记录");
		totalRecords = msg.extend.pageInfo.total;
		currentPage = msg.extend.pageInfo.pageNum;
	}
	
	//处理分页栏
	function split_page_bar(msg){
		//每次新的ajax请求前，清空内容：
		$("#page_bar").empty();
		
		var ul = $("<ul></ul>").addClass("pagination");
		
		var  first_page= $("<li></li>").append($("<a></a>").attr("href","#").append("首页"));
		//给按钮绑定单击事件
		first_page.click(function(){	
			to_page(1);
		});
		
		
		var pre_page = $("<li></li>").append($("<a></a>").attr("href","#").append($("<span></span>").append("&laquo;")));
		if(msg.extend.pageInfo.hasPreviousPage==false){
			pre_page.addClass("disabled");
		}else{
			//给按钮绑定单击事件
	 		pre_page.click(function(){	
				to_page(msg.extend.pageInfo.prePage);
			}); 
		}

		
		//将首页和前一页加入到ul标签中
		ul.append(first_page).append(pre_page);
		$.each(msg.extend.pageInfo.navigatepageNums,function(index,item){
			var page = $("<li></li>").append($("<a></a>").attr("href","#").append(item));
			if(msg.extend.pageInfo.pageNum==item){
				page.addClass("active");
			}
			//给按钮绑定单击事件
			page.click(function(){
				to_page(item);
			});
			//每一页加入到ul标签中
			ul.append(page);
		});
		
		var next_page = $("<li></li>").append($("<a></a>").attr("href","#").append($("<span></span>").append("&raquo;")));
		if(msg.extend.pageInfo.hasNextPage==false){
			next_page.addClass("disabled");
		}else{
			//给按钮绑定单击事件
	 		next_page.click(function(){	
				to_page(msg.extend.pageInfo.nextPage);
			}); 
		}

		
		var last_page = $("<li></li>").append($("<a></a>").attr("href","#").append("末页"));
		//给按钮绑定单击事件
		last_page.click(function(){	
			to_page(msg.extend.pageInfo.pages);
		});
		//将末页和后一页加入到ul标签中
		ul.append(next_page).append(last_page);
		
		//将ul标签加入到nav标签中中
		var nav = $("<nav></nav>").append(ul);
		
		//显示分页栏信息
		$("#page_bar").append(nav);
	}
	
	//点击新增按钮，跳出模态框
	$("#add_emp_btn").click(function(){
		
		//清空表单信息
		$("#addEmps form")[0].reset();
		
		//清空输入框的属性和提示信息
		$("#emp_add_name").parent().removeClass("has-error has-success");
		$("#emp_add_name").next("span").text("")
		$("#emp_add_email").parent().removeClass("has-error has-success");
		$("#emp_add_email").next("span").text("")
		
		//发出ajax请求，查出部门信息，将部门名加入到下拉框中
		get_dept_info("#add_select");
		
		//2.跳出模态框
		$("#addEmps").modal({
			backdrop:"static"				
		});
	});
	
	//获取部门信息方法
	function get_dept_info(id){
		$(id).empty();
		$.ajax({
			url:"${path}/depts",
			type:"GET",
			async:false,		//解决 编辑按钮模态框，回写部门信息时而回功时而失败的bug
			success:function(msg){
				
				//将部门名加入到下拉框中
				$.each(msg.extend.dept,function(){

					$(id).append($("<option></option>")
											.append(this.deptName).attr("value",this.deptId));	
				});
			}
		});
		
	}
	
	//校验表单数据信息的合法性
	function validate_addemps_info(){
		//校验name
		var empName = $("#emp_add_name").val();
		var empNamePatt = /(^[a-z0-9_-]{5,16}$)|(^[\u2E80-\u9FFF]+$)/;

		if(!empNamePatt.test(empName)){
			validate_succes_error_msg("#emp_add_name","has-error","用户名必须是5-16的英文、数字、下划线的组合或者是中文！");
			return false;
		}
		
		//校验email
		var email = $("#emp_add_email").val();
		var emailPatt = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;

		if(!emailPatt.test(email)){
			validate_succes_error_msg("#emp_add_email","has-error","邮箱格式非法!");
			return false;
		}else{
			validate_succes_error_msg("#emp_add_email","has-success","邮箱可用");	
		}
		return true;
	}
	
	//回写的校验信息
	function validate_succes_error_msg(id,status,msg){
		$(id).parent().removeClass("has-error has-success");
		$(id).next("span").text("")
		
		$(id).parent().addClass(status);
		$(id).next("span").text(msg);
	}
	
	//点击保存按，保存数据
	$("#emp_save_btn").click(function(){
		//1. 验证表单数据是否合法
		//serialize()会将数据自动封装为key=value的形式
		
  		if(!validate_addemps_info()){
			return false;
		}  
		
		if($("#emp_add_name").attr("isExist_empName")=="YES"){
			return false;
		}
		
		//2. 将数据提交给服务器：ajax请求 ，符合rest风格
		var emp_data=$("#addEmps form").serialize();
		$.ajax({
			url:"${path}/emp",
			type:"POST",
			data:emp_data,
			success:function(msg){
				if(msg.statusCode==100){
					//校验成功
					//关闭模态框
					$('#addEmps').modal('hide')
					//
					to_page(totalRecords);	
				}else if(msg.statusCode==200){
					//校验失败，回写信息
					//console.log(msg);
					//有那个字段的信息就显示那个字段的信息
					if(undefined != msg.extend.error.empName){
						validate_succes_error_msg("#emp_add_name","has-error",msg.extend.error.empName);
					}
					if(undefined != msg.extend.error.email){
						validate_succes_error_msg("#emp_add_email","has-error",msg.extend.error.email);
					}	
					
				}
				
			} 
		});
		
	});
	
	//给姓名框绑定change事件
	$("#emp_add_name").change(function(){
		var empName=this.value;
		
		$.ajax({
			url:"${path}/checkout",
			type:"POST",	//若使用GET请求会出现中文乱码问题
			data:"empName="+empName,
			success:function(msg){
				
				if(msg.statusCode==100){
					//用户名可用
					$("#emp_add_name").attr("isExist_empName","NO");
					validate_succes_error_msg("#emp_add_name","has-success","用户名可用");
				}else if(msg.statusCode==200){
					//用户名不可用
					$("#emp_add_name").attr("isExist_empName","YES");
					var result = msg.extend.tips;
					validate_succes_error_msg("#emp_add_name","has-error",result);
				}
			}
		});
	});
	
/* 
	1、我们是按钮创建之前就绑定了click，所以绑定不上。
			1）、可以在创建按钮的时候绑定。
			2）、考虑使用绑定点击.live()方法。但是jquery新版没有live()，使用on()进行替代
 */
 //  $(document)是一个选择器，选中的是整个html所有元素的集合。
 //给编辑按钮绑定单击事件
	$(document).on("click",".btn_update",function(){
		//alert("update_btn");
		
		//0.查出员工信息,显示员工信息
		getEmps($(this).attr("update_id"));
		//1.查出部门信息，显示部门信息
		get_dept_info("#update_select");
		
		$("#emp_update_btn").attr("update_id",$(this).attr("update_id"));
		
		//2.跳出模态框
		$("#updateEmps").modal({
			backdrop:"static"				
		});

	});
 
 	function getEmps(id){
 		$.ajax({
 			url:"${path}/emp/"+id,
 			type:"GET",
 			
 			success:function(msg){
 				
 				//console.log(msg);
 				
 				var empData = msg.extend.emp;
 				
 				$("#update_empname").text(empData.empName);
 				$("#emp_update_email").val(empData.email);
 				$("#updateEmps input[name=gender]").val([empData.gender]);
 		 		$("#updateEmps select").val([empData.dId]); 
 			
 			}
 			
 		});
 	}
 	
 	//给编辑模态框的更新按钮绑定单击事件
 	$("#emp_update_btn").click(function(){
		//1.验证邮箱合法性
		var email = $("#emp_update_email").val();
		var emailPatt = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;

		
		if(!emailPatt.test(email)){
			validate_succes_error_msg("#emp_update_email","has-error","邮箱格式非法!");
			return false;
		}else{
			validate_succes_error_msg("#emp_update_email","has-success","邮箱可用");	
		}

		//2.发送ajax请求，保存数据
		var empId = $(this).attr("update_id");
		$.ajax({
			url:"${path}/emp/"+empId,
			//方式一
			type:"PUT",		//以这种方式要在web.xml中配置HttpPutFormContentFilter过滤器
			data:$("#updateEmps form").serialize(),
			//方式二
		//	type:"POST",		
		//	data:$("#updateEmps form").serialize()+"&_method=PUT",
			success:function(result){
				//alert(result.msg);
				//1.关闭模态框
				$("#updateEmps").modal("hide");
				
				//2.回到本页面
				to_page(currentPage);
			}	
		});
		
		
 	});
 	
 	//给删除按钮绑定单击事件
 	$(document).on("click",".btn_delete",function(){

 		/**
 			parents("tr"):找到元素是tr的父标签
 			parent():找到当前标签的唯一父标签
 		*/
 		//var empName = $(this).parents("tr").find("td:eq(1)").text();
 		var empName = $(this).parent().parent().find("td:eq(2)").text();
 		var empId = $(this).parent().parent().find("td:eq(1)").text();
 		
  		if(confirm("确认删除【"+ empName +"】吗？")){
 			//发起删除的ajax请求
 			$.ajax({
 				url:"${path}/emp/"+empId,
 				type:"DELETE",
 				success:function(){
 					
 					//删除后跳转回原来的页面
 					to_page(currentPage);
 				}	
 			});
 			
 		} 
		
 	});
 	
 	//全选，全不选
 	$("#check_all").click(function(){
 		
 		$(".check_item").prop("checked",$(this).prop("checked"));
 		
 	});
 	 
 	$(document).on("click",".check_item",function(){
 		/**
 			$(".check_item:checked").length  == 获取当前页面checkbox被选中的个数
 			$(".check_item").length  == 获取当前页面checkbox的总个数
 		*/
 		var isCheckAll = $(".check_item:checked").length==$(".check_item").length;
 		//alert(isCheckAll);
 		$("#check_all").prop("checked",isCheckAll);

 	});
 	
 	
 	$("#delete_checked_emp_btn").click(function(){
 		var id="";
 		var name="";
 		$.each($("#tbody .check_item:checked"),function(){
 			id += $(this).parent().parent().find("td:eq(1)").text()+"-";
 			name += $(this).parent().parent().find("td:eq(2)").text()+",";
 		});
 		
 		//删除最后一个"," 和"-"
 		var del_id = id.substring(0, id.length-1);
 		var del_name = name.substring(0, name.length-1);
 		
 		
 		//弹出删除对话框
 		if(confirm("确定要删除【"+del_name+"】吗？")){
 			//删除
 			$.ajax({
 	 			url:"${path}/emp/"+	del_id,
 	 			type:"DELETE",
 	 			success:function(){
 	 				to_page(currentPage);
 	 			}
 	 		});
 		}
 		
 		
 	});
 	
	</script>
		
</body>
</html>