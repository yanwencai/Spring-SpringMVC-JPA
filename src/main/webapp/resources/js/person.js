/**
 * Created by Administrator on 2016/8/10.
 */

$(function () {
    $('#aa').accordion({
        fit:true
    });

    $('#tree1').tree({
        url:'getLefMenuTree',
        onClick:function (node) {
            var isExist=$("#tt").tabs("exists",node.text)
            if(node.level!=null&&node.level!=""&&isExist==false ){
                $('#tt').tabs('add', {
                    border:false,
                    title: node.text,
                    //content: 'Tab Body',
                    href:"personMgr",
                    closable: true,
                    fit:false,

                });
            }
        }
    });
});



function modify() {
    // alert("modify");
    var ed = $('#dg').datagrid('getEditor', {index:1,field:'age'});
    $(ed.target).datebox('setValue', '333');

    //console.log($('#dg').datagrid('beginEdit'));
}