<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<meta charset="utf-8"/>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>中鑫财富</title>
    <%@ include file="meta.jsp"%>
    <link href="<%=basePath%>resources/login/css/reset.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>resources/login/css/base.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>resources/login/css/login.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=basePath%>resources/login/js/jquery.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/login/js/jquery.autoheight.js"></script>
    <!--[if ie 6]>
    <script src="<%=basePath%>resources/login/js/iepng.js" type="text/javascript"></script>
    <![endif]-->
    <style type="text/css">
        html,body {overflow:hidden;overflow-x:hidden;overflow-y:hidden;}
    </style>

</head>

<body>
<div class="l_header">
    <div class="i1000">
        <h1 class="l_logo" title="上海市"></h1>
    </div>
</div>
<div class="l_contwarp">
    <div class="l_cont">
        <div class="l_cont_in p_rel">
            <div class="login_box p_abs"></div>
            <div class="login_box_in p_abs">
                <div class="login_box_cont">
                    <h2 class="h2_sty" title="登录"></h2>
                    <form action="login" method="post" autoComplete="off">
                    <dl class="dl_sty">
                        <dd>
                            <label for="usename">用户名：</label>
                            <input type="text" class="ipt_sty w230" id="usename" name="userName"/>
                        </dd>
                        <dd>
                            <label for="usepwd">密&nbsp;码：</label>
                            <input type="password" class="ipt_sty w230" id="usepwd" name="password"/>
                        </dd>
                       <%-- <dd>
                            <label for="useyzm">验证码：</label>
                            <input type="text" class="ipt_sty w150" id="useyzm" />
                            <a href="javascript:;" class="yzm" title="点击切换验证码"><img src="images/img/yzm.png" width="71" height="26" alt="点击切换验证码" /></a>
                        </dd>--%>
                        <dd>
                            <input type="submit" value="&nbsp;" class="btn_submit" />
                        </dd>
                    </dl>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="l_footer">
    <div class="i1000 pt_25 pb_10">版权所有：</div>
</div>
</body>
</html>
