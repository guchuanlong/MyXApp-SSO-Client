<!DOCTYPE html>
<%@page import="com.ai.runner.utils.util.SSOUtil"%>
<%@page import="java.net.URLDecoder"%>
<%@ page pageEncoding="UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width; initial-scale=0.8;  user-scalable=0;" />
    <title>员工登录测试</title>
    
     <link href="css/font-awesome.css" rel="stylesheet" type="text/css">
     <link href="css/main.css" rel="stylesheet" type="text/css">
     
    <script type="text/javascript" src="js/jquery-1.11.1.min.js" ></script> 
    <script src="js/city.js" type="text/javascript"></script>
    <script src="js/list.js" type="text/javascript"></script>
</head>
<%
	String casServerUrlPrefix=SSOUtil.getCasServerUrlPrefix();
	request.setAttribute("casServerUrlPrefix", casServerUrlPrefix);
%>
<script>
var casServerUrlPrefix='${casServerUrlPrefix}';
function getCasLoginurl(){
	var casLoginurl=casServerUrlPrefix+'/login';
	var localUrlSearch=location.search; 
	var localUrlParams='';
	if (localUrlSearch.indexOf("?") != -1){
		localUrlParams=localUrlSearch.substr(1);
	}
	casLoginurl=casLoginurl+"?"+localUrlParams;
	return casLoginurl;
}
$(function(){
    flushLoginTicket();
    $("#myLoginForm").attr("action",getCasLoginurl()+'&n='+new Date().getTime());
});
var flushLoginTicket = function(){
	var urlOfGetLt = getCasLoginurl()+'&get-lt=true&n='+new Date().getTime();
	alert('urlOfGetLt='+urlOfGetLt);
	$.ajax({
		 type: "get",
		 async: false,
		 url: urlOfGetLt,
		 dataType: "jsonp",
		 jsonp: "callback",
		 jsonpCallback:"ltcallback",
		 success: function(json){
			 alert('lt： ' + json.lt + '，execution： ' + json.execution);
			 $("#lt").val(json.lt);
			 $("#execution").val(json.execution);
		 },
		 error: function(){
			 alert("无法获取登录key");
		 }
		});
};



</script>
<body>
<div class="box">
<div class="login_bg">
<!--头部-->
<div class="header">
 <div class="head">
  <div class="logo"><a href="#"><Img src="images/logo.png"></a></div>
  <div class="naver">
   <ul>
     <li><a href="#">企业入口</a></li>
    <li><a href="#">车主入口</a>            |</li>
    <li><a href="#">关于我们</a></li>
    <li><a href="#">首页</a></li>
   </ul>
  </div>
 </div>
</div>

<div id="ssoLoginDiv" class="login_nr">
 <div class="dl_bg"></div>
 <div class="dl_nr">
 	<form id="myLoginForm" method="post" action="" >
 	  <p>员工登录</p>
	  <ul>
	    <li><input class="login_input" type="text" placeholder="请输企业账号"><i class="icon-user"></i></li>
	    <li><input class="login_input" type="text" placeholder="请输入员工账号"><i class="icon-user"></i></li>
	    <li><input class="login_input" type="password" placeholder="请输入密码"><i class="icon-lock"></i></li>
	    <li><input class="login_btn" id="loginBtn" type="submit" value="登 录"></li>
	    <input type="hidden" id="_eventId" name="submit">
	    <input type="hidden" id="lt" name="lt">
	    <input type="hidden" id="execution" name="execution">
	   </ul>
	 </form>
 </div>
</div>
</div>
</div>
   <!----底部---->

<div class="footer login_foot">
 <div class="foot">
  <div class="foot_left">
  <a href="#">比亚迪集团官网</a>   
  <a href="#">联系我们</a>
  <a href="#">经销商加盟</a>
  <a href="#">关注微博 <img src="images/sina.png"></a>
 </div>
 <div class="foot_right">
  <span>客服热线:4008-303-666</span>
  <span>版权所有©比亚迪汽车销售有限公司 </span>
  <a href="#">粤ICP备10216027号</a>
 </div>
 </div>
</div>
</body>

</html>
