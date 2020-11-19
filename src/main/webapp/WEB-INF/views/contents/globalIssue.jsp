<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../layout/header.jsp"%>


<div class="container">
    <h1>Global Issues</h1><br><br>
    <div id="newsList"></div>
</div>

<%@ include file="../layout/footer.jsp"%>

<script>
    $.ajax({
        url: "https://newsapi.org/v2/top-headlines?country=us&apiKey=8a74e2d7e6cb4c39a48f322f555895c9",
        dataType: "json",
        type: "GET",
        contentType: "application/json; charset=utf-8",
        success: function(data) {
            console.log(data);
            var newsCard = "";
            for(var i = 0; i < data.articles.length; i++){
                newsCard += "<div class='card'>";
                newsCard += "<div class='card-header'>";
                newsCard += "<a href='"+ data.articles[i].url + "'><h1>" + data.articles[i].title + "</h1></a>";
                newsCard += "<br>Source : " + data.articles[i].source.name + "&nbsp; Author : " + data.articles[i].author;
                newsCard += "&nbsp; Published At : " + data.articles[i].publishedAt;
                newsCard += "</div>";
                newsCard += "<div class='card-body text-center'>";
                newsCard += "<img src='" + data.articles[i].urlToImage+ "' alt='' style='width: 100%;'></div>";
                newsCard += "<div class='card-footer'>";
                newsCard += "<h4>" + data.articles[i].description + "</h4>";
                newsCard += "</div></div><br>";
            }
            document.getElementById("newsList").innerHTML = newsCard;
        }
    });
</script>
</body>
</html>


