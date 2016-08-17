$(function() {
	// 4级菜单主JS
	$(".Ltit").click(function() {
		var $this = $(this);
		var $thisnex =  $this.next('.Ldat');
		var temlname = $this.parent().attr("rel");
		// alert(temlname);
		if ( $thisnex.is(":visible") ) {
			$thisnex.slideUp("fast");
		} else {
			$("div[rel=" + "'" + temlname + "'" + "]").children(".Ldat").slideUp("fast");
			$thisnex.slideDown("fast");
		}
	});
	
	//下面是修改第1级菜单当前状态的Class
	$(".left-lv-1-wrap h2:first").addClass("cur");
	$(".left-lv-1-title").click(function() {
		if ( $(this).hasClass("cur") ) {
			$(this).removeClass("cur")
		} else {
			$(this).parent().parent().parent().find(".left-lv-1-title").removeClass("cur");
			$(this).addClass("cur");
		}
	});
	//下面是修改第2级菜单当前状态的Class
	 $(".lv2-t").click(function() {
		 if ( $(this).hasClass("cur") ) {
			 $(this).removeClass("cur")
		 } else {
			 $(this).parent().parent().parent().find(".lv2-t").removeClass("cur");
			 $(this).addClass("cur");
		 }
	 });
	
	 //下面是修改第3级菜单当前状态的Class
	 $(".left-lv-3-title").click(function() {
		 if ( $(this).hasClass("cur") ) {
			 $(this).removeClass("cur")
		 } else {
			 $(this).parent().parent().find(".left-lv-3-title").removeClass("cur");
			 $(this).addClass("cur");
		 }
	 });
	// 下面是修改第4级菜单当前状态的Class
	 $(".level-4").click(function() {
		 if ( $(this).hasClass("lv4cur") ) {
			 $(this).removeClass("lv4cur")
		 } else {
			 $(this).siblings().removeClass("lv4cur");
			 $(this).parent().siblings().find(".level-4").removeClass("lv4cur");
			 $(this).addClass("lv4cur");
		 }
	 });
	
});