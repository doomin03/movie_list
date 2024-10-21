<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>나만의 영화 리스트</title>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Roboto', sans-serif;
    }
    body {
        background-color: #f4f4f9;
        color: #333;
        padding-top: 90px;
    }
    header {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 60px;
        background-color: #000;
        color: #fff;
        text-align: center;
        line-height: 60px;
        font-size: 24px;
        font-weight: 700;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        z-index: 1000;
    }
    nav {
        position: fixed;
        top: 60px;
        left: 0;
        width: 100%;
        height: 30px;
        background-color: #6A0DAD;
        padding-left: 10px;
        display: flex;
        align-items: center;
        z-index: 999;
    }
    nav a {
        color: #fff;
        text-decoration: none;
        margin-right: 20px;
        font-size: 16px;
        font-weight: 500;
        transition: color 0.3s ease;
    }
    nav a:hover {
        color: #ddd;
    }
</style>
</head>
<body>
<header>
    나만의 영화 리스트
</header>
<nav>
    <a href="./index.jsp">영화 목록</a>
    <a href="./list.jsp">영화 등록</a>
    <a href="./movieReviews.jsp">나만의 영화 목록</a>
</nav>
</body>
</html>
