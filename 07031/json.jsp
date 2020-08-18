<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*,java.sql.*,net.sf.json.*"%>
<%
    String un=request.getParameter("user");
    String driverName = "com.mysql.jdbc.Driver";
    String dbURL ="jdbc:mysql://47.93.184.169:3306/java" ;
    Driver driver = (Driver)Class.forName(driverName).newInstance();
    DriverManager.registerDriver(driver);
    Connection conn = DriverManager.getConnection(dbURL, "java", "418521");
    Statement stat=conn.createStatement();

    boolean chongfu=false;

    String sq="select * from a1808030220";
    ResultSet rs = stat.executeQuery(sq);
    JSONObject js = new JSONObject();
    JSONArray arr=new JSONArray();
    while(rs. next()){
        JSONObject item=new JSONObject();
        item.put("id",rs.getString("id"));
        item.put("username",rs.getString("username"));
        item.put("age",rs.getString("age"));
        arr.add(item);
    }
    js.put("status","success");
    js.put("data",arr);
    out.print(js);

    stat.close();
    conn.close();

%>