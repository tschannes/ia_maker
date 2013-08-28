$(document).ready ->
  container_width = (100 / ($(".do").size())) + "%"
  $("ul li a:contains(+)").css "background-color", "white"
  $("ul li a:contains(+)").mouseenter ->
    $(this).css "opacity", 1

  $("ul li a:contains(+)").mouseleave ->
    $(this).css "opacity", 0.5

  $("#primaryNav li").css "width", container_width

  $('#view').click ->
  	$("ul li a:contains(+)").css("display", "none")