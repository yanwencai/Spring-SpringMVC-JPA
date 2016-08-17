<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/8/17
  Time: 11:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>应用管理</title>

</head>
<body>
<script>


    app={
        addApp:function() {
            $("#addAppForm").show();
        },
        //1.添加应用信息
        //2.刷新左侧tree
        addAppSubmit:function () {
            if ($("#addAppForm").form('validate')){
                $.post("admin/addApp",$("#addAppForm").serialize(),function (data) {
                    app.getAllApp();

                    alert(data.msg);

                })
            }else{
                $.messager.alert("警告","验证不通过!","warning");
            }

        },
        //获得所有节点，并应用到tree控件
        getAllApp:function () {
            $('#apptree').tree({
                url:'admin/getAllApp'
            });
        },
        modifyApp:function () {
            var app=$("#apptree").tree('getSelected');
            console.info(app)
            if (app ==null){
                $.messager.alert("警告","请选择一个节点","warning");
            }else{
                $("#addAppForm").show();
                for(name in app){
                    if (name=='checked'){
                        console.info(name+":"+app[name]);
                        $("#selectChecked").combobox('select',app[name].toString());
                    }else if(name=='state'){
                        $("#selectState").combobox('select',app[name].toString());
                    }else{
                        $("input[name="+name+"]").removeClass('validatebox-invalid');//取消验证框的红色提示
                        $("input[name="+name+"]").val(app[name]);
                    }

                }
            }

        }

    }


    $(function () {
        app.getAllApp();
    });
</script>
<div id="cc" class="easyui-layout" style="width: 100%; height: 95%;">
    <div data-options="region:'west',split:true" style="width:200px;">
        <a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="app.addApp();">添加应用</a>



        <ul id="apptree" class="easyui-tree"></ul>

    </div>

    <div data-options="region:'center'"  style="padding:5px;background:beige;">
        <div style="margin-bottom:5px">
            <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加下級</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="app.modifyApp();">修改</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true">刪除</a>
          <%--  <a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true"></a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-cut" plain="true"></a>--%>
        </div>
        <hr/>







        <form id="addAppForm" method="post" style="display: none;">
            <table  style="line-height: 35px;">
                id:<input type="text" name="id" />
                createTime:<input type="text" name="createTime" />
                level:<input type="text" name="level" />
                parentId:<input type="text" name="parentId" />

                <tr><td>text：</td><td><input class="easyui-validatebox" type="text" name="text" data-options="required:true" /></td></tr>
                <tr><td>url：</td><td><input class="easyui-validatebox" type="text" name="url" data-options="required:true" /></td></tr>
                <tr><td>orderId：</td><td><input class="easyui-validatebox" type="text" name="orderId" data-options="required:true" /></td></tr>
                <tr><td>checked：</td>
                    <td>
                        <select id="selectChecked" name="checked" required="true" class="easyui-combobox" style="width: 173px;">
                            <option value=""></option>
                            <option value="true">true</option>
                            <option value="false">false</option>
                        </select>
                    </td>
                </tr>
                <tr><td>iconCls：</td><td><input class="easyui-validatebox" type="text" name="iconCls" /></td></tr>
                <tr><td>state：</td>
                    <td>
                        <select id="selectState" name="state" required="true" class="easyui-combobox" style="width: 173px;">
                            <option value=""></option>
                            <option value="closed">closed</option>
                            <option value="open">open</option>
                        </select>
                    </td>
                </tr>
                <tr><td colspan="2" align="center">
                    <a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="app.addAppSubmit();">save</a>
                    <a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-redo'">reset</a>
                </td></tr>
            </table>
        </form>

    </div>
</div>
</body>

</html>

