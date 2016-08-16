/**
 * Created by Administrator on 2016/8/10.
 */

$(function () {
    $('#aa').accordion({
        fit: true
    });

    $('#tree1').tree({
        url: 'getLefMenuTree',
        onClick: function (node) {
            var isExist = $("#tt").tabs("exists", node.text)
          console.log(node)
            if (node.level != null && node.level != "" && isExist == false&&node.url!=null&&node.url!="") {
                $('#tt').tabs('add', {
                    title: node.text,
                    fit:false,
                    //content: 'Tab Body',
                    href: "personMgr",
                    closable: true,
                   // border:false,


                });
            }
        }
    });











});



