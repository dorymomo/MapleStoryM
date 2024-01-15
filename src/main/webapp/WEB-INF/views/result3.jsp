<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
<title>Spring</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

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
		<button class="btn btn-primary back-button" onclick="goBack()">뒤로가기</button>
		<div class="row justify-content-center logo-container">

			<a href="${contextPath }/"> <img
				src="https://ssl.nexon.com/s2/game/maplestory/renewal/common/logo.png"
				style="margin: 20px;" alt="Maplestory Logo">
			</a>
		</div>

		<div class="row">
			<div class="col-md-12">
				<h2>아이템 정보</h2>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>아이템</th>
							<th>이름</th>
							<th>페이지 이름</th>
							<th>슬롯 이름</th>
						</tr>
					</thead>
					<tbody id="tableBody">
					</tbody>
				</table>

				<script>
                    // JSON 문자열을 파싱하고 테이블에 추가합니다.
                    var apiResponse = ${apiResponse}; // JSON.parse 없이 그대로 사용
                    var tableBody = document.getElementById("tableBody");

                    // 각 아이템 정보를 테이블에 추가하기
                    var sortedItems = apiResponse.item_equipment.sort(function(a, b) {
                        // 페이지 이름을 기준으로 정렬, _Cash를 가장 아래로 정렬
                        if (a.item_equipment_page_name.includes("_Cash") && !b.item_equipment_page_name.includes("_Cash")) {
                            return 1; // a가 _Cash를 가지면 b보다 뒤로 보냄
                        } else if (!a.item_equipment_page_name.includes("_Cash") && b.item_equipment_page_name.includes("_Cash")) {
                            return -1; // b가 _Cash를 가지면 a보다 뒤로 보냄
                        } else {
                            return b.item_equipment_page_name.localeCompare(a.item_equipment_page_name);
                        }
                    });

                    for (var i = 0; i < sortedItems.length; i++) {
                        var item = sortedItems[i];

                        var row = document.createElement("tr");
                        row.innerHTML = "<td>" + (i + 1) + "</td>" +
                                        "<td>" + item.item_name + "</td>" +
                                        "<td>" + item.item_equipment_page_name + "</td>" +
                                        "<td>" + item.item_equipment_slot_name + "</td>";

                        tableBody.appendChild(row);
                    }
                    
                    function goBack() {
                        window.history.back();
                    }
              
                </script>
			</div>
		</div>
	</div>
</body>
</html>