<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../layout/header.jsp"%>

<div class="container">
    <h1 style="float: left"> Covid-19 </h1>
    <div id="countries" style="float : right;"></div><br><br><br><br>
    <div class="d-flex">
        <div id="coronavirus" style="text-align: center;"></div>
        <div id="selectedCountryCorona" style="text-align: center;"></div>&nbsp;
        <div id="map" style="width: 600px; height: 600px;"></div>
    </div>
    <div id="covidNews"></div>
</div>
<script>
    $.ajax({
        url: "https://api.covid19api.com/summary",
        dataType: "json",
        type: "GET",
        contentType: "application/json; charset=utf-8",
        success: function(data) {
            var coronaBox = "<div style='width: 200px;'>";
            coronaBox = "<h1>Global Covid-19 Data</h1><br><br>" +
                        "<h4>Global Total Confirmed : " + data.Global.TotalConfirmed + "</h4><hr style='width: 500px'><br>" +
                        "<h4>Global New Confirmed : " + data.Global.NewConfirmed + "</h4><hr style='width: 500px'><br>" +
                        "<h4>Global Total Recovered : " + data.Global.TotalRecovered + "</h4><hr style='width: 500px'><br>" +
                        "<h4>Global New Deaths : " + data.Global.NewRecovered + "</h4><hr style='width: 500px'><br>" +
                        "<h4>Global New Recovered : " + data.Global.NewDeaths + "</h4><hr style='width: 500px'><br>" +
                        "<h4>Global Total Deaths : " + data.Global.TotalDeaths + "</h4><hr style='width: 500px'><br></div>";
            document.getElementById("coronavirus").innerHTML = coronaBox;
            var countrySelector = '<h3 style="margin-top: 5px;"><select name="countrySelect" id="countrySelect" onchange="infoCorona()">';
            for(var i=0; i<data.Countries.length; i++){
                countrySelector += '<option value="'+ data.Countries[i].Slug +'">'+ data.Countries[i].Country +'</option></h3>';
            }
            document.getElementById("countries").innerHTML = countrySelector;
        }
    });
    $.ajax({
        url: "http://newsapi.org/v2/everything?q=covid&from=2020-11-16&to=2020-11-18&sortBy=popularity&apiKey=8a74e2d7e6cb4c39a48f322f555895c9",
        dataType: "json",
        type: "GET",
        contentType: "application/json; charset=utf-8",
        category: "technology",
        success: function(data) {
            var newsCard = "";
            for(var i = 0; i < data.articles.length; i++){
                newsCard += "<div class='card' >";
                newsCard += "<div class='card-header'>";
                newsCard += "<a href='"+ data.articles[i].url + "'><h3>" + data.articles[i].title + "</h3></a>";
                newsCard += "<br><span>Source : " + data.articles[i].source.name + "&nbsp; Author : " + data.articles[i].author;
                newsCard += "&nbsp; Published At : " + data.articles[i].publishedAt +"</span>";
                newsCard += "</div>";
                newsCard += "<div class='card-body text-center'>";
                newsCard += "<img src='" + data.articles[i].urlToImage+ "' alt='' style='width: 100%;'></div>";
                newsCard += "<div class='card-footer'>";
                newsCard += "<span>" + data.articles[i].description + "</span>";
                newsCard += "<span>" + data.articles[i].content + "</span>";
                newsCard += "</div></div><br>";
            }
            document.getElementById("covidNews").innerHTML = newsCard;
        }
    });
    function infoCorona(){
        var selected = document.getElementById("countrySelect").value;
        $.ajax({
            url: "https://api.covid19api.com/summary",
            dataType: "json",
            type: "GET",
            contentType: "application/json; charset=utf-8",
            success: function(data) {
                var index = data.Countries.findIndex(i => i.Slug == selected);
                var country_code = data.Countries[index].CountryCode;
                var flags = 'https://www.countryflags.io/'+ country_code + '/flat/64.png';

                var selectedInfo =  "<div style='width: 200px; margin-right: 30px;'>";
                    selectedInfo =  "<h4>" + data.Countries[index].Country + "</h4>"+
                                    "<img height='100' src='" + flags + "'><br>" +
                                    "<span>NewConfirmed : " + data.Countries[index].NewConfirmed + "</span><hr style='width: 250px'>" +
                                    "<span>NewRecovered : " + data.Countries[index].NewRecovered + "</span><hr style='width: 250px'>" +
                                    "<span>NewDeaths : " + data.Countries[index].NewDeaths + "</span><hr style='width: 250px'>" +
                                    "<span>TotalConfirmed : " + data.Countries[index].TotalConfirmed + "</span><hr style='width: 250px'>" +
                                    "<span>TotalRecovered : " + data.Countries[index].TotalRecovered + "</span><hr style='width: 250px'>" +
                                    "<span>TotalDeaths : " + data.Countries[index].TotalDeaths + "</span><hr style='width: 250px'></div>";
                $.ajax({
                    url: "https://api.covid19api.com/dayone/country/" + selected + "/status/confirmed",
                    dataType: "json",
                    type: "GET",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        var latitude = parseInt(data[0].Lat);
                        var longitude = parseInt(data[0].Lon);

                        const selected = { lat: latitude, lng: longitude };
                        // The map, centered at Uluru
                        const map = new google.maps.Map(document.getElementById("map"), {
                            zoom: 4,
                            center: selected,
                        });
                        // The marker, positioned at Uluru
                        const marker = new google.maps.Marker({
                            position: selected,
                            map: map,
                        });
                        const content ="<span>" + selectedInfo + "</span>";
                        const infowindow = new google.maps.InfoWindow({
                            content : content,
                            maxWidth:500
                        });
                        var markers =[];
                        markerEvents(marker,infowindow,map);
                        markers.push(marker);

                        var markerClusterer = new MarkerClusterer(map, markers, {
                            imagePath:"https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m",
                            maxZoom: 15,
                            gridSize: 45
                        });

                        function markerEvents (marker,infowindow,map){
                            google.maps.event.addListener(marker,"click",function() {
                                infowindow.open(map,marker);
                                map.setZoom(4);
                                map.setCenter(marker.getPosition());
                            });
                            google.maps.event.addListener(marker,"dblclick",function() {
                                infowindow.close(map,marker);
                            });
                        };

                    }
                });

            }
        });

    }
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBLQasq3QtsJw1arPjV-Hwf3AYBqi0giEI&callback=infoCorona&libraries=&v=weekly" defer></script>
<%@ include file="../layout/footer.jsp"%>
</body>
</html>


