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

@WebServlet("/ApiServlet")
public class ApiServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        try {
            String API_KEY = "test_cf9f7acdd1de25ff4db1ef5f880334d0653b5a3ef187397679253769b1fd109b63a7931cac5e82157ee2c40d1843ff4e";

            // JSP 폼에서 전달된 파라미터 받기
            String character_name = request.getParameter("character_name");
            String world_name = request.getParameter("world_name");

            String ocid = request.getParameter("ocid");
            
            // 파라미터를 URL에 인코딩하여 API 호출
            String encodedCharacterName = URLEncoder.encode(character_name, "UTF-8");
            String encodedWorldName = URLEncoder.encode(world_name, "UTF-8");
           
            String urlString = "https://open.api.nexon.com/maplestorym/v1/id?character_name=" + encodedCharacterName
                    + "&world_name=" + encodedWorldName;
            
            URL url = new URL(urlString);

            // HTTP connection 설정
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setRequestProperty("x-nxopen-api-key", API_KEY);

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

            // API 응답을 JSP 페이지로 전달
            request.setAttribute("apiResponse", apiResponse.toString());
         // JSON 파싱을 통해 ocid 추출 및 따로 저장
            JSONObject jsonResponse = new JSONObject(apiResponse.toString());
            String ocidString = jsonResponse.getString("ocid");
         
            // 따로 저장
            request.setAttribute("ocid", ocidString);
        
            
            request.getRequestDispatcher("result").forward(request, response);
        } catch (Exception exception) {
            exception.printStackTrace();
        }
    }
}