<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/8/22
  Time: 13:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>roleMgr</title>
</head>
<body>
<div id="roleDataGrid"></div>

<!-- add role form -->
<div id="roleAddwin" class="easyui-window" title="添加角色" style="width:400px;height:300px;"
     data-options="iconCls:'icon-save',modal:true,closed:true">
    <form id="roleAddForm" autocomplete="off" style="margin: 10px;">
        <table style="line-height: 35px;">
            <tr>
                <td>roleName:</td>
                <td><input type="text" name="roleName" class="easyui-validatebox" data-options="required:true"></td>
            </tr>
            <tr>
                <td>roleCode:</td>
                <td><input type="text" name="roleCode" class="easyui-validatebox" data-options="required:true" validType="remote['admin/roleCodeChk','roleCode']"
                           inValidMessage="roleCode已存在"></td>
            </tr>
            <tr>
                <td>description:</td>
                <td>
                    <textarea name="description" style="margin: 0px; width: 236px; height: 69px;"></textarea>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <a class="easyui-linkbutton" href="javascript:;" onclick="role.addRoleSubmit();">save</a>

                    <a class="easyui-linkbutton" href="javascript:;" onclick="$('#roleAddwin').window('close')">close</a>
                </td>
            </tr>
        </table>
    </form>
</div>

<!-- modify role form -->
<div id="roleModifywin" class="easyui-window" title="编辑角色" style="width:400px;height:300px;"
     data-options="iconCls:'icon-save',modal:true,closed:true">
    <form id="roleModifyForm" autocomplete="off" style="margin: 10px;">
        <table style="line-height: 35px;">
            <tr>
                <td>id:</td>
                <td><input type="text" name="id" class="easyui-validatebox" data-options="required:true"></td>
            </tr>
            <tr>
                <td>roleName:</td>
                <td><input type="text" name="roleName" class="easyui-validatebox" data-options="required:true"></td>
            </tr>
            <tr>
                <td>roleCode:</td>
                <td><input type="text" name="roleCode" class="easyui-validatebox" data-options="required:true" readonly="readonly"></td>
            </tr>
            <tr>
                <td>description:</td>
                <td>
                    <textarea name="description" style="margin: 0px; width: 236px; height: 69px;"></textarea>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <a class="easyui-linkbutton" href="javascript:;" onclick="role.modifyRoleSubmit();">save</a>

                    <a class="easyui-linkbutton" href="javascript:;" onclick="$('#roleModifywin').window('close')">close</a>
                </td>
            </tr>
        </table>
    </form>
</div>



<div id="editAuthWin" class="easyui-window" title="编辑权限" style="width:600px;height:500px;"
     data-options="iconCls:'icon-save',modal:true,closed:true">
    <a id="btn1" href="#" class="easyui-linkbutton" onclick="role.selectAll();">全选</a>|
    <a id="btn2" href="#" class="easyui-linkbutton" onclick="role.unSelectAll();">取消全选</a>|
    <a id="btn3" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="role.saveAuth();">保存</a>
    <hr/>
    <ul id="authMenuTree"></ul>


</div>


<script>
    /*  $(function () {
     $("#roleAddwin").window('close');
     });*/
    role = {
        addRole: function () {
            $("#roleAddwin").window('open');
        },
        //添加角色，添加完成刷新列表
        addRoleSubmit: function () {
            var isValidate = $("#roleAddForm").form("validate");
            if (!isValidate) {
                $.messager.alert("警告", "验证不通过", "warning");
            } else {
                $.post("admin/addRole", $("#roleAddForm").serialize(), function (data) {
                    role.listReLoad();
                    $('#roleAddwin').window('close')
                    $.messager.alert("提示", data.msg, "info");
                });
            }
        },
        //刷新列表
        listReLoad: function () {
            $("#roleDataGrid").datagrid('reload');
        },
        //点击修改按钮，弹出修改窗口，并且填充文本域
        modify: function () {
            var node = $("#roleDataGrid").datagrid('getSelected');
            if (node == null) {
                $.messager.alert("警告", "请选择一行", "warning");
                return;
            }
            $("#roleAddForm").form("clear");
            $("#roleModifywin textarea").val("");
            console.info(node)
            for (name in node) {
                if (name == "description" && node[name] != null) {
                    //todu
                    $("#roleModifywin textarea[name=" + name + "]").removeClass("validatebox-invalid");
                    $("#roleModifywin textarea[name=" + name + "]").val(node[name]);
                   // alert(node[name])
                } else {
                    $("#roleModifywin input[name=" + name + "]").removeClass("validatebox-invalid")
                    $("#roleModifywin input[name=" + name + "]").val(node[name]);
                }
            }
            $("#roleModifywin").window("open");
        },
        //提交修改
        modifyRoleSubmit: function () {
            if ($("#rolemodifyform").form("validate")) {//验证通过
                $.post("admin/modifyRole", $("#roleModifyForm").serialize(), function (data) {
                    $("#roleModifywin").window("close");
                    role.listReLoad();
                    $.messager.alert("提示", data.msg, "info");
                });
            }
        },

        //删除角色
        remove: function () {
            var node = $("#roleDataGrid").datagrid('getSelected');
            if (node == null) {
                $.messager.alert("警告", "请选择一行", "warning");
                return;
            } else {
                $.messager.confirm("确认", "确认删除这条记录吗？", function (r) {
                    if (r) {
                        $.post("admin/removeRole", {"id": node.id}, function (data) {
                            console.info(node)
                            role.listReLoad();
                            $.messager.alert("提示", data.msg, "info");
                        })
                    }
                });
            }
        },
        //授权
        //1.选中一条记录，弹出对话框 2.tree控件加载所有的菜单资源 3.授予的权限要选中状态
        editAuth:function () {
            var node = $("#roleDataGrid").datagrid('getSelected');
            if (node == null) {
                $.messager.alert("警告", "请选择一行", "warning");
                return;
            }
            $("#editAuthWin").window('open');
            $("#authMenuTree").tree({
                url:"admin/getAuthMenuTree",
                checkbox:"true",
                lines:true,
                animate:true,
                onLoadSuccess:function () {
                    $.post("admin/getAppByRoleId",{"roleId":node.id},function (data) {
                        for (var i=0;i<data.length;i++){
                            var snode=$("#authMenuTree").tree('find',data[i].appId);
                            console.info(snode);
                            if ($("#authMenuTree").tree('isLeaf',snode.target)){
                                $("#authMenuTree").tree('check',snode.target);

                            }
                        }
                    })
                }
            });
           // alert("editAuth");
        },
        //全选
        selectAll:function () {
            var roots=$("#authMenuTree").tree('getRoots');
            for (var i=0;i<roots.length;i++){
                $("#authMenuTree").tree('check',roots[i].target);
            }
            console.info(roots)
        },
        //取消全选
        unSelectAll:function () {
            var roots=$("#authMenuTree").tree('getRoots');
            for (var i=0;i<roots.length;i++){
                $("#authMenuTree").tree('uncheck',roots[i].target);
            }
            console.info(roots)
        },
        //保存授权信息 1.获取所有选中的节点
        saveAuth:function () {
            var node = $("#roleDataGrid").datagrid('getSelected');
            var selected=$("#authMenuTree").tree('getChecked');
            var nodes = $('#authMenuTree').tree('getChecked', 'indeterminate');
            console.info(selected);
            console.info(nodes);
            var idArray=new Array();
            for (var i=0;i<selected.length;i++){
                /*var children=selected[i].children;
                if (children.length==0){*/
                    idArray.push(selected[i].id);
             /*   }*/
            }
            for(var i=0;i<nodes.length;i++){
                idArray.push(nodes[i].id);
            }
           $.ajax({
                url:"admin/saveAuth",
                type:'post',
                data:{"idArray":idArray,"roleId":node.id},
                traditional:true,
                success:function (data) {
                    $.messager.alert("提示",data.msg,"info");
                },
                error:function (data) {
                    $.messager.alert("警告",data.msg,"warning");
                }
            });
            console.info("idArray:"+idArray);
        }


    }

    $("#roleDataGrid").datagrid({
        url: "admin/getRole",
        idField: "id",
        fit:true,
        pagination: "true",
        rownumbers: true,
        fitColumns: true,
        singleSelect: true,
        border:false,
        columns: [[
            {field: "id", title: "id"},
            {field: "roleName", title: "roleName", sortable: "true",},
            {field: "roleCode", title: "roleCode", sortable: "true",},
            {field: "description", title: "description",},
        ]],
        toolbar: [{
                iconCls: "icon-add",
                text: "添加",
                handler: role.addRole,
            }, '-',
            {
                iconCls: "icon-edit",
                text: "修改",
                handler: role.modify,
            }, '-',
            {
                iconCls: "icon-remove",
                text: "删除",
                handler: role.remove,
            },'-',{
                text:"资源分配",
                handler:role.editAuth,
            },
        ],
    });


</script>


</body>
</html>
