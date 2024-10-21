<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="db.jsp" %>
<%@ page import="java.sql.PreparedStatement" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제 중...</title>
</head>
<body>
<%
    String id = request.getParameter("id");

    if (id != null) {
        PreparedStatement pstmt = null;
        try {
            String sql = "DELETE FROM movie_reviews WHERE id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(id));
            pstmt.executeUpdate();

            response.sendRedirect("./movieReviews.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        }
    }
%>
</body>
</html>
