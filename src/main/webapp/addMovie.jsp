<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="db.jsp" %>
<%@ page import="java.sql.PreparedStatement" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 추가</title>
<style>
    body {
        background-color: #2f2f2f;
        color: white;
        font-family: Arial, sans-serif;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }
    .container {
        background-color: #444;
        padding: 30px;
        border-radius: 8px;
        text-align: center;
        width: 50%;
    }
    input, textarea {
        width: 80%;
        padding: 10px;
        margin: 10px 0;
        border: none;
        border-radius: 4px;
    }
    input[type="submit"] {
        background-color: #6A0DAD;
        color: white;
        cursor: pointer;
    }
</style>
</head>
<body>
<div class="container">
    <h2>영화 추가</h2>
    <%
    	request.setCharacterEncoding("utf-8");
        String movieNm = request.getParameter("movieNm");
        if (movieNm != null) {
            out.println("<h3>" + movieNm + "</h3>");
        }

        String comment = request.getParameter("comment");
        if (movieNm != null && comment != null && !comment.isEmpty()) {
            PreparedStatement pstmt = null;
            try {
                String sql = "INSERT INTO movie_reviews (movieNm, comment) VALUES (?, ?)";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, movieNm);
                pstmt.setString(2, comment);
                pstmt.executeUpdate();
                response.sendRedirect("list.jsp");
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            }
        }
    %>

    <form method="post">
        <input type="hidden" name="movieNm" value="<%= movieNm %>">
        <textarea name="comment" placeholder="영화 소감을 입력하세요" rows="5" required></textarea>
        <br>
        <input type="submit" value="추가">
    </form>
</div>
</body>
</html>
