---
---
  
$(window).scroll ->
  oVal = (($(window).scrollTop()+1) / 24)
  $(".-blur").css "opacity", 1 - (oVal / 30)
  $(".-blur").css "text-shadow", "0px 0px " + (oVal * 2) + "px #fff"
  $(".-blur").css "bottom", (20 - oVal * 3) + "px"