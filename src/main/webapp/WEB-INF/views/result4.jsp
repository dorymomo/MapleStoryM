<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Spring</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

   
</head>
<body>
    <div class="container">
        <h2>Maplestory</h2>

        <h2>스텟</h2>
        <pre id="formattedApiResponse"></pre>

        <script>
		    // JSON 문자열을 파싱하고 세로로 형식화합니다.
		    var apiResponse = ${apiResponse}; // 여기에서 따옴표를 제거했습니다.
		    var formattedApiResponse = "";
		
		    apiResponse.stat.forEach(function(stat) {
		        formattedApiResponse += stat.stat_name + " : " + stat.stat_value + "\n";
		        formattedApiResponse += "---------------------\n";
		    });
		
		    // 형식화된 응답을 pre 태그에 표시합니다.
		    var preElement = document.getElementById("formattedApiResponse");
		    preElement.innerText = formattedApiResponse;
		</script>

    </div>
</body>
</html>
