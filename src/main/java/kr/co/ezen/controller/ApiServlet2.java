package kr.co.ezen.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

@WebServlet("/ApiServlet2")
public class ApiServlet2 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        try {
            String API_KEY = "test_cf9f7acdd1de25ff4db1ef5f880334d0653b5a3ef187397679253769b1fd109b63a7931cac5e82157ee2c40d1843ff4e";

            // JSP 폼에서 전달된 파라미터 받기
            String ocid = request.getParameter("ocid");

            // 첫 번째 API 호출
            String firstApiUrl = "https://open.api.nexon.com/maplestorym/v1/character/basic?ocid=" + ocid;
            String firstApiResponse = callApi(firstApiUrl, API_KEY);

            // 두 번째 API 호출
            String secondApiUrl = "https://open.api.nexon.com/maplestorym/v1/character/stat?ocid=" + ocid;
            String secondApiResponse = callApi(secondApiUrl, API_KEY);

            // 세 번째 API 호출
            String thridApiUrl = "https://open.api.nexon.com/maplestorym/v1/character/guild?ocid=" + ocid;
            String thirdApiResponse = callApi(thridApiUrl, API_KEY);
            
            // 각 API 응답을 JSP 페이지로 전달
            request.setAttribute("firstApiResponse", firstApiResponse);
            request.setAttribute("secondApiResponse", secondApiResponse);
            request.setAttribute("thirdApiResponse", thirdApiResponse);
            
            JSONObject thirdJsonResponse = new JSONObject(thirdApiResponse.toString());
            String guildName = thirdJsonResponse.getString("guild_name");
            request.setAttribute("guildName", guildName);

            JSONObject jsonResponse = new JSONObject(firstApiResponse.toString());
            String characterName = jsonResponse.getString("character_name");
            request.setAttribute("characterName", characterName);
            // JSP 페이지로 포워딩
            request.getRequestDispatcher("result2").forward(request, response);
        } catch (Exception exception) {
            exception.printStackTrace();
                    }
    }

    // API 호출을 수행하는 메서드
    private String callApi(String apiUrl, String apiKey) throws Exception {
        URL url = new URL(apiUrl);

        // HTTP connection 설정
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("GET");
        connection.setRequestProperty("x-nxopen-api-key", apiKey);

        int responseCode = connection.getResponseCode();

        BufferedReader in;
        if (responseCode == 200) {
            // responseCode 200 정상응답
            in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
        } else {
            // responseCode 200 이외의 코드가 반환되었을 경우
            in = new BufferedReader(new InputStreamReader(connection.getErrorStream()));
        }

        StringBuilder apiResponse = new StringBuilder();
        String inputLine;
        while ((inputLine = in.readLine()) != null) {
            apiResponse.append(inputLine);
        }
        in.close();
       

        return apiResponse.toString();
    }
}
