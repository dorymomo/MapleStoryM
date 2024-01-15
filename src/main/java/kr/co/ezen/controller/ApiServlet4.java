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

@WebServlet("/ApiServlet4")
public class ApiServlet4 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        try {
            String API_KEY = "test_cf9f7acdd1de25ff4db1ef5f880334d0775642c375a4e7b1a8ec9d1e6e56e7839c5ec553dc6ea0e3d5562580bb58ea83";

            // JSP 폼에서 전달된 파라미터 받기
            String ocid = request.getParameter("ocid");

            // 파라미터를 URL에 인코딩하여 API 호출
            String encodeocid = URLEncoder.encode(ocid, "UTF-8");

            String urlString = "https://open.api.nexon.com/maplestorym/v1/character/stat?ocid=" + ocid;

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

         // JSON 문자열을 JSON 객체로 변환
            JSONObject jsonResponse = new JSONObject(apiResponse.toString());

            // API 응답을 JSP 페이지로 전달
            request.setAttribute("apiResponse", jsonResponse);

            // JSP로 포워딩
            request.getRequestDispatcher("result4").forward(request, response);
            System.out.println(apiResponse.toString());
        } catch (Exception exception) {
            exception.printStackTrace();
        }
    }
}
