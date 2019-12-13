var match_type=document.getElementById("match_type");
var place=document.getElementById("place");

var arr_match_type=new Array(new Option("羽毛球",'羽毛球'),new Option("乒乓球","乒乓球"),new Option("台球","台球"),new Option("网球","网球"));
var arr_place=new Array();
arr_place[0]=new Array(new Option("1号场",'1号场'),new Option("2号场",'2号场'),new Option("3号场",'3号场'),new Option("4号场",'4号场'),new Option("5号场",'5号场'),new Option("6号场",'6号场'),new Option("7号场",'7号场'),new Option("8号场",'8号场'),new Option("9号场",'9号场'),new Option("10号场",'10号场'));
arr_place[1]=new Array(new Option("1号台",'1号台'),new Option("2号台",'2号台'),new Option("3号台",'3号台'),new Option("4号台",'4号台'),new Option("5号台",'5号台'),new Option("6号台",'6号台'),new Option("7号台",'7号台'),new Option("8号台",'8号台'),new Option("9号台",'9号台'),new Option("10号台",'10号台'));
arr_place[2]=new Array(new Option("1号台",'1号台'),new Option("2号台",'2号台'),new Option("3号台",'3号台'),new Option("4号台",'4号台'),new Option("5号台",'5号台'),new Option("6号台",'6号台'),new Option("7号台",'7号台'),new Option("8号台",'8号台'),new Option("9号台",'9号台'),new Option("10号台",'10号台'));
arr_place[3]=new Array(new Option("1号场",'1号场'),new Option("2号场",'2号场'),new Option("3号场",'3号场'),new Option("4号场",'4号场'),new Option("5号场",'5号场'),new Option("6号场",'6号场'),new Option("7号场",'7号场'),new Option("8号场",'8号场'),new Option("9号场",'9号场'),new Option("10号场",'10号场'));

//动态载入所有赛事类型
for(var i=0;i<arr_match_type.length;i++){
	match_type.options[i]=arr_match_type[i];
	}
for(var i=0;i<arr_place[0].length;i++){
	place.options[i]=arr_place[0][i];
	}

$(".selectpicker").selectpicker({width:88});


//选中赛事类型之后，根据索引动态载入相应场地
function change_place(){
	//清空上次的选项
	place.selectedIndex=-1;
	//获取赛事类型的下拉列表选中的索引
	var index=match_type.selectedIndex;
	for(var i=0;i<arr_place[index].length;i++){
		place.options[i]=arr_place[index][i];
		}
	$('#place').selectpicker('refresh');
	}