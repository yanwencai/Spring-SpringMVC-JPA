<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/8/9
  Time: 15:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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
        url:'admin/getAllPerson',
        toolbar:"#tb",
        fit:true,
        pagination:true,
        rownumbers:true,
        pageSize:10,
        pageList:[10,20,30,50,100],
        //pageList:[10,20,30,40,50,100],
        singleSelect:true,
        striped:true,
        fitColumns:true,
        border:false,
        idField:'id',
        columns:[[
            {field:'id',title:'id',width:100,hidden:true},
            {field:'realName',title:'realName',width:100,editor:{type:'text',
                options:{
                required:true,
                }
            }},
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
            },
            },
        ]],

        //双击行，让行进入编辑状态，其他行不能进入编辑状态
        /*onDblClickRow:function (rowIndex, rowData) {
            $("#save").show();
            if (edit==null){
                edit = rowIndex;
                $("#dg").datagrid('beginEdit',rowIndex);
            }
        },*/
        onAfterEdit:function (rowIndex, rowData, changes) {
            console.log("rowData"+rowData.age);
            $.ajax({
                type:"POST",
                url:"admin/updatePerson",
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
            alert("save");
            $("#dg").datagrid('endEdit',edit);//结束编辑，会触发onAfterEdit
            edit=null;

        },
        add:function () {
            $.post("admin/createWorkNumber","",function (data) {
                $("#addwin input[name=workNumber]").val(data.workNumber).removeClass("validatebox-invalid")
            });
            $("#addPerson").form('clear');//清除表单数据
            $("#addwin").dialog("open");
        },
        search:function () {
          $('#dg').datagrid('load',{
              realName:$("#sRealName").val(),
              workNumber:$("#sWorkNumber").val(),
          });
        },
        modify:function () {
            var person=$("#dg").datagrid('getSelected');
            console.log(person)
            if (person!=null&&person!=""){
                for (name in person){
                    console.log(name+":"+person[name])
                    if (name =='sex'){
                        console.log("aaaa--"+name+":"+person[name])
                        $("#selectSex").combobox('select',person[name]);
                        //$('#selectSex option[value='+person[name]+']').attr('selected','selected');
                      //  console.log($('#selectSex option[value='+person[name]+']').attr('selected','selected'))
                    }else if (name == 'createTime'){
                        $("#createTime").datetimebox({
                            value:person[name],
                        });
                    }else{
                        $("input[name="+name+"]").removeClass('validatebox-invalid');//取消验证框的红色提示
                        $("#win input[name="+name+"]").val(person[name])
                    }
                }
                $("#win").dialog("open");
            }else{
                $.messager.alert("警告","请选择一行","warning");
            }
        },
        checkUsername:function (input) {
            var param={"userName":input.value};
            $.post("admin/checkUsername",param,function (data) {
                $("#checkUserName").validatebox({
                    invalidMessage:data.msg,
                    validate:function () {
                        alert("validate");
                    }
                });

            });

            //alert(input.value);
        }
    }



    function modifySubmit() {
      $("#modifyPerson").form('submit',{
          url:'admin/modifyPerson',
          onSubmit:function () {
              var isValid=$(this).form('validate');
              return isValid;
          },
          success:function (data) {
              $("#dg").datagrid('reload')
              var data=eval('(' + data + ')');
              $("#win").window("close");
              $.messager.alert('提示',data.msg,"info");
          }
      })
    }

    function addSubmit() {
        $("#addPerson").form('submit',{
            url:'admin/addPerson',
            onSubmit:function () {
                return $(this).form("validate");
            },
            success:function (data) {
                $("#dg").datagrid('reload')
                var data=eval('('+data+')');
                $("#addwin").window('close');
                $.messager.alert("提示",data.msg);
            }
        });
    }
</script>

<div id="tb">
    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="obj.add();">添加</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="obj.modify();">修改</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="javascript:alert('remove')">删除</a>
    <a href="#" id="save" style="display: none;" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="obj.save();">save</a>
    <br/>
    <form autocomplete="off">
    realName：<input type="text" id="sRealName" name="realName"> workNumber：<input type="text" id="sWorkNumber" name="workNumber">
        <input type="button" onclick="obj.search();" value="搜索">
    </form>
</div>

<!-- 修改 -->
<div id="win" class="easyui-dialog" title="修改人员信息" style="width:400px;height:400px;"
     data-options="iconCls:'icon-edit',modal:true,closed:true" buttons="#dlg-buttons">
    <form id="modifyPerson" method="post" autocomplete="off">
       <table style="margin-left:10px; height: 310px;">
           <tr><td>id:</td><td><input class="easyui-validatebox" type="text" name="id" readonly="readonly" data-options="required:true" />  </td></tr>
           <tr><td>realName:</td><td><input class="easyui-validatebox" type="text" name="realName" data-options="required:true" />  </td></tr>
           <tr><td>workNumber:</td><td><input class="easyui-validatebox" type="text" name="workNumber" data-options="required:true" />  </td></tr>
           <tr><td>age:</td><td><input class="easyui-validatebox" type="text" name="age" data-options="required:true" />  </td></tr>

           <tr><td>sex:</td><td>
               <select id="selectSex" name="sex" class="easyui-combobox" data-options="required:true" style="width: 100px;">
                   <option value=""></option>
                   <option value="1">男</option>
                   <option value="2">女</option>
               </select>
            <%--   <input class="easyui-validatebox" type="text" name="sex" data-options="required:true" /> --%> </td></tr>

           <tr><td>userName:</td><td><input class="easyui-validatebox" type="text" name="userName" data-options="required:true" />  </td></tr>
           <tr><td>password:</td><td><input class="easyui-validatebox" type="text" name="password" data-options="required:true" />  </td></tr>
           <tr><td>email:</td><td><input class="easyui-validatebox" type="text" name="email" data-options="required:true,validType:'email'" />  </td></tr>
           <tr><td>createTime:</td><td><input id="createTime" class="easyui-datetimebox" editable="false" type="text" name="createTime" data-options="required:true" />  </td></tr>
       </table>
    </form>
</div>
<div id="dlg-buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="modifySubmit();" style="width:90px">Save</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#win').dialog('close')" style="width:90px">Cancel</a>
</div>

<!-- 新增 -->
<div id="addwin" class="easyui-dialog" title="添加人员信息" style="width:400px;height:400px;"
     data-options="iconCls:'icon-add',modal:true,closed:true" buttons="#adddialogbtn">
    <form id="addPerson" method="post" autocomplete="off">
        <table style="margin-left:10px; height: 310px;">
            <tr><td>realName:</td><td><input class="easyui-validatebox" type="text" name="realName" data-options="required:true" />  </td></tr>
            <tr><td>workNumber:</td><td><input class="easyui-validatebox" type="text" name="workNumber" data-options="required:true" />  </td></tr>
            <tr><td>age:</td><td><input class="easyui-validatebox" type="text" name="age" data-options="required:true" />  </td></tr>
            <tr><td>sex:</td><td>
                <select  name="sex" class="easyui-combobox" data-options="required:true" style="width: 100px;">
                    <option value=""></option>
                    <option value="1">男</option>
                    <option value="2">女</option>
                </select>
                 </td></tr>


            <%--<tr><td>userName:</td><td><input id="checkUserName" class="easyui-validatebox" type="text" name="userName" data-options="required:true" onblur="obj.checkUsername(this);"/>  </td></tr>--%>
            <tr><td>userName:</td><td><input id="checkUserName" class="easyui-validatebox" type="text" name="userName" data-options="required:true" validtype="remote['admin/checkUserName','userName']" invalidMessage="用户名已存在"/>  </td></tr>
            <tr><td>password:</td><td><input class="easyui-validatebox" type="text" name="password" data-options="required:true" />  </td></tr>
            <tr><td>email:</td><td><input class="easyui-validatebox" type="text" name="email" data-options="required:true,validType:'email'" />  </td></tr>
            <tr><td>createTime:</td><td><input class="easyui-datetimebox" editable="false" type="text" name="createTime" data-options="required:true" />  </td></tr>
        </table>

    </form>
</div>
<div id="adddialogbtn">
    <a id="btn2" href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="addSubmit();">保存</a>
    <a id="btn3" href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="$('#addwin').dialog('close')">取消</a>
</div>
</body>


</html>
