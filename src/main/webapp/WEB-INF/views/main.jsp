<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Maplestory Character Info</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f8f8;
            font-family: 'Arial', sans-serif;
        }

        .container {
            margin-top: 50px;
            text-align: center;
        }

        h2 {
            color: #333;
        }

        form {
            max-width: 400px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #333;
        }

        input,
        select,
        button {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 16px;
        }

        button {
            background-color: #4CAF50;
            color: #fff;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }

        /* 추가된 스타일 */
        .nexon-info {
            margin-top: 20px;
            font-size: 14px;
            color: #888;
        }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container">
        <a href="${contextPath }/">
            <img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/logo.png" style="margin: 20px;" alt="Maplestory Logo">
        </a>
   
        <form action="ApiServlet" method="get">
            <label for="characterName">캐릭터 이름:</label>
            <input type="text" id="characterName" name="character_name" required>
            <br>
            <label for="worldName">월드 이름:</label>
            <select id="worldName" name="world_name" required>
                <option value="엘리시움">엘리시움</option>
                <option value="크로아">크로아</option>
                <option value="스카니아">스카니아</option>
                <option value="아케인">아케인</option>
                <option value="루나">루나</option>
                <option value="유니온">유니온</option>
                <option value="제니스">제니스</option>
                <!-- 추가 월드 옵션들을 필요에 따라 추가 -->
            </select>
            <br>
            <button type="submit">캐릭터 정보 가져오기</button>
        </form>

        <!-- Data based on NEXON Open API를 아래로 이동 -->
        <div class="nexon-info">Data based on NEXON Open API</div>
    </div>
</body>
</html>
