//$(document).ready(function(){
//  $(".yax").mouseover(function(){
//  $(".yax ul").show();
//  });
//  $(".yax").mouseout(function(){
//  $(".yax ul").hide();
//  });
//});


$(document).ready(function(){
  $(".user").mouseover(function(){
  $(".user ul").show();
  $(".user").addClass("usera");
  });
  $(".user").mouseout(function(){
  $(".user ul").hide();
  $(".user").removeClass("usera");
  });
});

$(document).ready(function(){
  $(".user2").mouseover(function(){
  $(".user2 ul").show();
  $(".user2").addClass("usera2");
  });
  $(".user2").mouseout(function(){
  $(".user2 ul").hide();
  $(".user2").removeClass("usera2");
  });
});


$(document).ready(function(){
  $(".ruin ul li").mouseover(function () {
	  $(this).children('dl').show();
	  });
  $(".ruin ul li").mouseout(function () {
	  $(this).children('dl').hide();
	  });
});


$(document).ready(function(){
  $(".ruina").mouseover(function () {
	  $(".ruina ul").show(0);
	  $(".ruina p").removeClass("reorder");
	  $(".ruina p").addClass("remove");
	  });
   $(".ruina").mouseout(function () {
	  $(".ruina ul").hide(0);
	  $(".ruina p").removeClass("remove");
	  $(".ruina p").addClass("reorder");
	  });
  
});


$(document).ready(function(){
  $(".ruin p").click(function () {
	  $(".ruin ul").slideToggle(100);
	  $(".ruin p").toggleClass("reorder remove");
	  });
});



$(function(){
$(".login_title li").click(function () {
                $(".login_title li").each(function () {
                    $(this).removeClass("xiaoy");
                });
                $(this).addClass("xiaoy");
            });
$('.login_title li').click(function(){
  var index=$('.login_title li').index(this);
      if(index==0){
      $('.form1').show();
      $('.form2').hide();
   }
   if(index==1){
     $('.form1').hide();
     $('.form2').show();
   }
  }) ;
});

$(function(){
$(".table_lista li").click(function () {
                $(".table_lista li").each(function () {
                    $(this).removeClass("xiaoy");
                });
                $(this).addClass("xiaoy");
            });
$('.table_lista li').click(function(){
  var index=$('.table_lista li').index(this);
      if(index==0){
      $('.test1').show();
      $('.test2').hide();
   }
   if(index==1){
     $('.test1').hide();
     $('.test2').show();
   }
  }) ;
});



        function a(i){
	a(i);
}
   function a(i){
	   switch(i){
            case 1:
       document.getElementById("xiaoy1").style.display="block";
       document.getElementById("xiaoy2").style.display="none";
       break;
            case 2:
       document.getElementById("xiaoy1").style.display="none";
       document.getElementById("xiaoy2").style.display="block";
      break;
 }
}

