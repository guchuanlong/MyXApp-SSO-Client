<!DOCTYPE html>
<%@page import="java.net.URLDecoder"%>
<%@ page pageEncoding="UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width; initial-scale=0.8;  user-scalable=0;" />
    <title>员工登录测试</title>
    <link href="styles/css/font-awesome.css" type="text/css" rel="stylesheet" />
	<link href="styles/css/css.css" type="text/css" rel="stylesheet" />
	<script type="application/javascript" src="styles/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="styles/js/jquery.flexslider-min.js"></script>
	<script type="application/javascript" src="styles/js/index.js"></script>
</head>
<script>
$(function(){
	var casLoginurl='http://localhost:8080/mysso/login?isajax=true&isframe=true';
	var localUrlSearch=location.search; 
	var localUrlParams='';
	if (localUrlSearch.indexOf("?") != -1){
		localUrlParams=localUrlSearch.substr(1);
	}
	var iframeSrcUrl=casLoginurl+"&"+localUrlParams;
	$("#ssoLoginFrame").attr("src",iframeSrcUrl);
});
</script>
<script>
	$(document).ready(function(){   
	        //flushLoginTicket();  // 进入登录页，则获取login ticket，该函数在下面定义。  
	    }); 
	// 登录处理回调函数，将由 iframe 中的页同自动回调  
	var feedBackUrlCallBack = function (result) {  
	    customLoginCallBack(result);  
	};  
	  
	// 自定义登录回调逻辑  
	var customLoginCallBack = function(result){  
	    // 登录失败，显示错误信息  
	    if (result.login == 'fails'){  
	        $('#J_ErrorMsg').fadeOut().text(result.msg).fadeIn();  
	        // 重新刷新 login ticket  
	        //flushLoginTicket();  
	    }  
	    // do more....  
	}  
	  
  
	
</script>
<body>
<span class="red" style="height:12px;" id="J_ErrorMsg"></span>  
<div class="login">
<div class="login_nra">
<div class="login_tp"><img src="images/login_tp.png"></div>
<iframe id="ssoLoginFrame" name="ssoLoginFrame" class="login_nr"  frameborder="no" border="0" scrolling="no" src=""/>
</div>
</div>
</body>
</html>
