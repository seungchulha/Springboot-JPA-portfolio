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
    <style type="text/css">
        body {
            font-family: "Open Sans", sans-serif;
            height: 100vh;
            background: url("https://i.imgur.com/HgflTDf.jpg") 50% fixed;
            background-size: cover;
        }
        @keyframes spinner {
            0% {
                transform: rotateZ(0deg);
            }
            100% {
                transform: rotateZ(359deg);
            }
        }
        * {
            box-sizing: border-box;
        }
        .wrapper {
            display: flex;
            align-items: center;
            flex-direction: column;
            justify-content: center;
            width: 100%;
            min-height: 100%;
            padding: 20px;
            background: rgba(4, 40, 68, 0.85);
        }
        .login {
            border-radius: 2px 2px 5px 5px;
            padding: 10px 20px 20px 20px;
            width: 90%;
            max-width: 450px;
            background: #fff;
            position: relative;
            padding-bottom: 80px;
            box-shadow: 0px 1px 5px rgba(0, 0, 0, 0.3);
        }
        .login.loading button {
            max-height: 100%;
            padding-top: 50px;
        }
        .login.loading button .spinner {
            opacity: 1;
            top: 40%;
        }
        .login.ok button {
            background-color: #8bc34a;
        }
        .login.ok button .spinner {
            border-radius: 0;
            border-top-color: transparent;
            border-right-color: transparent;
            height: 20px;
            animation: none;
            transform: rotateZ(-45deg);
        }
        .login input {
            display: block;
            padding: 15px 10px;
            margin-bottom: 10px;
            width: 100%;
            border: 1px solid #ddd;
            transition: border-width 0.2s ease;
            border-radius: 2px;
            color: #ccc;
        }
        .login input + i.fa {
            color: #fff;
            font-size: 1em;
            position: absolute;
            margin-top: -47px;
            opacity: 0;
            left: 0;
            transition: all 0.1s ease-in;
        }
        .login input:focus {
            outline: none;
            color: #444;
            border-color: #2196f3;
            border-left-width: 35px;
        }
        .login input:focus + i.fa {
            opacity: 1;
            left: 30px;
            transition: all 0.25s ease-out;
        }
        .login a {
            font-size: 0.8em;
            color: #2196f3;
            text-decoration: none;
        }
        .login .title {
            color: #444;
            font-size: 1.2em;
            font-weight: bold;
            margin: 10px 0 30px 0;
            border-bottom: 1px solid #eee;
            padding-bottom: 20px;
        }
        .login button, .modal-footer button {
            width: 100%;
            height: 100%;
            padding: 10px 10px;
            background: #2196f3;
            color: #fff;
            display: block;
            border: none;
            margin-top: 20px;
            position: absolute;
            left: 0;
            bottom: 0;
            max-height: 60px;
            border: 0px solid rgba(0, 0, 0, 0.1);
            border-radius: 0 0 2px 2px;
            transform: rotateZ(0deg);
            transition: all 0.1s ease-out;
            border-bottom-width: 7px;
        }
        .login button .spinner {
            display: block;
            width: 40px;
            height: 40px;
            position: absolute;
            border: 4px solid #fff;
            border-top-color: rgba(255, 255, 255, 0.3);
            border-radius: 100%;
            left: 50%;
            top: 0;
            opacity: 0;
            margin-left: -20px;
            margin-top: -20px;
            animation: spinner 0.6s infinite linear;
            transition: top 0.3s 0.3s ease, opacity 0.3s 0.3s ease, border-radius 0.3s ease;
            box-shadow: 0px 1px 0px rgba(0, 0, 0, 0.2);
        }
        .login:not(.loading) button:hover {
            box-shadow: 0px 1px 3px #2196f3;
        }
        .login:not(.loading) button:focus {
            border-bottom-width: 4px;
        }
        <!-- -->

        .modal-body.loading button {
            max-height: 100%;
            padding-top: 50px;
        }
        .modal-body.loading button .spinner {
            opacity: 1;
            top: 40%;
        }
        .modal-body.ok button {
            background-color: #8bc34a;
        }
        .modal-body.ok button .spinner {
            border-radius: 0;
            border-top-color: transparent;
            border-right-color: transparent;
            height: 20px;
            animation: none;
            transform: rotateZ(-45deg);
        }
        .modal-body input, #signup-user-gender {
            display: block;
            padding: 15px 10px;
            margin-bottom: 10px;
            width: 100%;
            border: 1px solid #ddd;
            transition: border-width 0.2s ease;
            border-radius: 2px;
            color: black;
        }
        .modal-body input + i.fa {
            color: #fff;
            font-size: 1em;
            position: absolute;
            margin-top: -37px;
            opacity: 0;
            left: 0;
            transition: all 0.1s ease-in;
        }

        .modal-body input:focus {
            outline: none;
            color: #444;
            border-color: #2196f3;
            border-left-width: 35px;
        }
        .modal-body input:focus + i.fa {
            opacity: 1;
            left: 30px;
            transition: all 0.25s ease-out;
        }
        .modal-body a {
            font-size: 0.8em;
            color: #2196f3;
            text-decoration: none;
        }
        .modal-body .title {
            color: #444;
            font-size: 1.2em;
            font-weight: bold;
            margin: 10px 0 30px 0;
            border-bottom: 1px solid #eee;
            padding-bottom: 20px;
        }
        .modal-body button {
            width: 100%;
            height: 100%;
            padding: 10px 10px;
            background: #2196f3;
            color: #fff;
            display: block;
            border: none;
            margin-top: 20px;
            position: absolute;
            left: 0;
            bottom: 0;
            max-height: 60px;
            border: 0px solid rgba(0, 0, 0, 0.1);
            border-radius: 0 0 2px 2px;
            transform: rotateZ(0deg);
            transition: all 0.1s ease-out;
            border-bottom-width: 7px;
        }
        .modal-body button .spinner {
            display: block;
            width: 40px;
            height: 40px;
            position: absolute;
            border: 4px solid #fff;
            border-top-color: rgba(255, 255, 255, 0.3);
            border-radius: 100%;
            left: 50%;
            top: 0;
            opacity: 0;
            margin-left: -20px;
            margin-top: -20px;
            animation: spinner 0.6s infinite linear;
            transition: top 0.3s 0.3s ease, opacity 0.3s 0.3s ease, border-radius 0.3s ease;
            box-shadow: 0px 1px 0px rgba(0, 0, 0, 0.2);
        }
        .modal-body:not(.loading) button:hover {
            box-shadow: 0px 1px 3px #2196f3;
        }
        .modal-body:not(.loading) button:focus {
            border-bottom-width: 4px;
        }

        <!-- -->

        footer {
            display: block;
            padding-top: 50px;
            text-align: center;
            color: #ddd;
            font-weight: normal;
            text-shadow: 0px -1px 0px rgba(0, 0, 0, 0.2);
            font-size: 0.8em;
        }
        footer a, footer a:link {
            color: #fff;
            text-decoration: none;
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<div class="wrapper" id="basicBox">
    <form class="login">
        <p class="title">Log in</p>
        <input type="text" placeholder="Email or Username" autofocus/>
        <i class="fa fa-user"></i>
        <input type="password" placeholder="Password" />
        <i class="fa fa-key"></i><br>
        <a data-toggle="modal" data-target="#signupModal" style="color: #2196f3">New Customer</a><br>
        <a href="#">Forgot your password?</a>
        <button>
            <i class="spinner"></i>
            <span class="state">Log in</span>
        </button>
    </form>

    <!-- signup modal Start -->
    <div class="modal fade" id="signupModal" data-backdrop="static">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Sign up</h4>
                    <button type="button" class="close" data-dismiss="modal"
                            aria-label="close">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <form action="/ddubeok2/register" class="user-signup" id="signup-form" method="post">
                        <div class="form-group">
                            <label for="signup-user-id" class="col-form-label">User Name</label>
                            <span id="signup-user-id-result"></span>
                            <input type="text" placeholder="User Name" class="form-control" name="account" id="signup-user-id" autofocus/>
                            <i class="fa fa-user"></i>
                        </div>
                        <div class="form-group">
                            <label for="signup-user-email" class="col-form-label">Email</label>
                            <span id="signup-user-email-result"></span>
                            <input type="text" placeholder="비밀번호 찾기시 필요하니 정확히 입력해주세요." class="form-control" name="email" id="signup-user-email" autofocus/>
                            <i class="fa fa-at"></i>
                        </div>
                        <div class="form-group">
                            <label for="signup-user-gender" class="col-form-label">gender</label><br>
                            <select name="gender" id="signup-user-gender" aria-required="true">
                                <option value="male">Male</option>
                                <option value="female">Female</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="signup-user-password" class="col-form-label">비밀번호를 입력해주세요.</label>
                            <span id="signup-user-password-result"></span>
                            <input type="password" placeholder="8자리 이상(영어 대문자, 소문자, 숫자, 특수문자 중 3종류 조합)"
                                   class="form-control" name="password" id="signup-user-password" autofocus/>
                            <i class="fa fa-key"></i>
                        </div>
                        <div class="form-group">
                            <label for="signup-user-password2" class="col-form-label">비밀번호를 확인해주세요.</label>
                            <span id="signup-user-password2-result"></span>
                            <input type="password" placeholder="비밀번호 재입력" class="form-control" name="password2" id="signup-user-password2" autofocus/>
                            <i class="fa fa-key"></i>
                        </div>
                        <div class="form-group">
                                <label for="signup-user-phone" class="col-form-label">Phone</label>
                                <span id="signup-user-phone-result"></span>
                                <div style="display: flex;">
                                <select type="select" name="shortCountryCode" aria-required="true" role="combobox" aria-multiline="false" aria-labelledby="country-code-lbl-aria" style="width:150px; height:37px; ">
                                <option role="option" data-code="+93" value="AF">Afghanistan &#8234;(+93)&#8236;</option>
                                <option role="option" data-code="+355" value="AL">Albania &#8234;(+355)&#8236;</option>
                                <option role="option" data-code="+213" value="DZ">Algeria &#8234;(+213)&#8236;</option>
                                <option role="option" data-code="+1" value="AS">American Samoa &#8234;(+1)&#8236;</option>
                                <option role="option" data-code="+376" value="AD">Andorra &#8234;(+376)&#8236;</option>
                                <option role="option" data-code="+244" value="AO">Angola &#8234;(+244)&#8236;</option>
                                <option role="option" data-code="+1" value="AI">Anguilla &#8234;(+1)&#8236;</option>
                                <option role="option" data-code="+1" value="AG">Antigua and Barbuda &#8234;(+1)&#8236;</option>
                                <option role="option" data-code="+54" value="AR">Argentina &#8234;(+54)&#8236;</option>
                                <option role="option" data-code="+374" value="AM">Armenia &#8234;(+374)&#8236;</option>
                                <option role="option" data-code="+297" value="AW">Aruba &#8234;(+297)&#8236;</option>
                                <option role="option" data-code="+247" value="AC">Ascension &#8234;(+247)&#8236;</option>
                                <option role="option" data-code="+61" value="AU">Australia &#8234;(+61)&#8236;</option>
                                <option role="option" data-code="+672" value="AX">Australian External Territories &#8234;(+672)&#8236;</option>
                                <option role="option" data-code="+43" value="AT">Austria &#8234;(+43)&#8236;</option>
                                <option role="option" data-code="+994" value="AZ">Azerbaijan &#8234;(+994)&#8236;</option>
                                <option role="option" data-code="+1" value="BS">Bahamas &#8234;(+1)&#8236;</option>
                                <option role="option" data-code="+973" value="BH">Bahrain &#8234;(+973)&#8236;</option>
                                <option role="option" data-code="+880" value="BD">Bangladesh &#8234;(+880)&#8236;</option>
                                <option role="option" data-code="+1" value="BB">Barbados &#8234;(+1)&#8236;</option>
                                <option role="option" data-code="+375" value="BY">Belarus &#8234;(+375)&#8236;</option>
                                <option role="option" data-code="+32" value="BE">Belgium &#8234;(+32)&#8236;</option>
                                <option role="option" data-code="+501" value="BZ">Belize &#8234;(+501)&#8236;</option>
                                <option role="option" data-code="+229" value="BJ">Benin &#8234;(+229)&#8236;</option>
                                <option role="option" data-code="+1" value="BM">Bermuda &#8234;(+1)&#8236;</option>
                                <option role="option" data-code="+975" value="BT">Bhutan &#8234;(+975)&#8236;</option>
                                <option role="option" data-code="+591" value="BO">Bolivia &#8234;(+591)&#8236;</option>
                                <option role="option" data-code="+387" value="BA">Bosnia and Herzegovina &#8234;(+387)&#8236;</option>
                                <option role="option" data-code="+267" value="BW">Botswana &#8234;(+267)&#8236;</option>
                                <option role="option" data-code="+55" value="BR">Brazil &#8234;(+55)&#8236;</option>
                                <option role="option" data-code="+1" value="VG">British Virgin Islands &#8234;(+1)&#8236;</option>
                                <option role="option" data-code="+673" value="BN">Brunei Darussalam &#8234;(+673)&#8236;</option>
                                <option role="option" data-code="+359" value="BG">Bulgaria &#8234;(+359)&#8236;</option>
                                <option role="option" data-code="+226" value="BF">Burkina Faso &#8234;(+226)&#8236;</option>
                                <option role="option" data-code="+257" value="BI">Burundi &#8234;(+257)&#8236;</option>
                                <option role="option" data-code="+855" value="KH">Cambodia &#8234;(+855)&#8236;</option>
                                <option role="option" data-code="+237" value="CM">Cameroon &#8234;(+237)&#8236;</option>
                                <option role="option" data-code="+1" value="CA">Canada &#8234;(+1)&#8236;</option>
                                <option role="option" data-code="+238" value="CV">Cape Verde &#8234;(+238)&#8236;</option>
                                <option role="option" data-code="+1" value="KY">Cayman Islands &#8234;(+1)&#8236;</option>
                                <option role="option" data-code="+236" value="CF">Central African Republic &#8234;(+236)&#8236;</option>
                                <option role="option" data-code="+235" value="TD">Chad &#8234;(+235)&#8236;</option>
                                <option role="option" data-code="+56" value="CL">Chile &#8234;(+56)&#8236;</option>
                                <option role="option" data-code="+86" value="CN">China &#8234;(+86)&#8236;</option>
                                <option role="option" data-code="+57" value="CO">Colombia &#8234;(+57)&#8236;</option>
                                <option role="option" data-code="+269" value="KM">Comoros &#8234;(+269)&#8236;</option>
                                <option role="option" data-code="+242" value="CG">Congo &#8234;(+242)&#8236;</option>
                                <option role="option" data-code="+682" value="CK">Cook Islands &#8234;(+682)&#8236;</option>
                                <option role="option" data-code="+506" value="CR">Costa Rica &#8234;(+506)&#8236;</option>
                                <option role="option" data-code="+225" value="CI">Cote dÕIvoire &#8234;(+225)&#8236;</option>
                                <option role="option" data-code="+385" value="HR">Croatia &#8234;(+385)&#8236;</option>
                                <option role="option" data-code="+53" value="CU">Cuba &#8234;(+53)&#8236;</option>
                                <option role="option" data-code="+357" value="CY">Cyprus &#8234;(+357)&#8236;</option>
                                <option role="option" data-code="+420" value="CZ">Czech Republic &#8234;(+420)&#8236;</option>
                                <option role="option" data-code="+243" value="CD">Democratic Republic of the Congo &#8234;(+243)&#8236;</option>
                                <option role="option" data-code="+45" value="DK">Denmark &#8234;(+45)&#8236;</option>
                                <option role="option" data-code="+246" value="DG">Diego Garcia &#8234;(+246)&#8236;</option>
                                <option role="option" data-code="+253" value="DJ">Djibouti &#8234;(+253)&#8236;</option>
                                <option role="option" data-code="+1" value="DM">Dominica &#8234;(+1)&#8236;</option>
                                <option role="option" data-code="+1" value="DO">Dominican Republic &#8234;(+1)&#8236;</option>
                                <option role="option" data-code="+670" value="TL">East Timor &#8234;(+670)&#8236;</option>
                                <option role="option" data-code="+593" value="EC">Ecuador &#8234;(+593)&#8236;</option>
                                <option role="option" data-code="+20" value="EG">Egypt &#8234;(+20)&#8236;</option>
                                <option role="option" data-code="+503" value="SV">El Salvador &#8234;(+503)&#8236;</option>
                                <option role="option" data-code="+240" value="GQ">Equatorial Guinea &#8234;(+240)&#8236;</option>
                                <option role="option" data-code="+291" value="ER">Eritrea &#8234;(+291)&#8236;</option>
                                <option role="option" data-code="+372" value="EE">Estonia &#8234;(+372)&#8236;</option>
                                <option role="option" data-code="+251" value="ET">Ethiopia &#8234;(+251)&#8236;</option>
                                <option role="option" data-code="+500" value="FK">Falkland Islands &#8234;(+500)&#8236;</option>
                                <option role="option" data-code="+298" value="FO">Faroe Islands &#8234;(+298)&#8236;</option>
                                <option role="option" data-code="+679" value="FJ">Fiji &#8234;(+679)&#8236;</option>
                                <option role="option" data-code="+358" value="FI">Finland &#8234;(+358)&#8236;</option>
                                <option role="option" data-code="+33" value="FR">France &#8234;(+33)&#8236;</option>
                                <option role="option" data-code="+594" value="GF">French Guiana &#8234;(+594)&#8236;</option>
                                <option role="option" data-code="+689" value="PF">French Polynesia &#8234;(+689)&#8236;</option>
                                <option role="option" data-code="+241" value="GA">Gabon &#8234;(+241)&#8236;</option>
                                <option role="option" data-code="+220" value="GM">Gambia &#8234;(+220)&#8236;</option>
                                <option role="option" data-code="+995" value="GE">Georgia &#8234;(+995)&#8236;</option>
                                <option role="option" data-code="+49" value="DE">Germany &#8234;(+49)&#8236;</option>
                                <option role="option" data-code="+233" value="GH">Ghana &#8234;(+233)&#8236;</option>
                                <option role="option" data-code="+350" value="GI">Gibraltar &#8234;(+350)&#8236;</option>
                                <option role="option" data-code="+30" value="GR">Greece &#8234;(+30)&#8236;</option>
                                <option role="option" data-code="+299" value="GL">Greenland &#8234;(+299)&#8236;</option>
                                <option role="option" data-code="+1" value="GD">Grenada &#8234;(+1)&#8236;</option>
                                <option role="option" data-code="+590" value="GP">Guadeloupe &#8234;(+590)&#8236;</option>
                                <option role="option" data-code="+1" value="GU">Guam &#8234;(+1)&#8236;</option>
                                <option role="option" data-code="+502" value="GT">Guatemala &#8234;(+502)&#8236;</option>
                                <option role="option" data-code="+224" value="GN">Guinea &#8234;(+224)&#8236;</option>
                                <option role="option" data-code="+245" value="GW"> &#8234;(+245)&#8236;</option>
                                <option role="option" data-code="+592" value="GY">Guyana &#8234;(+592)&#8236;</option>
                                <option role="option" data-code="+509" value="HT">Haiti &#8234;(+509)&#8236;</option>
                                <option role="option" data-code="+504" value="HN">Honduras &#8234;(+504)&#8236;</option>
                                <option role="option" data-code="+852" value="HK">Hong Kong &#8234;(+852)&#8236;</option>
                                <option role="option" data-code="+36" value="HU">Hungary &#8234;(+36)&#8236;</option>
                                <option role="option" data-code="+354" value="IS">Iceland &#8234;(+354)&#8236;</option>
                                <option role="option" data-code="+91" value="IN">India &#8234;(+91)&#8236;</option>
                                <option role="option" data-code="+62" value="ID">Indonesia &#8234;(+62)&#8236;</option>
                                <option role="option" data-code="+98" value="IR">Iran &#8234;(+98)&#8236;</option>
                                <option role="option" data-code="+964" value="IQ">Iraq &#8234;(+964)&#8236;</option>
                                <option role="option" data-code="+353" value="IE">Ireland &#8234;(+353)&#8236;</option>
                                <option role="option" data-code="+972" value="IL">Israel &#8234;(+972)&#8236;</option>
                                <option role="option" data-code="+39" value="IT">Italy &#8234;(+39)&#8236;</option>
                                <option role="option" data-code="+1" value="JM">Jamaica &#8234;(+1)&#8236;</option>
                                <option role="option" data-code="+81" value="JP">Japan &#8234;(+81)&#8236;</option>
                                <option role="option" data-code="+962" value="JO">Jordan &#8234;(+962)&#8236;</option>
                                <option role="option" data-code="+7" value="KZ">Kazakhstan &#8234;(+7)&#8236;</option>
                                <option role="option" data-code="+254" value="KE">Kenya &#8234;(+254)&#8236;</option>
                                <option role="option" data-code="+686" value="KI">Kiribati &#8234;(+686)&#8236;</option>
                                <option role="option" data-code="+965" value="KW">Kuwait &#8234;(+965)&#8236;</option>
                                <option role="option" data-code="+996" value="KG">Kyrgyzstan &#8234;(+996)&#8236;</option>
                                <option role="option" data-code="+856" value="LA">Laos &#8234;(+856)&#8236;</option>
                                <option role="option" data-code="+371" value="LV">Latvia &#8234;(+371)&#8236;</option>
                                <option role="option" data-code="+961" value="LB">Lebanon &#8234;(+961)&#8236;</option>
                                <option role="option" data-code="+266" value="LS">Lesotho &#8234;(+266)&#8236;</option>
                                <option role="option" data-code="+231" value="LR">Liberia &#8234;(+231)&#8236;</option>
                                <option role="option" data-code="+218" value="LY">Libya &#8234;(+218)&#8236;</option>
                                <option role="option" data-code="+423" value="LI">Liechtenstein &#8234;(+423)&#8236;</option>
                                <option role="option" data-code="+370" value="LT">Lithuania &#8234;(+370)&#8236;</option>
                                <option role="option" data-code="+352" value="LU">Luxembourg &#8234;(+352)&#8236;</option>
                                <option role="option" data-code="+853" value="MO">Macao &#8234;(+853)&#8236;</option>
                                <option role="option" data-code="+389" value="MK">Macedonia &#8234;(+389)&#8236;</option>
                                <option role="option" data-code="+261" value="MG">Madagascar &#8234;(+261)&#8236;</option>
                                <option role="option" data-code="+265" value="MW">Malawi &#8234;(+265)&#8236;</option>
                                <option role="option" data-code="+60" value="MY">Malaysia &#8234;(+60)&#8236;</option>
                                <option role="option" data-code="+960" value="MV">Maldives &#8234;(+960)&#8236;</option>
                                <option role="option" data-code="+223" value="ML">Mali &#8234;(+223)&#8236;</option>
                                <option role="option" data-code="+356" value="MT">Malta &#8234;(+356)&#8236;</option>
                                <option role="option" data-code="+692" value="MH">Marshall Islands &#8234;(+692)&#8236;</option>
                                <option role="option" data-code="+596" value="MQ">Martinique &#8234;(+596)&#8236;</option>
                                <option role="option" data-code="+222" value="MR">Mauritania &#8234;(+222)&#8236;</option>
                                <option role="option" data-code="+230" value="MU">Mauritius &#8234;(+230)&#8236;</option>
                                <option role="option" data-code="+52" value="MX">Mexico &#8234;(+52)&#8236;</option>
                                <option role="option" data-code="+691" value="FM">Micronesia &#8234;(+691)&#8236;</option>
                                <option role="option" data-code="+373" value="MD">Moldova &#8234;(+373)&#8236;</option>
                                <option role="option" data-code="+377" value="MC">Monaco &#8234;(+377)&#8236;</option>
                                <option role="option" data-code="+976" value="MN">Mongolia &#8234;(+976)&#8236;</option>
                                <option role="option" data-code="+382" value="ME">Montenegro &#8234;(+382)&#8236;</option>
                                <option role="option" data-code="+1" value="MS">Montserrat &#8234;(+1)&#8236;</option>
                                <option role="option" data-code="+212" value="MA">Morocco &#8234;(+212)&#8236;</option>
                                <option role="option" data-code="+258" value="MZ">Mozambique &#8234;(+258)&#8236;</option>
                                <option role="option" data-code="+95" value="MM">Myanmar &#8234;(+95)&#8236;</option>
                                <option role="option" data-code="+264" value="NA">Namibia &#8234;(+264)&#8236;</option>
                                <option role="option" data-code="+674" value="NR">Nauru &#8234;(+674)&#8236;</option>
                                <option role="option" data-code="+977" value="NP">Nepal &#8234;(+977)&#8236;</option>
                                <option role="option" data-code="+31" value="NL">Netherlands &#8234;(+31)&#8236;</option>
                                <option role="option" data-code="+599" value="AN"> &#8234;(+599)&#8236;</option>
                                <option role="option" data-code="+687" value="NC">New Caledonia &#8234;(+687)&#8236;</option>
                                <option role="option" data-code="+64" value="NZ">New Zealand &#8234;(+64)&#8236;</option>
                                <option role="option" data-code="+505" value="NI">Nicaragua &#8234;(+505)&#8236;</option>
                                <option role="option" data-code="+227" value="NE">Niger &#8234;(+227)&#8236;</option>
                                <option role="option" data-code="+234" value="NG">Nigeria &#8234;(+234)&#8236;</option>
                                <option role="option" data-code="+683" value="NU">Niue &#8234;(+683)&#8236;</option>
                                <option role="option" data-code="+850" value="KP">North Korea &#8234;(+850)&#8236;</option>
                                <option role="option" data-code="+1" value="MP">Northern Mariana Islands &#8234;(+1)&#8236;</option>
                                <option role="option" data-code="+47" value="NO">Norway &#8234;(+47)&#8236;</option>
                                <option role="option" data-code="+968" value="OM">Oman &#8234;(+968)&#8236;</option>
                                <option role="option" data-code="+92" value="PK">Pakistan &#8234;(+92)&#8236;</option>
                                <option role="option" data-code="+680" value="PW">Palau &#8234;(+680)&#8236;</option>
                                <option role="option" data-code="+970" value="PS">Palestine &#8234;(+970)&#8236;</option>
                                <option role="option" data-code="+507" value="PA">Panama &#8234;(+507)&#8236;</option>
                                <option role="option" data-code="+675" value="PG">Papua New Guinea &#8234;(+675)&#8236;</option>
                                <option role="option" data-code="+595" value="PY">Paraguay &#8234;(+595)&#8236;</option>
                                <option role="option" data-code="+51" value="PE">Peru &#8234;(+51)&#8236;</option>
                                <option role="option" data-code="+63" value="PH">Philippines &#8234;(+63)&#8236;</option>
                                <option role="option" data-code="+48" value="PL">Poland &#8234;(+48)&#8236;</option>
                                <option role="option" data-code="+351" value="PT">Portugal &#8234;(+351)&#8236;</option>
                                <option role="option" data-code="+1" value="PR">Puerto Rico &#8234;(+1)&#8236;</option>
                                <option role="option" data-code="+974" value="QA">Qatar &#8234;(+974)&#8236;</option>
                                <option role="option" data-code="+262" value="RE">Reunion &#8234;(+262)&#8236;</option>
                                <option role="option" data-code="+40" value="RO">Romania &#8234;(+40)&#8236;</option>
                                <option role="option" data-code="+7" value="RU">Russia &#8234;(+7)&#8236;</option>
                                <option role="option" data-code="+250" value="RW">Rwanda &#8234;(+250)&#8236;</option>
                                <option role="option" data-code="+290" value="SH">Saint Helena &#8234;(+290)&#8236;</option>
                                <option role="option" data-code="+1" value="KN">Saint Kitts and Nevis &#8234;(+1)&#8236;</option>
                                <option role="option" data-code="+1" value="LC">Saint Lucia &#8234;(+1)&#8236;</option>
                                <option role="option" data-code="+508" value="PM">Saint Pierre and Miquelon &#8234;(+508)&#8236;</option>
                                <option role="option" data-code="+1" value="VC">Saint Vincent and Grenadines &#8234;(+1)&#8236;</option>
                                <option role="option" data-code="+685" value="WS">Samoa &#8234;(+685)&#8236;</option>
                                <option role="option" data-code="+378" value="SM">San Marino &#8234;(+378)&#8236;</option>
                                <option role="option" data-code="+239" value="ST">Sao Tome and Principe &#8234;(+239)&#8236;</option>
                                <option role="option" data-code="+966" value="SA">Saudi Arabia &#8234;(+966)&#8236;</option>
                                <option role="option" data-code="+221" value="SN">Senegal &#8234;(+221)&#8236;</option>
                                <option role="option" data-code="+381" value="RS">Serbia &#8234;(+381)&#8236;</option>
                                <option role="option" data-code="+248" value="SC">Seychelles &#8234;(+248)&#8236;</option>
                                <option role="option" data-code="+232" value="SL">Sierra Leone &#8234;(+232)&#8236;</option>
                                <option role="option" data-code="+65" value="SG">Singapore &#8234;(+65)&#8236;</option>
                                <option role="option" data-code="+421" value="SK">Slovakia &#8234;(+421)&#8236;</option>
                                <option role="option" data-code="+386" value="SI">Slovenia &#8234;(+386)&#8236;</option>
                                <option role="option" data-code="+677" value="SB">Solomon Islands &#8234;(+677)&#8236;</option>
                                <option role="option" data-code="+252" value="SO">Somalia &#8234;(+252)&#8236;</option>
                                <option role="option" data-code="+27" value="ZA">South Africa &#8234;(+27)&#8236;</option>
                                <option role="option" data-code="+82" value="KR">South Korea &#8234;(+82)&#8236;</option>
                                <option role="option" data-code="+34" value="ES">Spain &#8234;(+34)&#8236;</option>
                                <option role="option" data-code="+94" value="LK">Sri Lanka &#8234;(+94)&#8236;</option>
                                <option role="option" data-code="+249" value="SD">Sudan &#8234;(+249)&#8236;</option>
                                <option role="option" data-code="+597" value="SR">Suriname &#8234;(+597)&#8236;</option>
                                <option role="option" data-code="+268" value="SZ">Swaziland &#8234;(+268)&#8236;</option>
                                <option role="option" data-code="+46" value="SE">Sweden &#8234;(+46)&#8236;</option>
                                <option role="option" data-code="+41" value="CH">Switzerland &#8234;(+41)&#8236;</option>
                                <option role="option" data-code="+963" value="SY">Syria &#8234;(+963)&#8236;</option>
                                <option role="option" data-code="+886" value="TW">Taiwan &#8234;(+886)&#8236;</option>
                                <option role="option" data-code="+992" value="TJ">Tajikistan &#8234;(+992)&#8236;</option>
                                <option role="option" data-code="+255" value="TZ">Tanzania &#8234;(+255)&#8236;</option>
                                <option role="option" data-code="+66" value="TH">Thailand &#8234;(+66)&#8236;</option>
                                <option role="option" data-code="+228" value="TG">Togo &#8234;(+228)&#8236;</option>
                                <option role="option" data-code="+690" value="TK">Tokelau &#8234;(+690)&#8236;</option>
                                <option role="option" data-code="+676" value="TO">Tonga &#8234;(+676)&#8236;</option>
                                <option role="option" data-code="+1" value="TT">Trinidad and Tobago &#8234;(+1)&#8236;</option>
                                <option role="option" data-code="+216" value="TN">Tunisia &#8234;(+216)&#8236;</option>
                                <option role="option" data-code="+90" value="TR">Turkey &#8234;(+90)&#8236;</option>
                                <option role="option" data-code="+993" value="TM">Turkmenistan &#8234;(+993)&#8236;</option>
                                <option role="option" data-code="+1" value="TC">Turks and Caicos Islands &#8234;(+1)&#8236;</option>
                                <option role="option" data-code="+688" value="TV">Tuvalu &#8234;(+688)&#8236;</option>
                                <option role="option" data-code="+1" value="VI">US Virgin Islands &#8234;(+1)&#8236;</option>
                                <option role="option" data-code="+256" value="UG">Uganda &#8234;(+256)&#8236;</option>
                                <option role="option" data-code="+380" value="UA">Ukraine &#8234;(+380)&#8236;</option>
                                <option role="option" data-code="+971" value="AE">United Arab Emirates &#8234;(+971)&#8236;</option>
                                <option role="option" data-code="+44" value="GB">United Kingdom &#8234;(+44)&#8236;</option>
                                <option role="option" data-code="+1" value="US" data-format="(XXX) XXX-XXXX" selected="selected">United States &#8234;(+1)&#8236;</option>
                                <option role="option" data-code="+598" value="UY">Uruguay &#8234;(+598)&#8236;</option>
                                <option role="option" data-code="+998" value="UZ">Uzbekistan &#8234;(+998)&#8236;</option>
                                <option role="option" data-code="+678" value="VU">Vanuatu &#8234;(+678)&#8236;</option>
                                <option role="option" data-code="+379" value="VA">Vatican City &#8234;(+379)&#8236;</option>
                                <option role="option" data-code="+58" value="VE">Venezuela &#8234;(+58)&#8236;</option>
                                <option role="option" data-code="+84" value="VN">Vietnam &#8234;(+84)&#8236;</option>
                                <option role="option" data-code="+681" value="WF">Wallis and Futuna &#8234;(+681)&#8236;</option>
                                <option role="option" data-code="+967" value="YE">Yemen &#8234;(+967)&#8236;</option>
                                <option role="option" data-code="+260" value="ZM">Zambia &#8234;(+260)&#8236;</option>
                                <option role="option" data-code="+263" value="ZW">Zimbabwe &#8234;(+263)&#8236;</option>
                                </select>
                                <input type="text" placeholder="Phone Number" class="form-control" name="nickname" id="signup-user-phone" autofocus/>
                                <i class="fa fa-mobile-alt"></i>
                                </div>
                        </div>

                    </form>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer" style="margin-top: 25px;">
                    <button type="button" class="btn-signup btn btn-primary" id="signup-btn" style="margin-left: -0.5px;">회원가입</button>
                </div>
            </div>
        </div>
    </div>
<%--    <footer><a target="blank" href="#">New Customer</a></footer>--%>

</div>

<script>
    $(function() {

        const getPwCheck= RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
        const changeForm = $("#change-form");
        let chk1 = false, chk2 = false;
        $('#signup-user-password').on('keyup', function() {
            if($("#signup-user-password").val() === ""){
                $('#signup-user-password').css("background-color", "pink");
                $('#signup-user-password-result').html('<b style="font-size:14px;color:red;">[패스워드는 필수정보!]</b>');
                chk1 = false;
            }
            else if(!getPwCheck.test($("#signup-user-password").val()) || $("#signup-user-password").val().length < 8){
                $('#signup-user-password').css("background-color", "pink");
                $('#signup-user-password-result').html('<b style="font-size:14px;color:red;">[특수문자 포함 8자이상]</b>');
                chk1 = false;
            } else {
                $('#signup-user-password').css("background-color", "aqua");
                $('#signup-user-password-result').html('<b style="font-size:14px;color:green;">[참 잘했어요]</b>');
                chk1 = true;
            }

        });

        $('#signup-user-password2').on('keyup', function() {
            if($("#signup-user-password2").val() === ""){
                $('#signup-user-password2').css("background-color", "pink");
                $('#signup-user-password2-result').html('<b style="font-size:14px;color:red;">[패스워드확인은 필수정보!]</b>');
                chk2 = false;
            }
            else if($("#signup-user-password").val() != $("#signup-user-password2").val()){
                $('#signup-user-password2').css("background-color", "pink");
                $('#signup-user-password2-result').html('<b style="font-size:14px;color:red;">[위에랑 똑같이!!]</b>');
                chk2 = false;
            } else {
                $('#signup-user-password2').css("background-color", "aqua");
                $('#signup-user-password2-result').html('<b style="font-size:14px;color:green;">[참 잘했어요]</b>');
                chk2 = true;
            }

        });
        $('#change-btn').click(function() {
            chk1 = true;
            chk2 = true;
            if(chk1 && chk2) {
                changeForm.submit();
            } else {
                alert("입력정보를 다시 확인하세요!");
            }
        });
    });
</script>
</body>
</html>