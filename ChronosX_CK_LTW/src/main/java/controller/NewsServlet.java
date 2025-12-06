package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.net.*;
import java.util.*;
import org.json.*;

public class NewsServlet extends HttpServlet {
    private static final String API_KEY = "31c2d618f74c40e9be5fb1f6cafdad4c";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String apiUrl = "https://newsapi.org/v2/everything?q=watch&language=vi&apiKey=" + API_KEY;
        URL url = new URL(apiUrl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");

        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        String inputLine;
        StringBuilder content = new StringBuilder();
        while ((inputLine = in.readLine()) != null) {
            content.append(inputLine);
        }
        in.close();

        JSONObject json = new JSONObject(content.toString());
        JSONArray articles = json.getJSONArray("articles");

        List<Map<String, String>> newsList = new ArrayList<>();
        for (int i = 0; i < articles.length(); i++) {
            JSONObject a = articles.getJSONObject(i);
            Map<String, String> item = new HashMap<>();
            item.put("title", a.getString("title"));
            item.put("url", a.getString("url"));
            item.put("image", a.optString("urlToImage", ""));
            item.put("description", a.optString("description", ""));
            newsList.add(item);
        }

        request.setAttribute("newsList", newsList);
        RequestDispatcher rd = request.getRequestDispatcher("/news.jsp");
        rd.forward(request, response);
    }
}