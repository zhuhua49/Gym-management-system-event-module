$("#match_time").datetimepicker({
    format: 'YYYY-MM-DD HH:mm:ss',
    locale: moment.locale('zh-CN')
});

$("#match_apply_0").click(function(){
	if ($("#match_name").val()==null || $("#match_name").val()=="")
	  {
	    alert("请填写赛事名字");
	    return false;
	  }
	if ($("#applicant").val()==null || $("#applicant").val()=="")
	  {
	    alert("请填写申请人");
	    return false;
	  }
	if ($("#match_time").val()==null || $("#match_time").val()=="")
	  {
	    alert("请填写赛事时间");
	    return false;
	  }
	if ($("#place").val()==null || $("#place").val()=="")
	  {
	    alert("请选择赛事地点");
	    return false;
	  }
});