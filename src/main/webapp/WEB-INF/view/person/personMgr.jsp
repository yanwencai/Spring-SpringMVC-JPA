<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/8/9
  Time: 15:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

</head>
<body>
<table id="dg"></table>

<script>//扩展 dateTimeBox
$.extend($.fn.datagrid.defaults.editors, {
    datetimebox : {
        init: function(container, options){
            var input = $('<input type="text">').appendTo(container);
            options.editable = false;
            input.datetimebox(options);
            return input;
        },
        getValue: function(target){
            return $(target).datetimebox('getValue');
        },
        setValue: function(target, value){
            $(target).datetimebox('setValue', value);
        },
        resize: function(target, width){
            $(target).datetimebox('resize', width);
        },
        destroy : function (target) {
            $(target).datetimebox('destroy');
        },
    }
});
    var edit=null;
    $('#dg').datagrid({
        url:'getAllPerson',
        toolbar:"#tb",
        pagination:true,
        rownumbers:true,
        pageSize:10,
        pageList:[10,20,30,50,100],
        //pageList:[10,20,30,40,50,100],
        singleSelect:true,

        idField:'id',
        columns:[[
            {field:'id',title:'id',width:100,hidden:true},
            {field:'realName',title:'realName',width:100,editor:'text'},
            {field:'workNumber',title:'workNumber',width:100,editor:'text'},
            {field:'age',title:'age',width:100,align:'right',editor:'text'},
            {field:'sex',title:'sex',width:100,editor:'text',formatter:function (value,row,index) {
                if (value ==1){
                    return "男";
                }else if (value ==2){
                    return "女";
                }
            }},
            {field:'userName',title:'userName',width:100,editor:'text'},
            {field:'email',title:'email',width:150,editor:'text'},
            {field:'createTime',title:'createTime',width:120,editor: {
                type : 'datetimebox',
                options : {
                    required : true,
                },
            },formatter:function (value,row,index) {
                var date = new Date(value);
                return date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+" "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();
            }},
        ]],


        //双击行，让行进入编辑状态，其他行不能进入编辑状态
        onDblClickRow:function (rowIndex, rowData) {
            $("#save").show();
            if (edit==null){
                edit = rowIndex;
                $("#dg").datagrid('beginEdit',rowIndex);
            }
        },
        onAfterEdit:function (rowIndex, rowData, changes) {
            console.log("rowData"+rowData.age);
            $.ajax({
                type:"POST",
                url:"updatePerson",
               // dataType:"json",
                data:rowData,

                success:function (data) {
                   $.messager.show({
                       title:"提示",
                       msg:data.msg,
                       showType:'slide',
                       timeout:2000,
                       style:{
                           right:'',
                           top:document.body.scrollTop+document.documentElement.scrollTop,
                           bottom:''
                       }
                   });
                   $("#save").hide();
                }
            })


        },



    });

    obj = {
        //保存按钮
        save:function () {
            $("#dg").datagrid('endEdit',edit);//结束编辑，会触发onAfterEdit
            edit=null;

        },
        add:function () {
            $("#win").window("open");
        }
    }


</script>
<%--
<table id="dg" class="easyui-datagrid" style="height:250px"
       data-options="url:'getAllPerson',fitColumns:true,singleSelect:true"
       iconCls="icon-save" title="person" rownumbers="true" pagination="true"
       toolbar="#tb" >
    <thead>
    <tr>
       <th data-options="field:'id',width:100">id</th>
        <th data-options="field:'age',width:100">age</th>
        <th data-options="field:'email',width:100,align:'right'">email</th>

        <th data-options="field:'realName',width:100">realName</th>
        <th data-options="field:'sex',width:100">sex</th>
        <th data-options="field:'userName',width:100">userName</th>
        <th data-options="field:'workNumber',width:100">workNumber</th>
    </tr>
    </thead>
</table>--%>
<div id="tb">
    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="obj.add();">Add</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="modify()">修改</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="javascript:alert('remove')">remove</a>
    <a href="#" id="save" style="display: none;" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="obj.save();">save</a>
</div>

<div id="win" class="easyui-window" title="My Window" style="width:600px;height:400px;"
     data-options="iconCls:'icon-save',modal:true,closed:true">
    <form id="ff" method="post">
       <table style="margin-left:10px; height: 310px;">
           <tr><td>realName:</td><td><input class="easyui-validatebox" type="text" name="realName" data-options="required:true" />  </td></tr>
           <tr><td>workNumber:</td><td><input class="easyui-validatebox" type="text" name="workNumber" data-options="required:true" />  </td></tr>
           <tr><td>age:</td><td><input class="easyui-validatebox" type="text" name="age" data-options="required:true" />  </td></tr>
           <tr><td>sex:</td><td><input class="easyui-validatebox" type="text" name="sex" data-options="required:true" />  </td></tr>
           <tr><td>userName:</td><td><input class="easyui-validatebox" type="text" name="userName" data-options="required:true" />  </td></tr>
           <tr><td>password:</td><td><input class="easyui-validatebox" type="text" name="password" data-options="required:true" />  </td></tr>
           <tr><td>email:</td><td><input class="easyui-validatebox" type="text" name="email" data-options="required:true,validType:'email'" />  </td></tr>
           <tr><td>createTime:</td><td><input class="easyui-validatebox" type="text" name="createTime" data-options="required:true" />  </td></tr>
           <tr><td colspan="2"><a id="btn" href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>
           </td></tr>
       </table>

    </form>
</div>
</body>


</html>
