$(document).ready(function(){

	// Shows textbox for entering email id when you click on forgot password...
	$("#forgotpassword").click(function(){
    	$("#verifyemail").show(500);
    });

	/*$("nav ul").on("click","li",function(){
		var selectedTab = $(this);
		$("nav ul li").each(function(){
			if($(this).hasClass("selectedTab"))
				$(this).removeClass("selectedTab");
		});
		$(this).addClass("selectedTab");
	});*/

	// Enables the save profile button when any editing is done in the name and email textboxes...
	$("#editprofileform input:first").keypress(function(){
		$(this).closest("form").find("input[type='submit']").removeAttr("disabled");
	});

	var isSamePassword = false;
	$("#verifypassword").keyup(function(){
		$("#rightColumn .errorBox").text("");
		var verifypassword = $(this).val();
		var newpassword = $("#newpassword").val();
		if(newpassword.indexOf(verifypassword) == 0){
			isSamePassword = true;
		}
		else{
			isSamePassword = false;
			$("#rightColumn .errorBox").text("Passwords dont match");
		}
	});

	$("#changepasswdform").submit(function(){
		if(isSamePassword == false)
			return false;
		else
			return true;
	});

});
