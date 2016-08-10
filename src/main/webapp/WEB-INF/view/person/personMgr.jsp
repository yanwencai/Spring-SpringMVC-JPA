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

<script>
    $('#dg').datagrid({
        url:'getAllPerson',
        toolbar:"#tb",
        pagination:true,
        rownumbers:true,
        pageList:[10,20,30,40,50,100],
        singleSelect:true,
        idField:'id',
        columns:[[
            {field:'id',title:'id',width:100,hidden:true},
            {field:'realName',title:'realName',width:100,editor:'text'},
            {field:'workNumber',title:'workNumber',width:100,editor:'text'},
            {field:'age',title:'age',width:100,align:'right',editor:'text'},
            {field:'sex',title:'sex',width:100,editor:'text'},
            {field:'userName',title:'userName',width:100,editor:'text'},
            {field:'email',title:'email',width:100,editor:'text'},
            {field:'createTime',title:'createTime',width:100,editor:'datebox'},
            {field:'action',title:'Action',width:80,align:'center',
                formatter:function(value,row,index){
                    if (row.editing){
                        var s = '<a href="#" onclick="saverow(this)">Save</a> ';
                        var c = '<a href="#" onclick="cancelrow(this)">Cancel</a>';
                        return s+c;
                    } else {
                        var e = '<a href="#" onclick="editrow(this)">Edit</a> ';
                        var d = '<a href="#" onclick="deleterow(this)">Delete</a>';
                        return e+d;
                    }
                }
            }

        ]],
        onBeforeEdit:function(index,row){
            row.editing = true;
            updateActions(index);
        },
        onAfterEdit:function(index,row){
            row.editing = false;
            updateActions(index);
        },
        onCancelEdit:function(index,row){
            row.editing = false;
            updateActions(index);
        }


    });
    function updateActions(index){
        $('#dg').datagrid('updateRow',{
            index: index,
            row:{}
        });
    }
    function getRowIndex(target){
        var tr = $(target).closest('tr.datagrid-row');
        return parseInt(tr.attr('datagrid-row-index'));
    }
    function editrow(target){
        $('#dg').datagrid('beginEdit', getRowIndex(target));
    }
    function saverow(target){
        $('#dg').datagrid('endEdit', getRowIndex(target));
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
    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="javascript:alert('Add')">Add</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-cut" plain="true" onclick="javascript:alert('Cut')">Cut</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="modify()">修改</a>
</div>


</body>


</html>