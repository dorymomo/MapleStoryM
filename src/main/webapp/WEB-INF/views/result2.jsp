<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Maplestory</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<style>
    /* Custom CSS Styling */
    body {
        background-color: #f8f9fa; /* Light Gray Background Color */
    }

    .container {
        margin-top: 20px;
    }

    .logo-container {
        text-align: center;
        margin-bottom: 20px;
    }

    .logo-container img {
        max-width: 100%;
        height: auto;
    }

    .back-button {
        margin-bottom: 20px;
    }

    .table-container {
        overflow-x: auto;
    }
</style>
<body>
    <div class="container">
        <button class="btn btn-primary back-button" onclick="goBack()">뒤로 가기</button>
        <div class="row justify-content-center logo-container">
            <a href="${contextPath }/">
                <img src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/logo.png" style="margin: 20px;" alt="Maplestory Logo">
            </a>
        </div>
        <div>
            <h2>${characterName} 님의 정보</h2>
            <pre id="formattedApiResponse1"></pre>

            <script>
                var apiResponse1 = ${firstApiResponse};
                var formattedApiResponse1 = "";
                
                var apiResponse3 = ${thirdApiResponse};
                var formattedApiResponse3 = "";
				if(apiResponse1.character_name==='니플러'){
					 formattedApiResponse1 += "닉네임 : " + "왕바보멍청이는? " + apiResponse1.character_name + "\n";
				}else{
					 formattedApiResponse1 += "닉네임 : " + apiResponse1.character_name + "\n";
				}
               
                formattedApiResponse1 += "---------------------\n";
                formattedApiResponse1 += "서버 : " + apiResponse1.world_name + "\n";
                formattedApiResponse1 += "---------------------\n";
                if (apiResponse3 && apiResponse3.guild_name) {
                    formattedApiResponse1 += "길드 : " + apiResponse3.guild_name + "\n";
                  
                } else {
                    formattedApiResponse3 += "길드 정보 없음\n";
                }
                formattedApiResponse1 += "---------------------\n";
                formattedApiResponse1 += "생성날 : " + (apiResponse1.character_date_create !== null ? apiResponse1.character_date_create : "null") + "\n";
                formattedApiResponse1 += "---------------------\n";
                formattedApiResponse1 += "레벨 : " + apiResponse1.character_level + "\n";
                formattedApiResponse1 += "---------------------\n";
                formattedApiResponse1 += "직업 : " + apiResponse1.character_job_name + "\n";
                formattedApiResponse1 += "---------------------\n";
                formattedApiResponse1 += "캐릭터 성별 : " + apiResponse1.character_gender + "\n";
                formattedApiResponse1 += "---------------------\n";
                formattedApiResponse1 += "경험치 : " + apiResponse1.character_exp + "\n";
                formattedApiResponse1 += "---------------------\n";
                formattedApiResponse1 += "최근 로그인 : " + apiResponse1.character_date_last_login + "\n";
                formattedApiResponse1 += "---------------------\n";
                formattedApiResponse1 += "마지막 로그 아웃 : " + apiResponse1.character_date_last_logout + "\n";
                
                // character_date_create 값이 null이 아닌 경우에만 날짜 계산
                if (apiResponse1.character_date_create !== null) {
                    var characterCreateDate = new Date(apiResponse1.character_date_create);
                    var currentDate = new Date();
                    var daysSinceCreation = Math.floor((currentDate - characterCreateDate) / (1000 * 60 * 60 * 24));

                    formattedApiResponse1 += "---------------------\n";
                    formattedApiResponse1 += "생성일로부터 " + daysSinceCreation + "일 경과\n";
                } else {
                    formattedApiResponse1 += "---------------------\n";
                    formattedApiResponse1 += "생성일 정보 없음\n";
                }

                document.getElementById("formattedApiResponse1").innerText = formattedApiResponse1;

                function goBack() {
                    window.history.back();
                }
            </script>
        </div>
        <div>
            <h2>${characterName} 님의 스텟</h2>
            <pre id="formattedApiResponse2"></pre>

            <script>
                var apiResponse2 = ${secondApiResponse};
                var formattedApiResponse2 = "";

                apiResponse2.stat.forEach(function(stat) {
                    formattedApiResponse2 += stat.stat_name + " : " + stat.stat_value + "\n";
                    formattedApiResponse2 += "---------------------\n";
                });

                var preElement2 = document.getElementById("formattedApiResponse2");
                preElement2.innerText = formattedApiResponse2;
            </script>
        </div>
        
    </div>
</body>
</html>
