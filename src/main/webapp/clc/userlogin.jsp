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
    <title>车主登录测试</title>
     <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
     <link href="css/font-awesome.css" rel="stylesheet" type="text/css">
     <link href="css/head-foot-css.css" rel="stylesheet" type="text/css">
     <link href="css/main.css" rel="stylesheet" type="text/css">
  
     <script type="text/javascript" src="js/jquery-1.11.1.min.js" ></script>
     <script type="text/javascript" src="js/bootstrap.js" ></script>
     <script type="text/javascript" src="js/index.js" ></script>
    
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
<div class="lg_bg">
<!--中间内容-->
<div class="content">
<div class="w_1190">
 <div class="lg_l">
  <div class="logina">
  <div class="login_bga">
   <div class="phonea"><a href="#"><img src="images/login_er.png"></a></div>
   <div class="login_forma">
    <ul>
     <iframe id="ssoLoginFrame" name="ssoLoginFrame" class="sso_userlogin"  frameborder="no" border="0" scrolling="no" src=""/>
    </ul>
   </div>
  </div>
 </div>
 
 <div class="loginb">
  <div class="login_bgb">
   <div class="phoneb"><a href="#"><img src="images/login_pc.png"></a></div>
   <div class="login_formb">
    <ul>
     <li class="lo_title">扫码登录</li>
     <li>
      <p><img src="images/login_p.png"></p>
      <span>请使用比亚迪app扫描</span>
     </li>
    </ul>
   </div>
  </div>
 </div>
 </div>
</div>
</div>
</div>
</div>
<div class="footer">
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
</div>
</body>
</html>
