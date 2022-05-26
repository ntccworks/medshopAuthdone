<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file ="dbconnection.jsp" %>

<%
String loginName=request.getParameter("loginusername");
String loginPassword = request.getParameter("loginPassword");
if (!loginName.isEmpty() && !loginPassword.isEmpty() ){
	
	Statement st=conn.createStatement();
	String loginname=null;
	String loginpassword=null;
	int flag=0;

	ResultSet rs=st.executeQuery("select * from MEDSHOPUSER");
	while(rs.next()){
		loginname=rs.getString(1);
		loginpassword=rs.getString(3);

	if(loginName.equalsIgnoreCase(loginname) && loginPassword.equals(loginpassword))
	{
	 	flag=1;
	}
	}
	if(flag==0)
		response.sendRedirect("Login.html");
	else{
		session.setAttribute("session-user", loginName);
		response.sendRedirect("authenticatedhome.jsp");
	}
	}

%>