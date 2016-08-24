/**
 * Created by Administrator on 2016/8/10.
 */

$(function () {
    $('#aa').accordion({
        fit: true
    });

    $('#tree1').tree({
        url: 'admin/getLefMenuTree',
        onClick: function (node) {
            var isExist = $("#tt").tabs("exists", node.text)
          console.log(node)
            if (isExist==true){
                $("#tt").tabs("select", node.text)
            }else if (node.level != null && node.level != "" && isExist == false&&node.url!=null&&node.url!="") {
                $('#tt').tabs('add', {
                    title: node.text,
                    fit:false,
                    //content: 'Tab Body',
                    href: node.url,
                    closable: true,
                   // border:false,

                });
            }
        }
    });











});



