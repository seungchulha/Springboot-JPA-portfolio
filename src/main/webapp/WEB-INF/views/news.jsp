<!doctype html>
<script>
    function getnews(){
        fetch('http://newsapi.org/v2/top-headlines?country=us&apikey=8a74e2d7e6cb4c39a48f322f555895c9')
            .then(a => a.json())
            .then(response => {
                for(var i = 0; i<response.articles.length; i++){
                    document.getElementById("output").innerHTML += "<div style='padding-top: 20px;'><img style='float:left; width:150px;' src='"
                        + response.articles[i].urlToImage + "'><h1>"
                        +"<a href='" + response.articles[i].url
                        +"' target='_blank'>"
                        + response.articles[i].title +"</a></h1>"+ response.articles[i].source.name
                        + "<br>" + response.articles[i].description
                        +"</div>";            }
            })
    }

</script>
<button onclick='getnews()'>Get news!!!!</button>
<div id="output"></div>