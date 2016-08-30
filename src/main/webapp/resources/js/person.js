/**
 * Created by Administrator on 2016/8/10.
 */

$(function () {
    $('#aa').accordion({
        fit: true
    });

    $('#tree1').tree({
        url: 'admin/getLefMenuTree',
        animate:true,
        lines:true,
       // dnd:true,
        onClick: function (node) {
            var isExist = $("#tt").tabs("exists", node.text)
            if (isExist==true){
                $("#tt").tabs("select", node.text)
            }else if (node.level !=0 && node.level != "0" && isExist == false&&node.url!=null&&node.url!="") {
                $('#tt').tabs('add', {
                    title: node.text,
                    fit:true,
                    //content: 'Tab Body',
                    href: node.url,
                    closable: true,
                   // border:false,

                });
            }
        },
        onBeforeLoad:function (node,param) {
            if (node ==null){
                return true;
            }else if (node!=null){
                return false;
            }
           console.info(node);
            console.info(param);
            // return false;
        }
    });











});



