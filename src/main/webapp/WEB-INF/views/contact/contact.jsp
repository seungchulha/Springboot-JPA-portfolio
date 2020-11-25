<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../layout/header.jsp"%>

<div class="container">
    <div class="row justify-content-center text-center mb-5">
        <div class="col-md-10">
            <div class="heading-39101 mb-5">
                <span class="backdrop text-center">Contact</span>
                <span class="subtitle-39191">Contact Us</span>
                <h3>Contact Us</h3>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-8 mb-5" >
            <form action="/contact/doSend" method="post">

                <div class="form-group row">
                    <div class="col-md-12">
                        <input type="text" class="form-control" name="title" id="title" placeholder="Subject">
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-md-12">
                        <input type="hidden" class="form-control" name="email" id="email"  value="alaxhenry@gmail.com">
                        <input type="email" class="form-control" name="customerEmail" id="customerEmail" placeholder="Email address">
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-md-12">
                        <textarea name="body" id="editor-body" class="form-control summernote" placeholder="Write your message." cols="30" rows="10"></textarea>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-md-6 mr-auto">
                        <input type="submit" class="btn btn-block btn-primary text-white py-3 px-5" value="Send Message">
                    </div>
                </div>
            </form>
        </div>
        <div class="col-lg-4 ml-auto">
            <div class="bg-white p-3 p-md-5">
                <h3 class="text-black mb-4">Contact Info</h3>
                <ul class="list-unstyled footer-link">
                    <li class="d-block mb-3">
                        <span class="d-block text-black">Address:</span>
                        <span>서울시 서초구 효령로 20 가 길 30 </span></li>
                    <li class="d-block mb-3"><span class="d-block text-black">Phone:</span><span>+82 10 7311 2202</span></li>
                    <li class="d-block mb-3"><span class="d-block text-black">Email:</span><span>alaxhenry@gmail.com</span></li>
                </ul>
            </div>
        </div>
    </div>

</div>


<%@ include file="../layout/footer.jsp"%>
<script>
    $('.summernote').summernote({
        tabsize: 2,
        height: 300
    });
</script>
</body>
</html>


