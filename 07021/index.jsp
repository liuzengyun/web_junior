<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*,java.sql.*"%>
<%
    String un=request.getParameter("user");
    String driverName = "com.mysql.jdbc.Driver";
    String dbURL ="jdbc:mysql://47.93.184.169:3306/java" ;

    Driver driver = (Driver)Class.forName(driverName).newInstance();
    DriverManager.registerDriver(driver);
    Connection conn = DriverManager.getConnection(dbURL, "java", "418521");
    Statement stat=conn.createStatement();

    boolean chongfu=false;

    String sq="select * from a1808030220 where username = '"+un+"'";

    ResultSet rs = stat.executeQuery(sq);
    while (rs.next()) {
      int count = rs.getInt(1);
      if (count > 0) {
        out.print("用户名'"+un+"'已被注册，请更换一个试试！");
        chongfu=true;
        break;
      }
    }
    if(!chongfu)
    {
      out.print("用户名'"+un+"'可以使用！");
        String sql="insert into a1808030220(username) values('"+un+"')";
        stat.executeUpdate(sql);
    }
    stat.close();
    conn.close();

%>