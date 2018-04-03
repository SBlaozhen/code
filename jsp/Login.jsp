<%@ page contentType = "text/html; charset=utf-8" import = "java.sql.*" errorPage = "error.jsp" %>

<html>

  <head>

  </head>

<body>

<div style=text-align:center>
    <%
    String num = request.getParameter("num");

    session.setAttribute("username",num);

    String userpassword =  request.getParameter("password");
    String s=request.getParameter("radio");
    String s1="1";

    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

     Connection connect = DriverManager.getConnection(

    		 "jdbc:sqlserver://localhost:1433;DatabaseName=专家学员;user=sa;password=123456");//登录JDBC链接数据库

    Statement stmt = connect.createStatement();//从数据库里面取东西对比
    
if(s.equals(s1)){
    String sql = "select  *  from 学员信息表 where 学员账号='"+num+"'and 学员密码='"+userpassword+"'";
    ResultSet i = stmt.executeQuery(sql);
    if(i.next())

    {

        
        response.setHeader("refresh","1;url = student.html");

    }
    else
    {
        out.println(i.next()+"ff");

       out.println("<script language = 'javaScript'> alert('密码错误，请重新输入用户名！');</script>");

       response.setHeader("refresh","1;url =index.html");

    }
}
else{
	String sql = "select  *  from 专家信息表 where 专家账号='"+num+"'and 专家密码='"+userpassword+"'";
    ResultSet i = stmt.executeQuery(sql);
    if(i.next())

    {

        
        response.setHeader("refresh","1;url =professor.html");

    }
    else
    {
        out.println(i.next()+"ff");

       out.println("<script language = 'javaScript'> alert('密码错误，请重新输入用户名！');</script>");

       response.setHeader("refresh","1;url =index.html");

    }
	
}
    

    stmt.close();

    connect.close();

 

%>
</div>

  </body>

<html>