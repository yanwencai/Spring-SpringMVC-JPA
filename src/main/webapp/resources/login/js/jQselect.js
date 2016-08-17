//加载自定义select
$(function() {
	$('.selectTyp').Selectyze({
		theme : 'blue',		//下拉框的样式
		effectOpen:'fade',		//下拉框弹出时的效果
		effectClose:'fade'		//下拉框收回时的效果
	});
	$(".cx_tab tbody tr:odd").addClass("gray");
});


