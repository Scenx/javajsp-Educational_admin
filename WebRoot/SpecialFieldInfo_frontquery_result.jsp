<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2017/4/27
  Time: 22:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*"%>
<%@ page import="com.scen.entity.SpecialFieldInfo" %>
<%@ page import="com.scen.entity.CollegeInfo" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    List<SpecialFieldInfo> specialFieldInfoList = (List<SpecialFieldInfo>)request.getAttribute("specialFieldInfoList");
    //获取所有的specialCollegeNumber信息
    List<CollegeInfo> collegeInfoList = (List<CollegeInfo>)request.getAttribute("collegeInfoList");
    CollegeInfo collegeInfo = (CollegeInfo)request.getAttribute("collegeInfo");

    int currentPage =  (Integer)request.getAttribute("currentPage"); //当前页
    int totalPage =   (Integer)request.getAttribute("totalPage");  //一共多少页
    int  recordNumber =   (Integer)request.getAttribute("recordNumber");  //一共多少记录
    String specialFieldNumber = (String)request.getAttribute("specialFieldNumber"); //专业编号查询关键字
    String specialFieldName = (String)request.getAttribute("specialFieldName"); //专业名称查询关键字
    String specialBirthDate = (String)request.getAttribute("specialBirthDate"); //成立日期查询关键字
%>
<html>
<head>
    <title>专业信息查询</title>
    <style type="text/css">
        <!--
        body {
            margin-left: 0px;
            margin-top: 0px;
            margin-right: 0px;
            margin-bottom: 0px;
        }
        .STYLE1 {font-size: 12px}
        .STYLE3 {font-size: 12px; font-weight: bold; }
        .STYLE4 {
            color: #03515d;
            font-size: 12px;
        }
        -->
    </style>

    <script src="<%=basePath %>calendar.js"></script>
    <script>
        var  highlightcolor='#c1ebff';
        //此处clickcolor只能用win系统颜色代码才能成功,如果用#xxxxxx的代码就不行,还没搞清楚为什么:(
        var  clickcolor='#51b2f6';
        function  changeto(){
            source=event.srcElement;
            if  (source.tagName=="TR"||source.tagName=="TABLE")
                return;
            while(source.tagName!="TD")
                source=source.parentElement;
            source=source.parentElement;
            cs  =  source.children;
//alert(cs.length);
            if  (cs[1].style.backgroundColor!=clickcolor&&source.id!="nc")
                for(i=0;i<cs.length;i++){
                    cs[i].style.backgroundColor=clickcolor;
                }
            else
                for(i=0;i<cs.length;i++){
                    cs[i].style.backgroundColor="";
                }
        }

        function  changeback(){
            if  (event.fromElement.contains(event.toElement)||source.contains(event.toElement)||source.id=="nc")
                return
            if  (event.toElement!=source&&cs[1].style.backgroundColor!=clickcolor)
//source.style.backgroundColor=originalcolor
                for(i=0;i<cs.length;i++){
                    cs[i].style.backgroundColor="";
                }
        }

        /*跳转到查询结果的某页*/
        function GoToPage(currentPage,totalPage) {
            if(currentPage==0) return;
            if(currentPage>totalPage) return;
            document.forms[0].currentPage.value = currentPage;
            document.forms[0].submit();

        }

        function changepage(totalPage)
        {
            var pageValue=document.bookQueryForm.pageValue.value;
            if(pageValue>totalPage) {
                alert('你输入的页码超出了总页数!');
                return ;
            }
            document.specialFieldInfoQueryForm.currentPage.value = pageValue;
            document.specialFieldInfoQueryForm.submit();
        }

    </script>
</head>
<body>
<form action="<%=basePath %>/SpecialFieldInfo/SpecialFieldInfo_FrontQuerySpecialFieldInfo.action" name="specialFieldInfoQueryForm" method="post">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td height="30" background="<%=basePath %>images/tab_05.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="12" height="30"><img src="<%=basePath %>images/tab_03.gif" width="12" height="30" /></td>
                    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="46%" valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="5%"><div align="center"><img src="<%=basePath %>images/tb.gif" width="16" height="16" /></div></td>
                                    <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[专业信息管理]-[专业信息查询]</td>
                                </tr>
                            </table></td>
                            <td width="54%"><table border="0" align="right" cellpadding="0" cellspacing="0">

                            </table></td>
                        </tr>
                    </table></td>
                    <td width="16"><img src="<%=basePath %>images/tab_07.gif" width="16" height="30" /></td>
                </tr>
            </table></td>
        </tr>


        <tr>
            <td>
                专业编号:<input type=text name="specialFieldNumber" value="<%=specialFieldNumber %>" />&nbsp;
                专业名称:<input type=text name="specialFieldName" value="<%=specialFieldName %>" />&nbsp;
                所在学院：<select name="specialCollegeNumber.collegeNumber">
                <option value="">不限制</option>
                <%
                    for(CollegeInfo collegeInfoTemp:collegeInfoList) {
                %>
                <option value="<%=collegeInfoTemp.getCollegeNumber() %>"><%=collegeInfoTemp.getCollegeName() %></option>
                <%
                    }
                %>
            </select>
                成立日期:<input type=text readonly  name="specialBirthDate" value="<%=specialBirthDate %>" onclick="setDay(this);"/>&nbsp;
                <input type=hidden name=currentPage value="1" />
                <input type=submit value="查询" />
            </td>
        </tr>
        <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="8" background="<%=basePath %>images/tab_12.gif">&nbsp;</td>
                    <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="b5d6e6" onmouseover="changeto()"  onmouseout="changeback()">
                        <tr>
                            <!--
            <td width="3%" height="22" background="<%=basePath %>images/bg.gif" bgcolor="#FFFFFF"><div align="center">
              <input type="checkbox" name="checkall" onclick="checkAll();" />
            </div></td> -->
                            <td width="3%" height="22" background="<%=basePath %>images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">序号</span></div></td>
                            <td  height="22" background="<%=basePath %>images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">专业编号</span></div></td>
                            <td  height="22" background="<%=basePath %>images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">专业名称</span></div></td>
                            <td  height="22" background="<%=basePath %>images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">所在学院</span></div></td>
                            <td  height="22" background="<%=basePath %>images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">成立日期</span></div></td>
                            <td  height="22" background="<%=basePath %>images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">联系人</span></div></td>
                            <td  height="22" background="<%=basePath %>images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">联系电话</span></div></td>
                            <td  height="22" background="<%=basePath %>images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">详情</span></div></td>
                        </tr>
                        <%
                            /*计算起始序号*/
                            int startIndex = (currentPage -1) * 3;
            	/*遍历记录*/
                            for(int i=0;i<specialFieldInfoList.size();i++) {
                                int currentIndex = startIndex + i + 1; //当前记录的序号
                                SpecialFieldInfo specialFieldInfo = specialFieldInfoList.get(i); //获取到SpecialFieldInfo对象
                        %>
                        <tr>
                            <td height="20" bgcolor="#FFFFFF"><div align="center" class="STYLE1">
                                <div align="center"><%=currentIndex %></div>
                            </div></td>
                            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1"><%=specialFieldInfo.getSpecialFieldNumber() %></span></div></td>
                            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1"><%=specialFieldInfo.getSpecialFieldName() %></span></div></td>
                            <td bgcolor="#FFFFFF"><div align="center"><span class="STYLE1"><%=specialFieldInfo.getSpecialCollegeNumber().getCollegeName() %></span></div></td>
                            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1"><%=specialFieldInfo.getSpecialBirthDate() %></span></div></td>
                            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1"><%=specialFieldInfo.getSpecialMan() %></span></div></td>
                            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1"><%=specialFieldInfo.getSpecialTelephone() %></span></div></td>
                            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1"><a href="<%=basePath  %>SpecialFieldInfo/SpecialFieldInfo_FrontShowSpecialFieldInfoQuery.action?specialFieldNumber=<%=specialFieldInfo.getSpecialFieldNumber() %>">查看</a></span></div></td>
                        </tr>
                        <%	} %>
                    </table></td>
                    <td width="8" background="images/tab_15.gif">&nbsp;</td>
                </tr>
            </table></td>
        </tr>

        <tr>
            <td height="35" background="<%=basePath %>images/tab_19.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="12" height="35"><img src="<%=basePath %>images/tab_18.gif" width="12" height="35" /></td>
                    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td class="STYLE4">&nbsp;&nbsp;共有<%=recordNumber %>条记录，当前第 <%=currentPage %>/<%=totalPage %> 页</td>
                            <td><table border="0" align="right" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="40"><img src="<%=basePath %>images/first.gif" width="37" height="15" style="cursor:hand;" onclick="GoToPage(1,<%=totalPage %>);" /></td>
                                    <td width="45"><img src="<%=basePath %>images/back.gif" width="43" height="15" style="cursor:hand;" onclick="GoToPage(<%=currentPage-1 %>,<%=totalPage %>);"/></td>
                                    <td width="45"><img src="<%=basePath %>images/next.gif" width="43" height="15" style="cursor:hand;" onclick="GoToPage(<%=currentPage+1 %>,<%=totalPage %>);" /></td>
                                    <td width="40"><img src="<%=basePath %>images/last.gif" width="37" height="15" style="cursor:hand;" onclick="GoToPage(<%=totalPage %>,<%=totalPage %>);"/></td>
                                    <td width="100"><div align="center"><span class="STYLE1">转到第
                    <input name="pageValue" type="text" size="4" style="height:12px; width:20px; border:1px solid #999999;" />
                    页 </span></div></td>
                                    <td width="40"><img src="<%=basePath %>images/go.gif" onclick="changepage(<%=totalPage %>);" width="37" height="15" /></td>
                                </tr>
                            </table></td>
                        </tr>
                    </table></td>
                    <td width="16"><img src="<%=basePath %>images/tab_20.gif" width="16" height="35" /></td>
                </tr>
            </table></td>
        </tr>
    </table>
</form>
</body>
</html>
