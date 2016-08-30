<%@ page import="com.zxbl.auth.model.Person" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/8/9
  Time: 12:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>通用权限管理系统</title>
    <%@include file="/meta.jsp"%>

   <%-- <link rel="stylesheet" type="text/css" href="<%=basePath%>resources/easyUI/themes/bootstrap/easyui.css">--%>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>resources/easyUI/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>resources/easyUI/themes/icon.css">
    <script type="text/javascript" src="<%=basePath%>resources/easyUI/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/easyUI/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/easyUI/locale/easyui-lang-zh_CN.js"></script>
    <style>
        body{font-family:'Hiragino Sans GB','Microsoft Yahei',"WenQuanYi Micro Hei",SimSun,Tahoma,Arial,Helvetica,STHeiti;}
    </style>

</head>
<body>
<div id="cc" class="easyui-layout" data-options="fit:true">
    <div data-options="region:'north',split:true" style="height:100px;background-color: #074286;">
        <div style="float:left;width:60%;height: 100%;"> </div>
        <div style="float:right;width:38%;height: 100%;">
            <table style="float:right;font-size: 14px;color:cornsilk;height: 90px;margin-right: 50px;">
                <tr><td> &nbsp;</td></tr>
                <tr><td>欢迎：<% Person person = (Person) request.getSession().getAttribute("user"); %>  <%= person.getRealName()%> |
                    <a href="logout" style="font-size: 14px;color:cornsilk;text-decoration: none;">退出</a> |
                    <a href="#" style="font-size: 14px;color:cornsilk;text-decoration: none;">帮助</a>
                </td></tr>
            </table>
        </div>
    </div>
    <div data-options="region:'south',split:true" style="height:50px;"></div>
    <div data-options="region:'west',title:'导航',split:true" style="width:200px;">
       <jsp:include page="leftMenu.jsp"/>
    </div>

    <div  class="easyui-panel" data-options="region:'center',border:false" data-options="fit:true" style="padding:1px;background:#eee;" >
        <div id="tt" class="easyui-tabs" data-options="fit:true">
            <div title="readMe" data-options="border:true" style="padding: 10px;">
                <h1>系统说明</h1>
                <h2>模块划分</h2>
                <ul>
                    <li>人员管理模块：维护人的基本信息</li>
                    <li>资源管理模块：维护各应用系统的菜单资源</li>
                    <li>角色管理模块：根据现实的组织结构划分角色，并将对应的资源授予角色，相同的角色具有相同的资源权限；用户授权就是把人加入到指定的角色。</li>
                </ul>
            </div>

        </div>
    </div>



  <%--  <div id="cc" class="easyui-layout" data-options="fit:true">
        <div data-options="region:'north',title:'North Title',split:true" style="height:100px;"></div>
        <div data-options="region:'south',title:'South Title',split:true" style="height:100px;"></div>
        <div data-options="region:'west',title:'West',split:true" style="width:100px;"></div>
        <div data-options="region:'center',title:'center title'" style="padding:5px;background:#eee;"></div>
    </div>--%>

</body>


</html>
<script type="application/javascript" src="<%=basePath%>resources/js/person.js"></script>