<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link href="https://fonts.googleapis.com/css2?family=Nerko+One&display=swap" rel="stylesheet">
<style>
    /* Make the image fully responsive */
    .carousel-inner img {
        width: 100%;
        height: 100%;
    }
    h2{
        color: black;
        font-family: 'Nerko One', cursive;
        font-weight: bold;
        font-style: italic;
    }
</style>


<%@ include file="layout/header.jsp"%>
<div class="container">

    <div class="card">
        <div class="card-header">
            <h4 style="float: left">News</h4>
            <select name="categories" id="categories" onchange="categories()" style="float: right; margin-top: 7px;"/>
            <option value="">----</option>
            <option value="business">business</option>
            <option value="entertainment">entertainment</option>
            <option value="general">general</option>
            <option value="health">health</option>
            <option value="science">science</option>
            <option value="sports">sports</option>
            <option value="technology">technology</option>
            </select><br>
        </div>


        <div class="card-body" style="width: 100%;">

                <div id="demo" class="carousel slide" data-ride="carousel" style="width: 98%; height: 40%;">

                    <div class="carousel-inner" id="carousel-inner"></div>
                    <a class="carousel-control-prev" href="#demo" data-slide="prev">
                        <span class="carousel-control-prev-icon"></span>
                    </a>
                    <a class="carousel-control-next" href="#demo" data-slide="next">
                        <span class="carousel-control-next-icon"></span>
                    </a>
                </div>

        </div>

    </div>
    <br><br><br><br>

</div>
<%@ include file="layout/footer.jsp"%>
<script>
    $.ajax({
        url: 'https://newsapi.org/v2/top-headlines?country=us&category=general&apiKey=8a74e2d7e6cb4c39a48f322f555895c9',
        dataType: "json",
        type: "GET",
        contentType: "application/json; charset=utf-8",
        success: function(data) {
            var newsCard = '<div class="carousel-item active">';
            newsCard += '<div class="card" style="width: 100%;">';
            newsCard += '<div class="card-header">' + data.articles[0].title + '</div>';
            newsCard += '<div class="card-body"><img src="' + data.articles[0].urlToImage + '" style="width: 1000px; height: 400px;"></div>';
            newsCard += '</div>';
            newsCard += '</div>';

            for(var i = 1; i < data.articles.length - 1; i++){
                newsCard += '<div class="carousel-item">';
                newsCard += '<div class="card" style="width: 100%;">';
                newsCard += '<div class="card-header">' + data.articles[i].title + '</div>';
                newsCard += '<div class="card-body"><img src="' + data.articles[i].urlToImage + '" style="width: 1000px; height: 400px;"></div>';
                newsCard += '</div>';
                newsCard += '</div>';
            }
            document.getElementById("carousel-inner").innerHTML = newsCard;
        }
    });

    function categories(){
        document.getElementById("carousel-inner").innerHTML = "";
        var categories = document.getElementById("categories").value;
        console.log(categories);

        $.ajax({
            url: 'https://newsapi.org/v2/top-headlines?country=us&category='+ categories + '&apiKey=8a74e2d7e6cb4c39a48f322f555895c9',
            dataType: "json",
            type: "GET",
            contentType: "application/json; charset=utf-8",
            success: function(data) {


                var newsCard = '<div class="carousel-item active">';
                newsCard += '<a href"' + data.articles[0].url + '">';
                newsCard += '<div class="card" style="width: 100%;">';
                newsCard += '<div class="card-header">' + data.articles[0].title + '</div>';
                newsCard += '<div class="card-body"><img src="' + data.articles[0].urlToImage + '" style="width: 1000px; height: 400px;"></div>';
                newsCard += '</div>';
                newsCard += '</a>';
                newsCard += '</div>';

                for(var i = 1; i < data.articles.length - 1; i++){
                    newsCard += '<div class="carousel-item">';

                    newsCard += '<div class="card" style="width: 100%;">';
                    newsCard += '<a href"' + data.articles[i].url + '">';
                    newsCard += '<div class="card-header">' + data.articles[i].title + '</div>';
                    newsCard += '<div class="card-body"><img src="' + data.articles[i].urlToImage + '" style="width: 1000px; height: 400px;"></div>';
                    newsCard += '</div>';
                    newsCard += '</a>';
                    newsCard += '</div>';
                }
                document.getElementById("carousel-inner").innerHTML = newsCard;
            }
        });
    }
</script>

</body>
</html>


