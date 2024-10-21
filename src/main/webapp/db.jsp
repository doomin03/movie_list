<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.io.PrintWriter"%>

<%
    // MySQL JDBC 연결 정보
    String url = "jdbc:mysql://localhost:3306/mysqldb";  // MySQL DB의 기본 포트는 3306입니다
    String user = "root";
    String password = "1234";

    Connection conn = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);
       
    } catch (ClassNotFoundException e) {
       e.printStackTrace();
    } catch (SQLException e) {
    	e.printStackTrace();
    } 
%>
