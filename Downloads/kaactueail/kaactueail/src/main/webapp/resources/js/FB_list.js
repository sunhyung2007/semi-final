/**
 * 
 */
 
 let moveForm = $("#moveForm");

$(".move").on("click", function(e){
	e.preventDefault();
	moveForm.append("<intput type='hidden' name='FB_num' value=''"+$(this).attr("href")+"'>'");
	moveForm.submit();
});