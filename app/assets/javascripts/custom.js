$(document).ready(function() {

	var container_width = (100 / ($('.do').size() +1)) + '%';

	$("ul li a:contains(+)").css("background-color","white");

	$("ul li a:contains(+)").mouseenter(function() {
		return $(this).css("opacity", 1);
	});
	$("ul li a:contains(+)").mouseleave(function() {
		return $(this).css("opacity", 0.5);
	});
	$('#primaryNav li').css('width', container_width);

});