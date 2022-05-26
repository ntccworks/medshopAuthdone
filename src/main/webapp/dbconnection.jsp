<%@ page import = "java.sql.*"%>
<%! Connection conn = null ; %>
<% 
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","admin123");	
}catch (Exception e){
	out.print("Error encountered while trying to connect the Database : \n"+e);
}
%>