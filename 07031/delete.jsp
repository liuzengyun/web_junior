<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*,java.sql.*,net.sf.json.*"%>
<%
    String id=request.getParameter("id");
    String driverName = "com.mysql.jdbc.Driver";
    String dbURL ="jdbc:mysql://47.93.184.169:3306/java" ;
    Driver driver = (Driver)Class.forName(driverName).newInstance();
    DriverManager.registerDriver(driver);
    Connection conn = DriverManager.getConnection(dbURL, "java", "418521");
    Statement stat=conn.createStatement();

    String sql = "delete from a1808030220 where id="+id;
    stat.executeUpdate(sql);
    out.print(sql);
    stat.close();
    conn.close();

%>