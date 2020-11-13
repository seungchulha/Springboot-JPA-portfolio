<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../layout/header.jsp"%>

<div class="container">

    <div id="news-carousel" class="carousel slide" data-ride="carousel">
        <ul class="carousel-indicators">
            <li data-target="#demo" data-slide-to="0" class="active"></li>
            <li data-target="#demo" data-slide-to="1"></li>
            <li data-target="#demo" data-slide-to="2"></li>
        </ul>

        <div class="carousel-inner">
            <div class="carousel-item active">
<%--                <ul class="list-group">--%>
<%--                    <li class="list-group-item">--%>
                        <div class="card">
                            <div class="card-header">
                                <a href=""><h1>Lorem ipsum dolor sit amet.</h1></a>
                            </div>
                            <div class="card-body">
                                <img height="500px" src="/image/sample1.png" alt="">
                            </div>
                            <div class="card-footer">
                                <span>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Incidunt, officiis, soluta. Consequuntur earum iure libero molestiae nemo, provident quaerat sequi!</span>
                            </div>
                        </div>
<%--                    </li>--%>
<%--                </ul>--%>
            </div>

            <div class="carousel-item">
                <div class="card">
                    <div class="card-header">
                        <a href=""><h1>Lorem ipsum dolor sit amet.</h1></a>
                    </div>
                    <div class="card-body">
                        <img height="500px" src="/image/sample2.png" alt="">
                    </div>
                    <div class="card-footer">
                        <span>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Incidunt, officiis, soluta. Consequuntur earum iure libero molestiae nemo, provident quaerat sequi!</span>
                    </div>
                </div>
            </div>

            <div class="carousel-item">
                <div class="card">
                    <div class="card-header">
                        <a href=""><h1>Lorem ipsum dolor sit amet.</h1></a>
                    </div>
                    <div class="card-body">
                        <img height="500px" src="/image/sample3.png" alt="">
                    </div>
                    <div class="card-footer">
                        <span>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Incidunt, officiis, soluta. Consequuntur earum iure libero molestiae nemo, provident quaerat sequi!</span>
                    </div>
                </div>
            </div>

        </div>

        <!-- Left and right controls -->
        <a class="carousel-control-prev" href="#news-carousel" data-slide="prev">
            <span class="carousel-control-prev-icon"></span>
        </a>
        <a class="carousel-control-next" href="#news-carousel" data-slide="next">
            <span class="carousel-control-next-icon"></span>
        </a>
    </div>



</div>

<%@ include file="../layout/footer.jsp"%>

</body>
</html>


