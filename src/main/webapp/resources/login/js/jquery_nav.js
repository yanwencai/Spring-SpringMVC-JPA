// JavaScript Document
$(function(){
	$(".lout1").hover(
		function(){
			$(this).addClass("lout2").siblings().removeClass("lout2").end().stop(true,true);
		},
		function(){
			$(this).removeClass("lout2").end().stop(true,true);	
		}
	);
})