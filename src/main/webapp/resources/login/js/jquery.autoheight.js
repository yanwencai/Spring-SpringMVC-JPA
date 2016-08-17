// JavaScript Document
$(document).ready( function (){
	//定位默认窗口
	confSize();
	
	$(window).resize( function (){
		//随窗口变化而变化
		confSize();
	});
	
	function confSize(){
		var wHi = $(window).height();
		var hHi = $(".l_header").height();
		var cHi = $(".l_cont").height();
		var ihHi = $(".ihea").height();
		var itHi = $(".wtit_l").height();
		var ifHi = $(".wfot_l").height();
		var tbtnH = $(".tbtn_wrap").height();
		var mianHi =  wHi - hHi - cHi + "px";
		var wcontHi =  wHi - ihHi - itHi - ifHi - 20 + "px";
		var ifrHi =  wHi - tbtnH - 24 + "px";
		
		var wcw = $(".wcont").width();
		var wlw = $(".wcont_l").width();
		var cdw = wcw - wlw + - 10 + "px";
		var cdwie6 = wcw - wlw + - 7 + "px";
		
		$(".wtit_r, .cdemo, .wfot_r").css({width: cdw});
		$(".l_footer").css({height: mianHi});
		$(".wcont_l, .wcont_r, .leftnav, .cdemo").css({height: wcontHi});
		$(".ifr_demo").css({height:ifrHi});
		
		if ($.browser.msie && ($.browser.version == "6.0") ) { 
			$(".wtit_r, .cdemo, .wfot_r").css({width: cdwie6});
			$(".wcont_l, .wcont_r, .leftnav, .cdemo, cdemo1").css({height: wcontHi});
			$(".l_footer").css({height: mianHi});
			$(".ifr_demo").css({height:ifrHi});
		};
	}
});

