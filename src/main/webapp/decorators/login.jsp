<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title><dec:title default="Đăng nhập" /></title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<link href="style.css" rel="stylesheet" type="text/css" media="all"/>
    <style>
        body {
        	background: #ABCDEF;
        	font-family: Assistant, sans-serif;
        	display: flex;
        	min-height: 90vh;
        }

        .login {
            width: 30%;
            color: white;
            background: #136a8a;
            background:
                    -webkit-linear-gradient(to right, #267871, #136a8a);
            background:
                    linear-gradient(to right, #267871, #136a8a);
            margin: auto;
            box-shadow:
                    0px 2px 10px rgba(0,0,0,0.2),
                    0px 10px 20px rgba(0,0,0,0.3),
                    0px 30px 60px 1px rgba(0,0,0,0.5);
            border-radius: 8px;
            padding: 50px;
        }
        .login .head {
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .login .head .company {
            font-size: 2.2em;
        }
        .login .msg {
            text-align: center;
        }
        .login .form input[type=text].text {
            border: none;
            background: none;
            box-shadow: 0px 2px 0px 0px white;
            width: 100%;
            color: white;
            font-size: 1em;
            outline: none;
        }
        .login .form .text::placeholder {
            color: #D3D3D3;
        }
        .login .form input[type=password].password {
            border: none;
            background: none;
            box-shadow: 0px 2px 0px 0px white;
            width: 100%;
            color: white;
            font-size: 1em;
            outline: none;
            margin-bottom: 20px;
            margin-top: 20px;
        }
        .login .form .password::placeholder {
            color: #D3D3D3;
        }
        .login .form .btn-login {
            background: none;
            text-decoration: none;
            color: white;
            box-shadow: 0px 0px 0px 2px white;
            border-radius: 3px;
            padding: 5px 2em;
            transition: 0.5s;
        }
        .login .form .btn-login:hover {
            background: white;
            color: dimgray;
            transition: 0.5s;
        }
        .login .forgot {
            text-decoration: none;
            color: white;
            float: right;
        }
    </style>
</head>
<body id="LoginForm">
    <dec:body/>
</body>
</html>