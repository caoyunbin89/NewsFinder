$(document).ready(function(){
	//ҳ���е�DOM�Ѿ�װ�����ʱ��ִ�еĴ���
	$("#button").click(function(){
		//�ҵ����˵����Ӧ���Ӳ˵���
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