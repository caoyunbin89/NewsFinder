$(document).ready(function(){
	//页面中的DOM已经装载完成时，执行的代码
	$("#button").click(function(){
		//找到主菜单项对应的子菜单项
		var ulNode = $(this).parent().next("p");
		
		if(ulNode.css("display")=="none"){
			ulNode.css("display","block");
		}else{
			ulNode.css("display","none");
		}
	});
	/*$(".button").hover(function(){
		var ulNode = $(this).parent().next("p");
		ulNode.slideDown();
		ulNode.css("display","block");
	},function(){
		$(this).parent().next("p").css("display","none");
		$(this).parent().next("p").slideUp();
	});*/

	});
	
function changeIcon(mainNode) {
	if (mainNode) {
		if (ulNode.css("display")=="none") {
			ulNode.css("display","block");
		} else {
			ulNode.css("display","none");
		}
	}
}