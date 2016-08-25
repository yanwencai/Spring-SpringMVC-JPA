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
    <title>personRoleMgr</title>
</head>
<body>
<!-- 角色列表 -->
    <div id="personRoleDataGrid"></div>
<hr/>


<!-- 用户列表 -->
<div id="personRoleUserDataGrid"></div>
<div id="personRoleTb" style="display: none;">
    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="personRole.addPerson();">添加用户</a>
    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="personRole.removePerson();">移除用户</a>
</div>


<!-- 用户列表弹出框 -->
<div id="listPersonwin" class="easyui-window" title="添加账号" style="width:800px;height:410px"
     data-options="iconCls:'icon-save',modal:true,closed:true">
    <div id="listPersonTb">
        <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="personRole.add();">Add</a>
        <form autocomplete="off">
            realName：<input type="text" id="sRealName" name="realName"> workNumber：<input type="text" id="sWorkNumber" name="workNumber">
            <input type="button" onclick="personRole.search();" value="搜索">
        </form>
    </div>
    <div id="listPersonDataGrid"></div>
</div>


<script>
    personRole = {
        removePerson: function () {
          var personRoleChecked=$("#personRoleUserDataGrid").datagrid('getChecked');
            if (personRoleChecked==null||personRoleChecked.length==0){
                $.messager.alert("警告","请选择要移除的记录","warning");
            }else{
                var personIds=new Array();
                for(var i=0;i<personRoleChecked.length;i++){
                    personIds.push(personRoleChecked[i].id);
                }
                $.ajax({
                    url:"admin/removeFromRole",
                    data:{"ids":personIds},
                    traditional:true,
                    success:function (data) {
                        var role = $("#personRoleDataGrid").datagrid('getSelected');
                        personRole.refreshPersonList({"roleId": role.id});//刷新用户列表
                        $.messager.alert("提示",data.msg,"info");
                    }
                });
            }
            console.info(personRoleChecked);
            console.info(personIds);
        },
        //弹出添加对话框
        addPerson: function () {
            var node = $("#personRoleDataGrid").datagrid('getSelected');
            if (node == null) {
                $.messager.alert("警告", "请选择一个角色", "warning");
            } else {
                //弹出添加用户对话框
                personRole.refreshWindowPersoList({"roleId": node.id});
                $("#listPersonwin").window('open');
            }
        },
        //点击add按钮
        add: function () {
            var role = $("#personRoleDataGrid").datagrid('getSelected');
            //1.获取选中的列
            var node = $("#listPersonDataGrid").datagrid('getChecked');
            //2.构建提交参数
            if (node != null && node.length > 0) {
                var userIds = new Array();
                for (var i = 0; i < node.length; i++) {
                    userIds.push(node[i].id);
                }
                console.info(node)
                console.info(userIds)
                $.ajax({
                    url: "admin/addPersonRole",
                    data: {"userIds": userIds, "roleId": role.id},
                    traditional: true,
                    success: function (data) {
                        $("#listPersonwin").window('close');
                        personRole.refreshPersonList({"roleId": role.id});//刷新用户列表
                        $.messager.alert("提示", data.msg, "info");
                    },
                    error: function (data) {

                    }
                })
            }
        },

        search: function () {
            $('#listPersonDataGrid').datagrid('load', {
                realName: $("#sRealName").val(),
                workNumber: $("#sWorkNumber").val(),
            });
        },
        //刷新角色下方的用户列表
        refreshPersonList: function (roleparam) {
            $("#personRoleUserDataGrid").datagrid({
                url: "admin/getPersonListByRoleId",
                pagination: "true",
                rownumbers: true,
                fitColumns: true,
                singleSelect: false,
                queryParams: roleparam,
                toolbar: "#personRoleTb",
                columns: [[
                    {field: 'id', title: 'id', hidden: true},
                    {checkbox: true,},
                    {field: 'realName', title: 'realName',},
                    {field: 'workNumber', title: 'workNumber', editor: 'text'},
                    {field: 'age', title: 'age', align: 'right', editor: 'text'},
                    {
                        field: 'sex', title: 'sex', editor: 'text', formatter: function (value, row, index) {
                        if (value == 1) {
                            return "男";
                        } else if (value == 2) {
                            return "女";
                        }
                    }
                    },
                    {field: 'userName', title: 'userName', editor: 'text'},
                    {field: 'email', title: 'email', editor: 'text'},
                    {
                        field: 'createTime', title: 'createTime', editor: {
                        type: 'datetimebox',
                        options: {
                            required: true,
                        },
                    },
                    },
                ]],
            });
        },
        //刷新弹出框person列表，要剔除已经添加了的person
        refreshWindowPersoList: function (roleParam) {
            $('#listPersonDataGrid').datagrid({
                url: 'admin/getAllPersonByNotIn',
                toolbar: "#listPersonTb",
                queryParams: roleParam,
                pagination: true,
                rownumbers: true,
                fitColumns: true,
                pageSize: 10,
                pageList: [10, 20, 30, 50, 100],
                //pageList:[10,20,30,40,50,100],
                //singleSelect:true,
                striped: true,
                idField: 'id',
                checkbox: true,
                columns: [[
                    {field: 'id', title: 'id', hidden: true},
                    {checkbox: true,},
                    {field: 'realName', title: 'realName',},
                    {field: 'workNumber', title: 'workNumber', editor: 'text'},
                    {field: 'age', title: 'age', align: 'right', editor: 'text'},
                    {
                        field: 'sex', title: 'sex', editor: 'text', formatter: function (value, row, index) {
                        if (value == 1) {
                            return "男";
                        } else if (value == 2) {
                            return "女";
                        }
                    }
                    },
                    {field: 'userName', title: 'userName', editor: 'text'},
                    {field: 'email', title: 'email', editor: 'text'},
                    {
                        field: 'createTime', title: 'createTime', editor: {
                        type: 'datetimebox',
                        options: {
                            required: true,
                        },
                    },
                    },
                ]],
            });
        }

    };


    $("#personRoleDataGrid").datagrid({
        url: "admin/getRole",
        idField: "id",
        pagination: "true",
        rownumbers: true,
        fitColumns: true,
        singleSelect: true,
        columns: [[
            {field: "id", title: "id"},
            {field: "roleName", title: "roleName", sortable: "true",},
            {field: "roleCode", title: "roleCode", sortable: "true",},
            {field: "description", title: "description",},
        ]],
        onSelect: function (rowIndex, rowData) {//选中角色的时候刷新下方的用户列表datagrid
            var roleparam = {"roleId": rowData.id};
            personRole.refreshPersonList(roleparam);
            console.info(rowIndex + "|" + rowData.id);
        }
    });
</script>


</body>
</html>
