<%@ Page Language="C#" ContentType="text/html" responseEncoding="gb2312"  SmartNavigation="True" aspcompat="true" %>
<!--
┌─ smosoft.com 小牛超级ASPX网站探针 - V1.0 ─────────────///
│                                                                 
│  感谢您使用 www.smosoft.com 小牛软件开发的个人免费工具                             
│  本代码完全公开和免费，权供个人学习研究之用,任何人不得复制修改后    
│  重新公开发表代码;不得用做商业用途;不得向其他使用者收费.否则,小牛  
│  保留进一步追究法律责任的权利.                                                             
│  使用时，请保留此段信息，谢谢配合                            
│                                                               
│  作者：info#smosoft.com(#改为@)                                       
│                                                                      2005/04/30              
│                                                               
└──────────────────────  smosoft.com ───///
-->
<html>
<head>
<title>小牛超级ASPX网站探针 - V1.0</title>
<META HTTP-EQUIV="Content-Language" CONTENT="zh-CN"> 
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
a:link{ color: #000000; text-transform: #000000; text-decoration: none }
a:visited { color: #000000; text-transform: #000000; text-decoration: none }
a:active { color: #3333ff; font-style: normal; text-decoration: none }
a:hover { color: red; font-style: normal; text-decoration: underline; font-weight: normal}
font{font-size: 12px;}
td{font-size: 12px;}
body{font-size: 12px;}
.fontColor1 {color: #CC6600}
.fontBig1 {font-size: 14px}
.fonts {	COLOR: #3F8805
}
.backq {	BACKGROUND-COLOR: #eefee0
}
.backs {	COLOR: #ffffff; BACKGROUND-COLOR: #3f8805
}
.fonts1 {	COLOR: #3f8805
}
.backc {	BACKGROUND-COLOR: #3F8805;
	BORDER: medium none;
	COLOR: #ffffff;
	HEIGHT: 18px;
	font-size: 9pt
}
.backq1 {	BACKGROUND-COLOR: #EEFEE0
}
.input {	BORDER: #111111 1px solid;
	FONT-SIZE: 9pt;
	BACKGROUND-color: #F8FFF0
}
.backs1 {	BACKGROUND-COLOR: #3F8805;
	COLOR: #ffffff;
}
.run{color: red;}
-->
</style>
</head>
<body link="#FF6600" vlink="#FF6600" alink="#FF6600">
<form runat="server">
<table width="556" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><div align="center" class="fontBig1">
      <div align="center"><a href="http://www.smosoft.com" target="_blank"><strong>小牛改写的超级ASP.NET探针 - V1.0</strong></a></div>
    </div>
      <div align="left"><br>
          <br>
      </div>
      <div class="fontColor1">是否支持.NET平台</div>
      <br>
出现以下情况即说明您的空间不支持ASPX文件：<br>
1、访问本文件时提示下载。 <br>
2、访问本文件时看到类似@#&lt;&gt;等字符。
<p><FONT class=fonts1>服务器的基本参数</FONT> </p>
<TABLE cellSpacing=0 cellPadding=0 width=500 bgColor=#3f8805 border=0>
  <TBODY>
    <TR>
      <TD>
        <TABLE cellSpacing=1 cellPadding=0 width=500 border=0>
          <TBODY>
            <TR bgColor=#eefee0 height=18>
              <TD width="135" align=left>&nbsp;服务器名</TD>
              <TD width="312"><font size="2"> &nbsp;
                    <asp:label ID="name" runat="server" />    
              </font></TD>
            </TR>
            <TR bgColor=#eefee0 height=18>
              <TD align=left>&nbsp;服务器IP</TD>
              <TD><font size="2"> &nbsp;
                    <asp:label ID="ip" runat="server" />    
              </font></TD>
            </TR>
            <TR bgColor=#eefee0 height=18>
              <TD align=left>&nbsp;服务器域名</TD>
              <TD><font size="2">&nbsp;
                    <asp:label ID="domain" runat="server" />    
              </font></TD>
            </TR>
            <TR bgColor=#eefee0 height=18>
              <TD align=left>&nbsp;服务器端口</TD>
              <TD><font size="2"> &nbsp;
                    <asp:label ID="port" runat="server" />    
              </font></TD>
            </TR>
            <TR bgColor=#eefee0 height=18>
              <TD align=left>&nbsp;服务器时间</TD>
              <TD><font size="2"> &nbsp;
                    <asp:label ID="ontime" runat="server" />    
              </font></TD>
            </TR>
            <TR bgColor=#eefee0 height=18>
              <TD align=left>&nbsp;服务器语言</TD>
              <TD><font size="2">&nbsp;
                    <asp:label ID="lan" runat="server" />    
              </font></TD>
            </TR>
            <TR bgColor=#eefee0 height=18>
              <TD align=left>&nbsp;服务器CPU数量</TD>
              <TD><font size="2"> &nbsp;
                    <asp:label ID="cpuqty" runat="server" />    
              </font></TD>
            </TR>
            <TR bgColor=#eefee0 height=18>
              <TD align=left>&nbsp;服务器CPU结构</TD>
              <TD><font size="2"> &nbsp;
                    <asp:label ID="cpumore" runat="server" />    
              </font></TD>
            </TR>
            <TR bgColor=#eefee0 height=18>
              <TD align=left>&nbsp;服务器操作系统</TD>
              <TD><font size="2"> &nbsp;
                    <asp:label ID="system" runat="server" />    
              </font></TD>
            </TR>
            <TR bgColor=#eefee0 height=18>
              <TD align=left>&nbsp;DotNET引擎版本<font size="2">&nbsp;</font></TD>
              <TD><font size="2"> &nbsp;
                    <asp:label ID="dotnet" runat="server" />    
              </font></TD>
            </TR>
          </TBODY>
      </TABLE></TD>
    </TR>
  </TBODY>
</TABLE>
<p><FONT class=fonts1>服务器的其它参数</FONT> </p>
<TABLE cellSpacing=0 cellPadding=0 width=500 bgColor=#3f8805 border=0>
  <TBODY>
    <TR>
      <TD>
        <TABLE cellSpacing=1 cellPadding=0 width=500 border=0>
          <TBODY>
            <TR bgColor=#eefee0 height=18>
              <TD width="135" align=left>&nbsp;当前执行用户</TD>
              <TD width="312"><font size="2">&nbsp;
                    <asp:label ID="user" runat="server" />    
              </font></TD>
            </TR>
            <TR bgColor=#eefee0 height=18>
              <TD align=left>&nbsp;系统安装目录 </TD>
              <TD><font size="2"> &nbsp;
                    <asp:Label ID="sysdir" runat="server" />    
              </font></TD>
            </TR>
            <TR bgColor=#eefee0 height=18>
              <TD align=left>&nbsp;系统临时目录</TD>
              <TD><font size="2">&nbsp;
                    <asp:Label ID="systmp" runat="server" />    
              </font></TD>
            </TR>
            <TR bgColor=#eefee0 height=18>
              <TD align=left>&nbsp;IIS版本</TD>
              <TD><font size="2">&nbsp;
                    <asp:label ID="IIS" runat="server" />    
              </font></TD>
            </TR>
            <TR bgColor=#eefee0 height=18>
              <TD align=left>&nbsp;SSL支持</TD>
              <TD><font size="2">&nbsp;
                    <asp:label ID="SSL" runat="server" />    
              </font></TD>
            </TR>
            <TR bgColor=#eefee0 height=18>
              <TD align=left>&nbsp;CGI版本</TD>
              <TD><font size="2">&nbsp;
                    <asp:label ID="CGI" runat="server" />    
              </font></TD>
            </TR>
            <TR bgColor=#eefee0 height=18>
              <TD align=left>&nbsp;脚本超时时间</TD>
              <TD bgColor=#eefee0><font size="2">&nbsp;
                    <asp:label ID="timeout" runat="server" />    
              </font></TD>
            </TR>
            <TR bgColor=#eefee0 height=18>
              <TD align=left>&nbsp;系统运行时间</TD>
              <TD><font size="2">&nbsp;
                    <asp:label ID="runtime" runat="server" />    
              </font></TD>
            </TR>
            <TR bgColor=#eefee0 height=18>
              <TD align=left>&nbsp;当前文件目录</TD>
              <TD><font size="2">&nbsp;
                    <asp:label ID="path" runat="server" />    
              </font></TD>
            </TR>
            <TR bgColor=#eefee0 height=18>
              <TD align=left>&nbsp;当前文件位置</TD>
              <TD><font size="2">&nbsp;
                    <asp:label ID="pathinfo" runat="server" />    
              </font></TD>
            </TR>
            <TR bgColor=#eefee0 height=18>
              <TD align=left>&nbsp;已使用内存</TD>
              <TD><font size="2"> &nbsp;
                    <asp:label ID="mem" runat="server" />    
              </font></TD>
            </TR>
            <TR bgColor=#eefee0 height=18>
              <TD align=left>&nbsp;主机所在域</TD>
              <TD><font size="2"> &nbsp;
                    <asp:label ID="atdomain" runat="server" />    
              </font></TD>
            </TR>
          </TBODY>
      </TABLE></TD>
    </TR>
  </TBODY>
</TABLE>
<br>
<FONT class=fonts1>组件支持情况</FONT><BR>
* IIS自带的常用组件
<TABLE style="BORDER-COLLAPSE: collapse" borderColor=#3f8805 cellSpacing=0 
cellPadding=0 width=500 border=1>
  <TBODY>
    <TR class=backs align=middle height=18>
      <TD width=325>组 件 名 称</TD>
      <TD width=37 align="center">支持</TD>
      </TR>
    <TR class=backq height=18>
      <TD align=left>&nbsp;MSWC.AdRotator<FONT color=#888888>&nbsp;</FONT></TD>
      <TD align=left><font class=fonts1><b>&nbsp;<font color=red><b></b></font><font size="2">
        <asp:label ID="adrot" runat="server" />        
</font></b></font></TD>
      </TR>
    <TR class=backq height=18>
      <TD align=left>&nbsp;MSWC.BrowserType<FONT color=#888888>&nbsp;</FONT></TD>
      <TD align=left><font class=fonts1><b>&nbsp;<font color=red><b></b></font><font size="2">
      <asp:label ID="brow" runat="server" />      
</font></b></font></TD>
      </TR>
    <TR class=backq height=18>
      <TD align=left>&nbsp;MSWC.NextLink<FONT color=#888888>&nbsp;</FONT></TD>
      <TD align=left><font class=fonts1><b>&nbsp;<font color=red><b></b></font><font size="2">
      <asp:label ID="next" runat="server" />      
</font></b></font></TD>
      </TR>
    <TR class=backq height=18>
      <TD align=left>&nbsp;MSWC.Tools<FONT color=#888888>&nbsp;</FONT></TD>
      <TD align=left><font class=fonts1><b>&nbsp;<font color=red><b></b></font><font size="2">
      <asp:label ID="tool" runat="server" />      
</font></b></font></TD>
      </TR>
    <TR class=backq height=18>
      <TD align=left>&nbsp;MSWC.Status<FONT color=#888888>&nbsp;</FONT></TD>
      <TD align=left><font class=fonts1><b>&nbsp;<font color=red><b></b></font><font size="2">
      <asp:label ID="stat" runat="server" />      
</font></b></font></TD>
      </TR>
    <TR class=backq height=18>
      <TD align=left>&nbsp;MSWC.Counters<FONT color=#888888>&nbsp;</FONT></TD>
      <TD align=left><font class=fonts1><b>&nbsp;<font color=red><b></b></font><font size="2">
      <asp:label ID="coun" runat="server" />      
</font></b></font></TD>
      </TR>
    <TR class=backq height=18>
      <TD align=left>&nbsp;IISSample.ContentRotator<FONT 
      color=#888888>&nbsp;</FONT></TD>
      <TD align=left>&nbsp;<font class=fonts1><b><font size="2">
        <asp:label ID="cont" runat="server" />        
</font></b></font></TD>
      </TR>
    <TR class=backq height=18>
      <TD align=left>&nbsp;IISSample.PageCounter<FONT 
    color=#888888>&nbsp;</FONT></TD>
      <TD align=left><font class=fonts1><b>&nbsp;<font color=red><b></b></font><font size="2">
      <asp:label ID="pagec" runat="server" />      
</font></b></font></TD>
      </TR>
    <TR class=backq height=18>
      <TD align=left>&nbsp;MSWC.PermissionChecker<FONT 
      color=#888888>&nbsp;</FONT></TD>
      <TD align=left><font class=fonts1><b>&nbsp;<font color=red><b></b></font><font size="2">
      <asp:label ID="perm" runat="server" />      
</font></b></font></TD>
      </TR>
    <TR class=backq height=18>
      <TD align=left>&nbsp;Scripting.FileSystemObject<FONT 
      color=#888888>&nbsp;(FSO 文本文件读写)</FONT></TD>
      <TD align=left><font class=fonts1><b>&nbsp;<font color=red><b></b></font><font size="2">
      <asp:label ID="fso" runat="server" />      
</font></b></font></TD>
      </TR>
    <TR class=backq height=18>
      <TD align=left>&nbsp;Adodb.Connection<FONT color=#888888>&nbsp;(ADO 数据对象)</FONT></TD>
      <TD align=left><font class=fonts1><b>&nbsp;<font color=red><b></b></font><font size="2">
      <asp:label ID="adodb" runat="server" />      
</font></b></font></TD>
      </TR>
  </TBODY>
</TABLE>
<BR>
* 常见的文件上传组件
<TABLE style="BORDER-COLLAPSE: collapse" borderColor=#3f8805 cellSpacing=0 
cellPadding=0 width=500 border=1>
  <TBODY>
    <TR class=backs align=middle height=18>
      <TD width=324>组 件 名 称</TD>
      <TD width=40 align="center">支持</TD>
      </TR>
    <TR class=backq height=18>
      <TD align=left>&nbsp;SoftArtisans.FileUp<FONT 
      color=#888888>&nbsp;(SA-FileUp 文件上传)</FONT></TD>
      <TD align=left><font color=red><b>&nbsp;<font class=fonts1><b><font size="2">
        </font><font color=red><b><font class=fonts1><b><font size="2"></font></b></font></b></font><font size="2">
        <asp:label ID="saup" runat="server" />        
</font></b></font></b></font></TD>
      </TR>
    <TR class=backq height=18>
      <TD align=left>&nbsp;SoftArtisans.FileManager<FONT 
      color=#888888>&nbsp;(SoftArtisans 文件管理)</FONT></TD>
      <TD align=left><font class=fonts1><b><font size="2">
         </font><font color=red><b>&nbsp;<font class=fonts1><b><font size="2"> </font></b></font></b></font><font size="2">
         <asp:label ID="arup" runat="server" />         
</font></b></font></TD>
      </TR>
    <TR class=backq height=18>
      <TD align=left>&nbsp;LyfUpload.UploadFile<FONT 
      color=#888888>&nbsp;(刘云峰的文件上传组件)</FONT></TD>
      <TD align=left>&nbsp;<font class=fonts1><b><font size="2">
        <asp:label ID="lyup" runat="server" />        
</font></b></font></TD>
      </TR>
    <TR class=backq height=18>
      <TD align=left>&nbsp;Persits.Upload.1<FONT color=#888888>&nbsp;(ASPUpload 文件上传)</FONT></TD>
      <TD align=left><font class=fonts1><b><font size="2">
        </font><font color=red><b>&nbsp;<font class=fonts1><b><font size="2"> </font></b></font></b></font><font size="2">
        <asp:label ID="aspup" runat="server" />        
</font></b></font></TD>
      </TR>
    <TR class=backq height=18>
      <TD align=left>&nbsp;w3.upload<FONT color=#888888>&nbsp;(Dimac 文件上传)</FONT></TD>
      <TD align=left><font class=fonts1><b><font size="2">
        </font><font color=red><b>&nbsp;<font class=fonts1><b><font size="2"> </font></b></font></b></font><font size="2">
        <asp:label ID="w3up" runat="server" />        
</font></b></font></TD>
      </TR>
  </TBODY>
</TABLE>
<BR>
* 常见的邮件收发组件
<TABLE style="BORDER-COLLAPSE: collapse" borderColor=#3f8805 cellSpacing=0 
cellPadding=0 width=500 border=1>
  <TBODY>
    <TR class=backs align=middle height=18>
      <TD width=323>组 件 名 称</TD>
      <TD width=40 align="center">支持</TD>
      </TR>
    <TR class=backq height=18>
      <TD align=left>&nbsp;JMail.SmtpMail<FONT color=#888888>&nbsp;(Dimac JMail 邮件收发) </FONT></TD>
      <TD align=left><font color=red><b>&nbsp;<font class=fonts1><b><font size="2"> </font><font color=red><b><font class=fonts1><b><font size="2"></font></b></font></b></font><font size="2">
      <asp:label ID="jmail" runat="server" />      
</font></b></font></b></font></TD>
      </TR>
    <TR class=backq height=18>
      <TD align=left>&nbsp;CDONTS.NewMail<FONT color=#888888>&nbsp;(虚拟 SMTP 发信)</FONT></TD>
      <TD align=left><font color=red><b>&nbsp;<font class=fonts1><b><font size="2"> </font><font color=red><b><font class=fonts1><b><font size="2"></font></b></font></b></font><font size="2">
      <asp:label ID="cdon" runat="server" />      
</font></b></font></b></font>&nbsp;<font color=red>&nbsp;</font></TD>
      </TR>
    <TR class=backq height=18>
      <TD align=left>&nbsp;Persits.MailSender<FONT color=#888888>&nbsp;(ASPemail 发信)</FONT></TD>
      <TD align=left><font color=red><b>&nbsp;<font class=fonts1><b><font size="2"> </font><font color=red><b><font class=fonts1><b><font size="2"></font></b></font></b></font><font size="2">
      <asp:label ID="pers" runat="server" />      
</font></b></font></b></font></TD>
      </TR>
    <TR class=backq height=18>
      <TD align=left>&nbsp;SMTPsvg.Mailer<FONT color=#888888>&nbsp;(ASPmail 发信)</FONT></TD>
      <TD align=left><font color=red><b>&nbsp;<font class=fonts1><b><font size="2"> </font><font color=red><b><font class=fonts1><b><font size="2"></font></b></font></b></font><font size="2">
      <asp:label ID="smtp" runat="server" />      
</font></b></font></b></font></TD>
      </TR>
    <TR class=backq height=18>
      <TD align=left>&nbsp;DkQmail.Qmail<FONT color=#888888>&nbsp;(dkQmail 发信)</FONT></TD>
      <TD align=left><font color=red><b>&nbsp;<font class=fonts1><b><font size="2"> </font><font color=red><b><font class=fonts1><b><font size="2"></font></b></font></b></font><font size="2">
      <asp:label ID="qmail" runat="server" />      
</font></b></font></b></font></TD>
      </TR>
    <TR class=backq height=18>
      <TD align=left>&nbsp;Geocel.Mailer<FONT color=#888888>&nbsp;(Geocel 发信)</FONT></TD>
      <TD align=left><font color=red><b>&nbsp;<font class=fonts1><b><font size="2"> </font><font color=red><b><font class=fonts1><b><font size="2"></font></b></font></b></font><font size="2">
      <asp:label ID="mailer" runat="server" />      
</font></b></font></b></font></TD>
      </TR>
    <TR class=backq height=18>
      <TD align=left>&nbsp;IISmail.Iismail.1<FONT color=#888888>&nbsp;(IISmail 发信)</FONT></TD>
      <TD align=left><font color=red><b>&nbsp;<font class=fonts1><b><font size="2"> </font><font color=red><b><font class=fonts1><b><font size="2"></font></b></font></b></font><font size="2">
      <asp:label ID="iismail" runat="server" />      
</font></b></font></b></font></TD>
      </TR>
    <TR class=backq height=18>
      <TD align=left>&nbsp;SmtpMail.SmtpMail.1<FONT 
      color=#888888>&nbsp;(SmtpMail 发信)</FONT></TD>
      <TD align=left><font color=red><b>&nbsp;<font class=fonts1><b><font size="2"> </font><font color=red><b><font class=fonts1><b><font size="2"></font></b></font></b></font><font size="2">
      <asp:label ID="smtpmail" runat="server" />      
</font></b></font></b></font></TD>
      </TR>
  </TBODY>
</TABLE>
<BR>
						* 常见的图像处理组件
						<TABLE style="BORDER-COLLAPSE: collapse" borderColor="#3f8805" cellSpacing="0" cellPadding="0"
							width="500" border="1">
							<TBODY>
								<TR class="backs" align="center" height="18">
									<TD width="372">组 件 名 称</TD>
									<TD width="122" align="center">支持</TD>
								</TR>
								<TR class="backq" height="18">
									<TD align="left">&nbsp;SoftArtisans.ImageGen<FONT color="#888888">&nbsp;(SA 的图像读写组件)</FONT></TD>
									<TD align="left"><font color=red><b>&nbsp;<font class=fonts1><b><font size="2"> </font><font color=red><b><font class=fonts1><b><font size="2"></font></b></font></b></font><font size="2">
                                    <asp:label ID="saimg" runat="server" />                                    
</font></b></font></b></font></TD>
								</TR>
								<TR class="backq" height="18">
									<TD align="left">&nbsp;W3Image.Image<FONT color="#888888">&nbsp;(Dimac 的图像读写组件)</FONT></TD>
									<TD align="left"><font color=red><b>&nbsp;<font class=fonts1><b><font size="2"> </font><font color=red><b><font class=fonts1><b><font size="2"></font></b></font></b></font><font size="2">
                                    <asp:label ID="w3img" runat="server" />                                    
</font></b></font></b></font></TD>
								</TR>
							</TBODY>
						</TABLE>
<br>
* 其他组件支持情况检测<br>
<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#3F8805" width="500">
    <tr height="18" class=backq1>
      <td height=30>输入组件的ProgId或ClassId
		<asp:textbox ID="classname" Rows="1" runat="server" TextMode="SingleLine" />
        <asp:button ID="classsub" runat="server" Text="检测" OnClick="sub"  />
      </td>
    </tr>
</table>
<div align="center"><font color=red><b>&nbsp;<font class=fonts1><b><font size="2"> </font><font color=red><b><font class=fonts1><b><font size="2"></font></b></font></b></font><font size="2">
  <asp:label ID="classinfo" runat="server" />
  </font></b></font></b></font>
</div>
<p class="fonts">服务器性能测试</p>
<TABLE style="BORDER-COLLAPSE: collapse" borderColor=#3f8805 cellSpacing=0 
cellPadding=0 width=500 border=1>
  <TBODY>
    <TR class=backs align=middle height=18>
      <TD width=298>测试项目</TD>
      <TD width=78 align="center">使用时间</TD>
      <TD width=76>&nbsp;</TD>
    </TR>
    <TR class=backq height=18>
      <TD align=left>&nbsp;本页执行时间:打开本页面的速度测试</TD>
      <TD align=left><font color=red><b>&nbsp;<font class=fonts1><b><font size="2"> </font><font color=red><b><font class=fonts1><b><font size="2"></font></b></font></b></font><font size="2">
      <asp:label ID="timerun" runat="server" />      
</font></b></font></b></font></TD>
      <TD align=left>&nbsp;<FONT color=red><a href="aspx.aspx" class="run">重算</a></FONT></TD>
    </TR>
    <TR class=backq height=18>
      <TD align=left>&nbsp;整数运算测试:进行100万次加法运算</TD>
      <TD align=left><font color=red><b>&nbsp;<font class=fonts1><b><font size="2"> </font><font color=red><b><font class=fonts1><b><font size="2"></font></b></font></b></font><font size="2">
      <asp:label ID="timetol" runat="server" />      
</font></b></font></b></font></TD>
      <TD align=left>&nbsp;<FONT color=red><a href="aspx.aspx" class="run">重算</a> </FONT></TD>
    </TR>
    <TR class=backq height=18>
      <TD align=left>&nbsp;浮点运算测试:进行100万次开方运算</TD>
      <TD align=left><font color=red><b>&nbsp;<font class=fonts1><b><font size="2"> </font><font color=red><b><font class=fonts1><b><font size="2"></font></b></font></b></font><font size="2">
      <asp:label ID="timekai" runat="server" />      
</font></b></font></b></font></TD>
      <TD align=left><FONT color=red>&nbsp;<a href="aspx.aspx">重算</a></FONT></TD>
    </TR>
  </TBODY>
</TABLE>
<p>&nbsp;</p>
<TABLE cellSpacing=0 cellPadding=0 width=500 border=0>
  <TBODY>
    <TR>
      <TD align=middle>欢迎访问 小牛软件 <A 
      href="http://www.smosoft.com/" target="_blank">http://www.smosoft.com/</A> 为您提供更好的企业软件开发服务.<BR>
        本程序由小牛编写,转载时请保留这些信息.<br>
        如果您有更好的提议,请E-mail:info#smosoft.com(#改为@)给小牛</TD>
    </TR>
  </TBODY>
</TABLE></td>
  </tr>
</table>
</form>
</body>
</html>

<script language="C#" runat="server">
public void Page_Load(Object sender,EventArgs e)
{
	Response.Expires = 0;
	Response.CacheControl = "no-cache";
	if (!Page.IsPostBack)
	{
		 //取得页面执行开始时间
         DateTime stime=DateTime.Now;
		 
		 int build, major, minor,revision;
		 build=Environment.Version.Build;
		 major=Environment.Version.Major;
		 minor=Environment.Version.Minor;
		 revision=Environment.Version.Revision;

		 name.Text=Server.MachineName;
		 ip.Text=Request.ServerVariables["LOCAL_ADDR"];
		 domain.Text=Request.ServerVariables["SERVER_NAME"];
		 port.Text=Request.ServerVariables["SERVER_PORT"];
		 ontime.Text=DateTime.Now.ToString();
		 lan.Text=Request.ServerVariables["HTTP_ACCEPT_LANGUAGE"];
		 cpuqty.Text=System.Environment.GetEnvironmentVariable("NUMBER_OF_PROCESSORS");
		 cpumore.Text=System.Environment.GetEnvironmentVariable("PROCESSOR_ARCHITECTURE");
		 system.Text=Environment.OSVersion.ToString();
		 dotnet.Text=".NET CLR  "+major +"."+ minor + "." + build+"."+revision;
		 
		 user.Text=Environment.UserName;
		 sysdir.Text=System.Environment.GetEnvironmentVariable("windir");
		 systmp.Text=System.Environment.GetEnvironmentVariable("TEMP");
		 mem.Text=(Environment.WorkingSet/1024/1024).ToString()+" MB";
		 atdomain.Text=System.Environment.GetEnvironmentVariable("USERDOMAIN");
		 
		 
		 SSL.Text=Request.ServerVariables["HTTPS"];
		 CGI.Text=Request.ServerVariables["GATEWAY_INTERFACE"];
		 IIS.Text=Request.ServerVariables["SERVER_SOFTWARE"];		 
		 timeout.Text=Server.ScriptTimeout.ToString();
		 runtime.Text=Math.Round((decimal)(Environment.TickCount/600/60))/100+" 小时";
		 path.Text=Request.ServerVariables["APPL_PHYSICAL_PATH"];
		 pathinfo.Text=Request.ServerVariables["PATH_TRANSLATED"];
		 

		 //组件支持验证代码
    	 this.check("MSWC.AdRotator",adrot);
		 this.check("MSWC.BrowserType",brow);
		 this.check("MSWC.NextLink",next);
		 this.check("MSWC.Tools",tool);
		 this.check("AMSWC.Status",stat);
		 this.check("MSWC.Counters",coun);
		 this.check("IISSample.ContentRotator",cont);
		 this.check("IISSample.PageCounter",pagec);
		 this.check("MSWC.PermissionChecker",perm);
		 this.check("Scripting.FileSystemObject",fso);
		 this.check("ADODB.RecordSet",adodb);
		 
		 this.check("SoftArtisans.FileUp",saup);
		 this.check("SoftArtisans.FileManager",arup);
		 this.check("LyfUpload.UploadFile",lyup);
		 this.check("Persits.Upload",aspup);
		 this.check("W3.Upload",w3up);  
		   	 
		 this.check("JMail.SMTPMail",jmail);
		 this.check("CDONTS.NewMail",cdon);
		 this.check("Persits.MailSender",pers);
		 this.check("SMTPsvg.Mailer",smtp);
		 this.check("dkQmail.Qmail",qmail);
		 this.check("Geocel.Mailer",mailer);
		 this.check("iismail.iismail.1",iismail);
		 this.check("SmtpMail.SmtpMail.1",smtpmail);
		 
		 this.check("SoftArtisans.ImageGen",saimg);
		 this.check("W3Image.Image",w3img);

	 
		 //取得页面执行结束时间
 		 DateTime etime=DateTime.Now; 
        //计算页面执行时间
         timerun.Text=((etime-stime).TotalMilliseconds).ToString()+"毫秒";

		 //100万次相加循环测试
		DateTime ontime1=DateTime.Now;
		int sum=0;
		for (int i=1;i<=10000000;i++){
		sum=sum+i;
		}
		DateTime endtime1=DateTime.Now;
		timetol.Text=((endtime1-ontime1).TotalMilliseconds).ToString()+"毫秒";

		//100万次开平方测试
		DateTime ontime2=DateTime.Now;
		long k=2;
		for( int a=1; a < 1000000; a++ )
		{
			 k = k * k;
		}
		DateTime endtime2=DateTime.Now;
		timekai.Text=((endtime2-ontime2).TotalMilliseconds).ToString()+"毫秒";

		
	}
}
bool isobj(string obj){
    try {
        object meobj = Server.CreateObject(obj);
        return(true);
     }
     catch 
     {
        return(false);
     }
}

void check(string obj,Label sup)
	{
		string yes="<font class=fonts1><b>√</b></font>";
		string no="<font color=red><b>×</b></font>";
		try 
		{
			object claobj = Server.CreateObject(obj);
			sup.Text=yes;
		 }
		catch
		{
			sup.Text=no;
		}
	}

 //自定义组件查询
 public void sub(Object Sender,EventArgs e)
 {
	string classobj=classname.Text;
	 if (isobj(classobj))
	 {
		classinfo.Text="检测结果：支持组件"+classobj;
	 }
	 else 
	 {
		classinfo.Text="检测结果：不支持组件"+classobj;
	 }
 }

</script>