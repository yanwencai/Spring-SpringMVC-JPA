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
            if (node.level != null && node.level != "" && isExist == false) {
                $('#tt').tabs('add', {
                    border: false,
                    title: node.text,
                    //content: 'Tab Body',
                    href: "personMgr",
                    closable: true,
                    fit: false,

                });
            }
        }
    });











});



