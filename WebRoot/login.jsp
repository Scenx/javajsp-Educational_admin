<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/4/27
  Time: 22:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>信息管理系统_用户登录</title>
    <style type="text/css">
        <!--
        body {
            margin-left: 0px;
            margin-top: 0px;
            margin-right: 0px;
            margin-bottom: 0px;
            background-color: #016aa9;
            overflow:hidden;
        }
        .STYLE1 {
            color: #000000;
            font-size: 12px;
        }
        -->
    </style>
</head>
<body>
<s:fielderror cssStyle="color:red" />
<form action="<%=basePath %>login/login_CheckLogin.action" method="post" name="form1">
    <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td><table width="962" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td height="235" background="<%=basePath %>images/login_03.gif">&nbsp;</td>
                </tr>
                <tr>
                    <td height="53"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="394" height="53" background="<%=basePath %>images/login_05.gif">&nbsp;</td>
                            <td width="206" background="<%=basePath %>images/login_06.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="16%" height="25"><div align="right"><span class="STYLE1">用户</span></div></td>
                                    <td width="57%" height="25"><div align="center">
                                        <input type="text" name="admin.username" style="width:105px; height:17px; background-color:#292929; border:solid 1px #7dbad7; font-size:12px; color:#6cd0ff">
                                    </div></td>
                                    <td width="27%" height="25">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td height="25"><div align="right"><span class="STYLE1">密码</span></div></td>
                                    <td height="25"><div align="center">
                                        <input type="password" name="admin.password" style="width:105px; height:17px; background-color:#292929; border:solid 1px #7dbad7; font-size:12px; color:#6cd0ff">
                                    </div></td>
                                    <td height="25"><div align="left"><img style="cursor:hand;" onclick="document.forms[0].submit();" src="<%=basePath %>images/dl.gif" width="49" height="18" border="0"></div></td>
                                </tr>
                            </table></td>
                            <td width="362" background="<%=basePath %>images/login_07.gif">&nbsp;</td>
                        </tr>
                    </table></td>
                </tr>
                <tr>
                    <td height="213" background="<%=basePath %>images/login_08.gif">&nbsp;</td>
                </tr>
            </table></td>
        </tr>
    </table>
</form>
</body>
</html>
