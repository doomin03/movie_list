<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="db.jsp" %>
<%@ page import="java.sql.*" %>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 소감 목록</title>
<style>
    body {
        margin: 0;
        padding: 0;
        background-color: #2f2f2f;
        color: white;
        font-family: Arial, sans-serif;
    }
    .content {
        margin-top: 100px;
        padding: 20px;
    }
    table {
        width: 100%;
        margin-bottom: 30px;
        border-collapse: collapse;
        background-color: #333333; /* 테이블 배경을 더 어둡게 변경 */
        color: #ffffff;
    }
    th, td {
        border: 1px solid #555555; /* 테두리 색을 부드럽게 조정 */
        padding: 10px;
        text-align: left;
    }
    th {
        background-color: #6A0DAD; /* 보라색 헤더 */
        color: #ffffff;
    }
    td {
        background-color: #444444; /* 조금 더 밝은 배경 */
    }
    .delete-btn {
        background-color: #555555; /* 버튼을 테이블 색상과 조화롭게 */
        color: #ffffff;
        border: none;
        padding: 5px 10px;
        cursor: pointer;
        border-radius: 4px;
        transition: background-color 0.3s ease;
    }
    .delete-btn:hover {
        background-color: #6A0DAD; /* 호버 시 보라색으로 강조 */
    }
    a {
        text-decoration: none;
    }
</style>
</head>
<body>
<div class="content">
    <h2>영화 소감 목록</h2>
    <table>
        <tr>
            <th>영화 제목</th>
            <th>소감</th>
            <th>삭제</th>
        </tr>
        <%
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                String sql = "SELECT id, movieNm, comment FROM movie_reviews";
                pstmt = conn.prepareStatement(sql);
                rs = pstmt.executeQuery();

                while (rs.next()) {
                    int id = rs.getInt("id");
                    String movieNm = rs.getString("movieNm");
                    String comment = rs.getString("comment");

                    out.write("<tr>");
                    out.write("<td>" + movieNm + "</td>");
                    out.write("<td>" + comment + "</td>");
                    out.write("<td><a href='deleteReview.jsp?id=" + id + "'><button class='delete-btn'>삭제</button></a></td>");
                    out.write("</tr>");
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            }
        %>
    </table>
</div>
</body>
</html>
