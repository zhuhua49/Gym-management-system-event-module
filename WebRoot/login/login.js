$("#login_0").click(function(){
	if ($("#username").val()==null || $("#username").val()=="")
	  {
	    alert("请填写用户名");
	    return false;
	  }
	if ($("#password").val()==null || $("#password").val()=="")
	  {
	    alert("请填写密码");
	    return false;
	  }
});