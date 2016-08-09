<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/8/9
  Time: 15:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <script>
       $(function () {
           $('#tree1').tree({
               url:'getLefMenuTree'
           });
       });
    </script>
</head>
<body>
<div id="aa" class="easyui-accordion" style="width:auto;height:auto;">
    <div title="人员管理" data-options="iconCls:'icon-save'" style="overflow:auto;">
        <ul id="tree1">

        </ul>

    </div>
    <div title="资源管理" data-options="iconCls:'icon-reload',selected:true" style="padding:10px;">
        content2
    </div>
    <div title="角色管理" data-options="">
        content3
    </div>
</div>


</body>
</html>
