<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script>
        function stockinfo(){
            var searchArr = document.getElementById("company").value.split(' : ');
            var search = searchArr[0];
            var search2 = searchArr[1];
            $.ajax({
                url: 'https://sandbox.iexapis.com/stable/stock/'+search+'/intraday-prices?token=Tsk_df3c91a755ad47158fdfe4fe990dbe07',
                dataType: 'json',
                type: "GET",
                contentType: "application/json; charset=utf-8",
                success: function (data) {

                    var timevalue = [];

                    for(var i = 0; i<data.length; i++){
                        timevalue.push([data[i].date+ " / " +data[i].minute, data[i].close]);
                    }

                    google.charts.load('current', {packages: ['corechart', 'line']});
                    google.charts.setOnLoadCallback(drawBasic);

                    function drawBasic() {

                        var data = new google.visualization.DataTable();
                        data.addColumn('string', 'i');
                        data.addColumn('number', 'price');

                        data.addRows(timevalue);

                        var options = {
                            hAxis: {
                                title: 'Time'
                            },
                            vAxis: {
                                title: 'Price'
                            }
                        };

                        var chart = new google.visualization.LineChart(document.getElementById('chart_div'));

                        chart.draw(data, options);
                    }

                    $.ajax({
                        url: 'https://newsapi.org/v2/everything?q=' + search2 + '&apiKey=8a74e2d7e6cb4c39a48f322f555895c9',
                        category: 'business, entertainment, general, health, science, sports, technology',
                        dataType: 'json',
                        type: "GET",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            //console.log(data);
                            //console.log(data.articles.length);
                            // console.log(data.articles[0]);
                            var newsbox = '<div style="width:80%;">';
                            for(var i = 0; i<data.articles.length; i++){
                                newsbox += '<div><a href="' + data.articles[i].url + '">';
                                newsbox += '<h1>' + data.articles[i].title + '</h1></a>';
                                newsbox += '<p>author : ' + data.articles[i].author + ' ' + data.articles[i].publishedAt + '</p>';
                                newsbox += '<div style="display: flex;"><img src="' + data.articles[i].urlToImage + '" alt="" style="width:25%; ">';
                                newsbox += '<h2>' + data.articles[i].description + '</h2></div></div><br>';
                            }
                                newsbox += '</div>';

                            document.getElementById("newsrelated").innerHTML = newsbox;
                        }
                    })

                    var date = data[0].date;
                    var min = data[0].minute;
                    var avrg = data[0].average;
                    var close = data[0].close;
                    var high = data[0].high
                    var label = data[0].label
                    var low = data[0].low
                    var notional = data[0].notional;
                    var numberOfTrade = data[0].numberOfTrades;
                    var open = data[0].open;
                    var volume = data[0].volume;

                    var mrktname = document.getElementById("marketType").value;
                    var marketname = mrktname.toUpperCase();
                    //console.log(mrktname);
                    //console.log(date + "<br>" + min + "<br>" + avrg + "<br>" + close + "<br>" + high + "<br>" + label + "<br>" + low + "<br>" + notional + "<br>" + numberOfTrade + "<br>" + open + "<br>" + volume);

                    // todo
                    // 데이터 연결로 주식  관리 시스템 => 구매 내역 구매당시 가격 저장 ==> 현재 가와 비교
                    // 회원 가입 // 로그인 // 기타 회원 관리 시스템

                    document.getElementById('info').innerHTML =
                        "<h1>" + search2 + "</h1>" +
                        "<h2>" + search + "</h2>"+
                        "<h3>" + date + " / " + min + "</h3><br>" +
                        "<h2> $ " + avrg + "</h2><br>" +
                        // "<p>"+  +"</p>" +
                        "<p> market : "+ marketname +"</p>";
                }
            });
        }

        function mkttype(){
            var mktname = document.getElementById("marketType").value;

            var symbols = [];
            var companies = [];
            $.ajax({
                url: 'https://old.nasdaq.com/screening/companies-by-name.aspx?letter=0&exchange=' + mktname + '&render=download',
                dataType: 'text',
            }).done(successFunction);

            function successFunction(data) {

                let stockList = data.split('\r\n').map(stock => {
                    return stock.replace(/",/g, "").replace(/\"/g, "|").split("|").splice(1);
                });

                //console.log(stockList);
                stockList.pop();
                stockList.shift();
                let stocks = stockList.map(stock => {
                    return {
                        symbol: stock[0],
                        name: stock[1],
                        lastSale: stock[2],
                        marketCap: stock[3],
                        ipoYear: stock[4],
                        sector: stock[5],
                        industry: stock[6],
                        summaryQuote: stock[7]
                    }
                });

                for (var i = 0; i < stocks.length; i++) {
                    //console.log(stocks[i].symbol);
                    symbols[i] = stocks[i].symbol + " : " + stocks[i].name;
                }

                $( "#company" ).autocomplete({
                    source: symbols,
                    minLength: 2
                });

            }
        }

    </script>
</head>
<body>
<select name="marketType" id="marketType" onchange="mkttype()"/>
    <option value="">----</option>
    <option value="nyse">NYSE</option>
    <option value="nasdaq">Nasdaq</option>
</select>

<label for="company"></label><input type="text" placeholder="Company name or symbol" name="company" id="company" style="width:300px;">
<button onclick="stockinfo()"><i class="fa fa-search"></i></button>

<div id="info"></div>
<div id="chart_div"></div>
<div id="newsrelated"></div>


</body>
</html>