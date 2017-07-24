$(document).on('turbolinks:load',function(){


$(".sortable, .place-1").sortable({
cancel: '.stop'
});

$(".sortable, .place-1").sortable({
connectWith: [".sortable", ".place-1"]
});

// $(".sortable").sortable({
// connectWith: [".sortable", ".place-1"]
// });

// $(".place-1").sortable({
// connectWith: [".sortable"]
// });

// $(".place-1").sortable({
// connectWith: [".place-1"]
// });


$(".sortable").disableSelection();
$(".place-1").disableSelection();

// $.cookie.defaults.path = "/";
//
//
$(".sortable").sortable({
update: function(event, ui) {
var updateArray = $(".sortable").sortable("toArray").join(",");
Cookies.set("sortable", updateArray, {expires: 90});
}
});

//$(".place-1").sortable({
//update: function(event, ui) {
//var updateArray = $(".place-1").sortable("toArray").join(",");
//Cookies.set("sortable1", updateArray, {expires: 90});
//var num = 1;
//$(".place-1").each(function(i,elem){
//alert($(this).attr("class"));
//var updateArray = $(this).sortable("toArray").join(",");
//Cookies.set("sortables" + num, updateArray, {expires: 90});
//num = num + 1;
//});
//}
//});

if(Cookies.get("sortable")) {
var cookieValue = Cookies.get("sortable").split(",");
$.each(cookieValue, function(index, value){
$("#" + value).appendTo(".sortable");
});
}

if(Cookies.get("sortable1")) {
var cookieValue = Cookies.get("sortable1").split(",");
$.each(cookieValue, function(index, value){
$("#" + value).appendTo(".place-1");
});
}



//変化があった時にすべて保存
var obj = [];
$(".place-1").sortable({
update: function(event, ui) {
$(".place-1").each(function(i,elem){
var updateArray = $(this).attr("id") + "=" + $(this).sortable("toArray").join(",").replace("worker-1000,","").replace("worker-1000","");
obj.push(updateArray);
});
Cookies.set("sortables", obj.join("+"), {expires: 90}); //locationのidでcookie保存
obj = [];
}
});

//復元処理
if(Cookies.get("sortables")) {
  // alert(Cookies.get("sortables"));
var cookieValue = {};
//objの作成
var obj2 = {};
cookieValue = Cookies.get("sortables").split("+");
$.each(cookieValue, function(index, value){
obj2[value.split("=")[0]] = value.split("=")[1]
});
//復元
$(".place-1").each(function(i,elem){
var s_id = $(this).attr("id");
$.each(obj2[s_id].split(","), function(index, value){
$("#" + value).appendTo("#" + s_id);
});
});
}








});
