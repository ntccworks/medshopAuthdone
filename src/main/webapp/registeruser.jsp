<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@include file = "dbconnection.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	 	String username = request.getParameter("username");
	 	String email = request.getParameter("email");
	 	String password = request.getParameter("password");
	 	String confPassword = request.getParameter("confPassword");
	 	
	 	if (!username.isEmpty() && !email.isEmpty() && !password.isEmpty() && !confPassword.isEmpty()){
	 		 if (password.equals(confPassword)){
	 			Statement st=conn.createStatement();
	 			String emailExists=null;
	 			String userNameExists=null;
	 			int flag=0;

	 			ResultSet rs=st.executeQuery("select * from MEDSHOPUSER");
	 			while(rs.next()){
	 				emailExists=rs.getString(2);
	 				userNameExists = rs.getString(1);
	 				if(email.equalsIgnoreCase(emailExists) && username.equalsIgnoreCase(userNameExists))
	 				{
	 			 		flag=1; //This indicates there is already an existing email id in the database
	 				}
	 			}
	 			if (flag == 0){
	 				try{
		 				 PreparedStatement pst=conn.prepareStatement("insert into MEDSHOPUSER values(?,?,?,?,?)");
		 				 pst.setString(1,username);
		 				 pst.setString(2,email); 
		 				 pst.setString(3,password);
		 				 pst.setInt(4, 1);
		 				 pst.setInt(5, 0);
		 				 int t=pst.executeUpdate();
		 				 if(t>0){
		 					response.sendRedirect("Login.html");
		 				 }
		 				 conn.close();
		 			 }
		 			 catch (SQLException e){
		 				 out.println("Prepared statement problem "+ e);
		 			 }
	 			}else if (flag == 1){
	 				out.println("Please change your email id or username");
	 			}
	 			 
	 		 }else{
	 			 out.println("Passwords do not match");
	 		 }
	 	 }else{
	 		 out.print("<strong style = \"color:red\">Failed to create an account. Please fill up all the details <a  href = \"sign_up.html\"> here </a>!</strong>");
	 	 }
	%>
</body>
</html>