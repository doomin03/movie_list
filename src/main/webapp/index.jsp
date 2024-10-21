<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ page import="java.util.*, movie_list.Movie_Parser" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나만의 영화 리스트</title>
<style>
    body {
        margin: 0;
        padding: 0;
        background-color: #2f2f2f;
        color: white;
    }
    .content {
        margin-top: 100px;
        padding: 20px;
    }
    table {
        width: 100%;
        margin-bottom: 30px;
        border-collapse: collapse;
        background-color: #444444;
    }
    th, td {
        border: 1px solid white;
        padding: 10px;
        text-align: left;
    }
    th {
        background-color: #6A0DAD; /* 보라색 */
    }
</style>
</head>
<body>
<div class="content">
    <h2>주간 베스트 영화</h2>
    <table>
        <tr>
            <th>순위</th>
            <th>영화 제목</th>
            <th>개봉일</th>
            <th>관객수</th>
            <th>매출액</th>
        </tr>
        <%
            try {
                String url = "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.xml?key=5908a328c6d57d18ca20a32bb9f14108&targetDt=";
                String item = "dailyBoxOffice";
                Movie_Parser weeklyParser = new Movie_Parser(url, item);

                List<Map<String, String>> weeklyBest = weeklyParser.XML_p(false);
                for (Map<String, String> movie : weeklyBest) {
                    out.println("<tr>");
                    out.println("<td>" + movie.get("rank") + "</td>");
                    out.println("<td>" + movie.get("movieNm") + "</td>");
                    out.println("<td>" + movie.get("openDt") + "</td>");
                    out.println("<td>" + movie.get("audiAcc") + "</td>");
                    out.println("<td>" + movie.get("salesAcc") + "</td>");
                    out.println("</tr>");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>

    <h2>일간 베스트 영화</h2>
    <table>
        <tr>
            <th>순위</th>
            <th>영화 제목</th>
            <th>개봉일</th>
            <th>관객수</th>
            <th>매출액</th>
        </tr>
        <%
            try {
                String url = "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.xml?key=5908a328c6d57d18ca20a32bb9f14108&targetDt=";
                String item = "dailyBoxOffice";
                Movie_Parser dailyParser = new Movie_Parser(url, item);


                List<Map<String, String>> dailyBest = dailyParser.XML_p(true);
                for (Map<String, String> movie : dailyBest) {
                    out.println("<tr>");
                    out.println("<td>" + movie.get("rank") + "</td>");
                    out.println("<td>" + movie.get("movieNm") + "</td>");
                    out.println("<td>" + movie.get("openDt") + "</td>");
                    out.println("<td>" + movie.get("audiAcc") + "</td>");
                    out.println("<td>" + movie.get("salesAcc") + "</td>");
                    out.println("</tr>");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>
</div>
</body>
</html>
