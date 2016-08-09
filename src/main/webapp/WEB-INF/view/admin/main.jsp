<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/8/9
  Time: 12:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>


    <link rel="stylesheet" type="text/css" href="../resources/easyUI/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../resources/easyUI/themes/icon.css">
    <script type="text/javascript" src="../resources/easyUI/jquery.min.js"></script>
    <script type="text/javascript" src="../resources/easyUI/jquery.easyui.min.js"></script>
</head>
<body>
<div id="cc" class="easyui-layout" style="width:100%;height:100%;">
    <div data-options="region:'north',title:'North Title',split:true" style="height:100px;"></div>
    <div data-options="region:'south',title:'South Title',split:true" style="height:50px;"></div>
    <%--<div data-options="region:'east',iconCls:'icon-reload',title:'East',split:true" style="width:100px;"></div>--%>
    <div data-options="region:'west',title:'West',split:true" style="width:200px;">
       <jsp:include page="leftMenu.jsp"/>
    </div>

    <div id="" class="easyui-panel" data-options="region:'center'" style="padding:1px;background:#eee;" >
        <div id="mytabs" class="easyui-tabs" data-options="tools:'#tab-tools'" style="width:auto;height:600px;">
        </div>
</div>
</body>
</html>
