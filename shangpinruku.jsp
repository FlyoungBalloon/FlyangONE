<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>添加商品信息</title>
<style type="text/css">
       a{text-decoration:none;
         }
	   *:focus{outline:none;}   /*为什么覆盖了marquee？*/
	   body{text-align: center;}
	   form{                     /*设置表单样式*/
	   	height: 580px;
	   	width: 400px;
	   	margin: -170px 0 0 -240px;
	   	padding: 10px;
        position: absolute;
        top: 30%;
        left: 50%;
        z-index: 10;
        background-color: #eee;
	   }
	   form:before{
	   	content: '';
	   	position: absolute;
	   	z-index: -1;
	   	border: 1px dashed #ccc;
	   	top: 5px;
	   	bottom: 5px;
	   	left:5px;
	   	right: 5px;
	   }
	   input{
	   	float: left;
	   	padding: 5px 10px 10px 15px;
	   	margin: 0 0 10px 0;
	   	width: 253px;
	   	border: 1px solid #ccc;
	   	background: #f1f1f1;
	   	font-size: 14px;
	   	border-radius: 5px;
	   }
	   input:focus{
	   	background-color: #fff;
	   	border-color: #e8c291;
	   	outline: none;
	   	box-shadow: 0 0 0 1px #e8c291 inset;
	   }
	   input:hover{
	   	border-color: inherit !important;
	   	background-color: #efefef;
	   	border-radius: 5px 0 0 5px;
	   }
	   input:not(:focus){opacity: 0.6;}
	   input:valid{opacity: 0.8;}
	   input:focus:invalid{
	   	border: 1px solid red;
	   	background-color: #ffeff0;
	   }
	   section{width: 400px; margin: 0 auto;}
	   .clearfix{clear: both;}
	   #submit:hover,
	   #submit:focus{
	   	background-color: #fddb6f;
	   }
	   #submit{
	   	background-color: #ffb94b;
	   	border-width: 1px;
	   	border-style: solid;
	   	border-color: #D69E31 #E3A037 #D5982D #E3A037;
	   	float: left;
	   	height: 35px;
	   	padding: 0;
	   	width: 120px;
	   	cursor: pointer;
	   	font: bold 15px Arial,Helvetica;
        color: #8f5a0a;
        margin: 10px 20px 10px 30px;

	   }
</style>
</head>
<body background="C:\Users\admin\Desktop\Desktop pictures\553d8e82c366f.jpg">
<marquee scrollAmount=4 width=1080 style="Z-INDEX:999"><font color=red><b>您好，欢迎管理员登录进行操作！！</b></font></marquee>
<form action="shangpinruku.jsp" method="post">
<table align="center"width="%50"border="0.5">
<caption><b><h2><font color="blue">请添加商品信息</font></h2></b></caption>
<tr>
<th width="%30">编号：</th>
<td width="%70"><input name="bianhao"type="text"></td>
</tr>
<tr>
<th>名称：</th>
<td><input name="mingcheng"type="text"></td>
</tr>
<tr>
<th>供应商：</th>
<td><input name="gongyingshang"type="text"></td>
</tr>
<tr>
<th>单价：</th>
<td><input name="danjia"type="text">元</td>
</tr>
<tr>
<th>数量：</th>
<td><input name="shuliang"type="text"></td>
</tr>
<tr>
<th>总价：</th>
<td><input name="zongjia"type="text">元</td>
</tr>
<tr>
<th>进货日期：</th>
<td><input name="jinhuo"type="text"></td>
</tr>
<tr>
<th>退货日期：</th>
<td><input name="tuihuo"type="text"></td>
</tr>
<tr>
<th>交接人员：</th>
<td><input name="renyuan"type="text"></td>
</tr>
<tr>
<th>备注：</th>
<td><input name="beizhu"type="text"></td>
</tr>
<tr>
<th colspan="2">
<input type="submit" name="submit"value="添加" id="submit">
<input type="reset" value="重置" id="submit">
</th></tr>
<th><a href="kucunfirstpage.html">返回权限页面</a></th>
<th><a href="kucunfirstpage.html">返回查看页面</a></th>
</table>
</form>

<%
request.setCharacterEncoding("utf-8");
String submit=request.getParameter("submit");
if(submit!=null&&!submit.equals(""))
{
  String bianhao=request.getParameter("bianhao");
  String mingcheng=request.getParameter("mingcheng");
  String gongyingshang=request.getParameter("gongyingshang");
  String danjia=request.getParameter("danjia");
  String shuliang=request.getParameter("shuliang");
  String zongjia=request.getParameter("zongjia");
  String jinhuo=request.getParameter("jinhuo");
  String tuihuo=request.getParameter("tuihuo");
  String renyuan=request.getParameter("renyuan");
  String beizhu=request.getParameter("beizhu");
  Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
  Connection con=DriverManager.getConnection("jdbc:odbc:chaoshi");
  Statement stmt=con.createStatement();
  String sql="insert into ruku(bianhao,mingcheng,gongyingshang,danjia,shuliang,zongjia,jinhuo,tuihuo,renyuan,beizhu)values('"+bianhao+"','"+mingcheng+"','"+gongyingshang+"','"+danjia+"','"+shuliang+"','"+zongjia+"','"+jinhuo+"','"+tuihuo+"','"+renyuan+"','"+beizhu+"')";
  String sql2="insert into kucun(bianhao,mingcheng,gongyingshang,danjia,shuliang,jinhuo,tuihuo,renyuan,beizhu)values('"+bianhao+"','"+mingcheng+"','"+gongyingshang+"','"+danjia+"','"+shuliang+"','"+jinhuo+"','"+tuihuo+"','"+renyuan+"','"+beizhu+"')";
  int i=stmt.executeUpdate(sql);           //执行sql语句
  int j=stmt.executeUpdate(sql2);
  //int i=stmt.executeUpdate("insert into books(name,author,publish_name,price)values('"+name+"','"+author+"',
  //'"+publish_name+"',"+price+")");
  if((i==1)&&(j==1))
  {
  out.println("<script language='javaScript'>alert('添加成功，单击确定跳转到主页！');</script>");
  response.setHeader("refresh","1;url=kucunfirstpage.html");     
  }
  else{
  out.println("<script language='javaScript'>alert('添加失败，单击确定返回添加页面！');</script>");
 response.setHeader("refresh","1;url=tushuruku.jsp");
 }
 stmt.close();
 con.close();
 }
 %>
</body>
</html>
