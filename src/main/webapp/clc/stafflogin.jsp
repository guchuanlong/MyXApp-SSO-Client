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
	String iframeCasServerLoginUrl=SSOUtil.getIframeCasServerLoginUrl();
   System.out.println("iframeCasServerLoginUrl="+iframeCasServerLoginUrl);
%>
<script>
$(function(){
	//var iframeCasLoginurl='http://localhost:8080/sso-s/login?isframe=true';
	var iframeCasLoginurl='<%=iframeCasServerLoginUrl%>';
	var localUrlSearch=location.search; 
	var localUrlParams='';
	if (localUrlSearch.indexOf("?") != -1){
		localUrlParams=localUrlSearch.substr(1);
	}
	var iframeSrcUrl=iframeCasLoginurl+"&"+localUrlParams;
	$("#ssoLoginFrame").attr("src",iframeSrcUrl);
});

//监控是否有多个操作人，若有，则调整iframe大小
window.onmessage=function(e){
	e = e || event;
	var data=e.data;
	if(data=='ssoFrameCallback'){
		var ssoLoginDiv=$("#ssoLoginDiv");
		var ssoLoginFrame=$("#ssoLoginFrame");
		ssoLoginDiv.attr("class","sso_stafflogin_operlist");
		ssoLoginFrame.attr("class","sso_stafflogin_operlist");	
	}
}
</script>
<script>
//登录处理回调函数，将由 iframe 中的页同自动回调  
var feedBackUrlCallBack = function (result) {  
	// 登录失败，显示错误信息  
    if (result.login == 'fails'){  
        $('#J_ErrorMsg').fadeOut().text(result.msg).fadeIn();  
    }    
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
  <iframe id="ssoLoginFrame" name="ssoLoginFrame" class="sso_stafflogin"  frameborder="no" border="0" scrolling="no" src=""/>
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
