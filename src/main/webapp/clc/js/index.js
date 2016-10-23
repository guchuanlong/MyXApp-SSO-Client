$(function(){
$(".login_user p").click(function () {
   $(".login_gr ul").animate({top:'0'},300);
});
$(".login_gr ul li a").click(function () {
   $(".login_gr ul").animate({top:'-600'},300);
});
});


$(function(){
$(".login_form .user").click(function () {
	$(".login_form .user i").css('background-color', '#e2111d')
	$(".login_form .password i").css('background-color', '#dcdcdc')
});});

$(function(){
$(".login_form .password").click(function () {
	$(".login_form .input_aa").css('opacity', '1')
	$(".login_form .password i").css('background-color', '#e2111d')
	$(".login_form .psd").hide()
	$(".login_form .user i").css('background-color', '#dcdcdc')
});
});


$(function(){
$(".login_forma .user").click(function () {
	$(".login_forma .user i").css('background-color', '#e2111d')
	$(".login_forma .password i").css('background-color', '#dcdcdc')
	$(".login_forma .user input").css('border-color', '#e2111d')
	$(".login_forma .password input").css('border-color', '#d7d7d7')
});});


$(function(){
$(".login_forma .password").click(function () {
	$(".login_forma .input_aa").css('opacity', '1')
	$(".login_forma .password i").css('background-color', '#e2111d')
	$(".login_forma .psd").hide()
	$(".login_forma .user i").css('background-color', '#dcdcdc')
	$(".login_forma .password input").css('border-color', '#e2111d')
	$(".login_forma .user input").css('border-color', '#d7d7d7')
});
});


/*$(function(){
$(".phonea a").click(function () {
  $(".loginb").show(300);
  $(".logina").hide(300);
});
});
$(function(){
$(".phoneb a").click(function () {
  $(".logina").show(300);
  $(".loginb").hide(300);
});
});*/

