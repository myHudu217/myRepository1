<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" charset="utf-8">
	$(function() {
		
		alert("regJSP-init");
		var pageContext='${pageContext}';
		var pageContext_request='${pageContext.request}';
		var pageContext_request_contextPath='${pageContext.request.contextPath}';
		console.log("%o",pageContext);
		console.log("%o",pageContext_request);
		console.log("%o",pageContext_request_contextPath);
		
		$('#registerDialog').show().dialog({
			modal : true,
			closed : true,
			buttons : [ {
				text : '注册',
				handler : function() {
					register();
				}
			} ]
		});
	});
	function register() {
		
		var registerT= JSON.stringify($('#regForm').serialize());
		console.log("registerT= ");
		console.log("%o",registerT);
		
		//hb add begin
		 			
		$('#regForm').form('submit', {   
			    url:'${pageContext.request.contextPath}'+'/userController/reg',   
			    onSubmit: function(){   
			        // do some check   
			        // return false to prevent submit;   
			    },   
			    success:function(data){   
			        alert(data)   
			    }   
			});  
		
		//hb add end
		
		
	
		/* if ($('#regForm').form('validate')) {
			parent.$.messager.progress({
				title : '提示',
				text : '数据处理中，请稍后....'
			});
			$.post(
					'${pageContext.request.contextPath}/userController/reg' ,
					$('#regForm').serialize(), 
					function(result) {
								if (result.success) {
									$('#registerDialog').dialog('close');
									$.messager.show({
										title : '提示',
										msg : result.msg,
										showType : 'slide'
									});
									$('#loginForm').form('load', result.obj);
								} else {
									$.messager.alert('错误', result.msg, 'error');
								}
								parent.$.messager.progress('close');
						  },
						 "JSON"
			);
		}  */
		
		
	}
	
	//hb add begin
	function myformatter(date){
		var y = date.getFullYear();
		var m = date.getMonth()+1;
		var d = date.getDate();
		return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
	}
	function myparser(s){
		if (!s) return new Date();
		var ss = (s.split('-'));
		var y = parseInt(ss[0],10);
		var m = parseInt(ss[1],10);
		var d = parseInt(ss[2],10);
		if (!isNaN(y) && !isNaN(m) && !isNaN(d)){
			return new Date(y,m-1,d);
		} else {
			return new Date();
		}
	}
	//hb add end
	
	
</script>
<div id="registerDialog" title="用户注册22" style="width: 500px; height: 320px; overflow: hidden; display: none;">
	<form id="regForm" method="post">
		<table class="table table-hover table-condensed">
			<tr>
				<th>登录名</th>
				<td><input name="name" type="text" placeholder="请输入登录名" class="easyui-validatebox" data-options="required:true"></td>
			</tr>
			<tr>
				<th>密码</th>
				<td><input name="pwd" type="password" placeholder="请输入密码" class="easyui-validatebox" data-options="required:true"></td>
			</tr>
			<tr>
				<th>重复</th>
				<td><input name="rePwd" type="password" placeholder="请再次输入密码" class="easyui-validatebox" data-options="required:true,validType:'eqPwd[\'#regForm input[name=pwd]\']'"></td>
			</tr>
			<tr>
				<th>注册时间</th>
				<td><input class="easyui-datebox" name="createdatetime" id="createdatetime" ></input></td>
			</tr>
		</table>
	</form>
</div>
