<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/4/27
  Time: 22:19
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
    <title>修改密码</title>
    <STYLE type=text/css>
        BODY {
            MARGIN-LEFT: 0px; BACKGROUND-COLOR: #ffffff
        }
        .STYLE1 {color: #ECE9D8}
        .label {font-style:italic; }
        .errorLabel {font-style:italic;  color:red; }
        .errorMessage {font-weight:bold; color:red; }
    </STYLE>
    <script src="<%=basePath %>calendar.js"></script>
</head>
<%
    String username=(String)session.getAttribute("username");
    if(username==null){
        response.getWriter().println("<script>top.location.href='" + basePath + "login.jsp';</script>");
    }
%>
<body>
<TABLE align="center" height="100%" cellSpacing=0 cellPadding=0 width="80%" border=0>
    <TBODY>
    <TR>
        <TD align="left" vAlign=top ><br><form action="<%=basePath %>password/ChangePassword.action" method="post" name="form1">
            <table width='100%' cellspacing='1' cellpadding='3' bgcolor='#CCCCCC' class="tablewidth">


                <tr>
                    <td align="right" width="35%">以前的密码:</td>
                    <td width=65%><input name="oldPassword" type=password /></td>
                </tr>
                <tr>
                    <td align="right" width="35%">输入新密码:</td>
                    <td width=65%><input name="newPassword" type=password /></td>
                </tr>
                <tr>
                    <td align="right" width="35%">再输入新密码:</td>
                    <td width=65%><input name="newPassword2" type=password /></td>
                </tr>
                <tr bgcolor='#FFFFFF'>
                    <td colspan="4" align="center">
                        <input type='submit' name='button' value='修改' >
                        &nbsp;&nbsp;

                    </td>
                </tr>

            </table>
        </form>
        </TD>
    </TR>
    </TBODY>
</TABLE>
</body>
</html>
