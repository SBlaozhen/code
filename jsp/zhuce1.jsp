<%@ page contentType = "text/html; charset=utf-8" import = "java.sql.*"  %>
<html>  
  <head>  
  </head>  
  <body>  
  <div style=text-align:center>
    <%      
    		request.setCharacterEncoding("UTF-8");
            String user = request.getParameter("account");
            String password = request.getParameter("password");
            String name = request.getParameter("name");
            String sex = request.getParameter("sex");
            String age = request.getParameter("age");
            String job = request.getParameter("job");
            String tele = request.getParameter("tele");
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection connect = DriverManager.getConnection(
           		 "jdbc:sqlserver://localhost:1433;DatabaseName=专家学员;user=sa;password=123456");//登录JDBC链接数据库
           		Statement stmt = connect.createStatement();
           		String sql ="select * from 学员信息表 where 学员账号 = '" + user + "' and 学员密码='"+password+"'";  
              ResultSet rs = stmt.executeQuery(sql);  
                if(rs.next()){  
                    out.println("<script language='javascript'>alert('该用户已存在，请重新注册！');window.location.href='student2.html';</script>");  
                }else{  
                	String sql2="Insert into 学员信息表 values('" + user + "','" + password + "','" + name + "','" + sex + "','" + age + "','" + job + "','" + tele + "')";
                    PreparedStatement tmt = connect.prepareStatement(sql2);  
                    int rst = tmt.executeUpdate();  
                        if (rst != 0){  
                              out.println("<script language='javascript'>alert('用户注册成功！');window.location.href='index.html';</script>");    
                        }else{  
                           out.println("<script language='javascript'>alert('用户注册失败！');window.location.href='student2.html';</script>");    
                        }  
                }  
     %>  
     </div>
  </body>  
</html>  