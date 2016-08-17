// JavaScript Document
$(function() {	
	function tabs(tabTit, on, tabCon) {
		$(tabCon).each(function() {
			$(this).children().eq(0).show();
		});
		$(tabTit).each(function() {
			$(this).children().eq(0).addClass(on);
		});
		$(tabTit).children().click(function() { 
			$(this).addClass(on).siblings().removeClass(on);
			var index = $(tabTit).children().index(this);
			$(tabCon).children().eq(index).show().siblings().hide();
		});
	}
	//社区医院tab code
	tabs(".tab_h1", "cur", ".tab_b1");
	tabs(".tab_h2", "cur", ".tab_b2");
	tabs(".tab_h3", "cur", ".tab_b3");
	tabs(".tab_h4", "cur", ".tab_b4");
	tabs(".tab_h5", "cur", ".tab_b5");
});

//tab ifrmae dode
function aa(url, id){
	$("#"+ id).addClass("cur").siblings().removeClass("cur");
	$("#ifr_dm").attr("src",url);
}

//1024 layout code
$(document).ready(function() {
	samHeight();
});
$(window).resize(function() {
	samHeight();
});
function samHeight (){
	//基于jQuery的最小宽度锁定。如果jQuery出错不能加载，请把这段写成原生Javascript
	if ( $(window).width() < 1024 ) {
		$(".wrap1").css({width: "50%"});
		
	} else if ($(window).width() > 1024 ) {
		$(".wrap1").css({width: "33.3%"})
	}
}