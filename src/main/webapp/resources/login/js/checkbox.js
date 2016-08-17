function getid(id){return document.getElementById(id);}
function gettag(tag,obj){if(obj){return obj.getElementsByTagName(tag)}else{return document.getElementsByTagName(tag)}}
function addLoadEvent(func){var oldonload=window.onload;if(typeof window.onload!="function"){window.onload=func;}else{window.onload=function(){oldonload();func();}};}
function radio_style(){
if(gettag("input")){
var r=gettag("input");
function select_element(obj,type){
obj.parentNode.style.background="url(../images/checkbox.gif) no-repeat -16px -15px";
if(obj.type=="checkbox"){obj.parentNode.style.background="url(../images/checkbox.gif) no-repeat 0px -16px";}
if(type){obj.parentNode.style.background="url(../images/checkbox.gif) no-repeat -16px 0px";if(obj.type=="checkbox"){obj.parentNode.style.background="url(../images/checkbox.gif) no-repeat 0px 0px";}}
}
for(var i=0;i<r.length;i++){
if(r[i].type=="radio"||r[i].type=="checkbox"){
r[i].style.opacity=0;r[i].style.filter="alpha(opacity=0)";
r[i].onclick=function(){select_element(this);unfocus();}
if(r[i].checked==true){select_element(r[i]);}else{select_element(r[i],1);}
}
}
function unfocus(){
for(var i=0;i<r.length;i++){
if(r[i].type=="radio"||r[i].type=="checkbox"){if(r[i].checked==false){select_element(r[i],1)}}
}
}
}
}
addLoadEvent(radio_style);

