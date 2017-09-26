<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="car.dto.MemberVO,java.util.*"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
body {font-family: "Lato", sans-serif}
.mySlides {display: none}
.stl td{hover}
</style>
<body>

<!-- Navbar -->

<header class="w3-top">
  <div class="w3-bar w3-black w3-card-2">
    <a class="w3-bar-item w3-button w3-padding-large w3-hide-medium w3-hide-large w3-right" href="javascript:void(0)" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
    <a href="index.html" class="w3-bar-item w3-button w3-padding-large">HOME</a>
    <a href="index.html#ch" class="w3-bar-item w3-button w3-padding-large w3-hide-small">������</a>
    <a href="index.html#car" class="w3-bar-item w3-button w3-padding-large w3-hide-small">������</a>
    <a href="index.html#contact" class="w3-bar-item w3-button w3-padding-large w3-hide-small">CONTACT</a>
    <a href="#map" class="w3-bar-item w3-button w3-padding-large w3-hide-small">MAP</a>
    
    
  </div>
</header>
		<div style="width:350px; height:270px; float:left; display:inline-block;">
			<div style="margin-top: 80px; padding-bottom: 10px;">
			<form action = "./loc" method = "post"> 
				<span style="font-weight: bolder;font: 14px; float:left; padding-left: 5px;">���� ����</span>
				<br style="line-height: 1.5;">
				<select id="SI_DO" style="margin-left: 5px;" title="�õ� ����" name="SI_DO">
				<option value="">�õ�</option>
				<option value="2">������</option>
				<option value="3">��⵵</option>
				<option value="4">���</option>
				<option value="5">���ֱ�����</option>
				<option value="6">�뱸������</option>	
				<option value="7">����������</option>
				<option value="8">�λ걤����</option>
				<option value="1">����Ư����</option>
				<option value="9">��걤����</option>
				<option value="10">����</option>
				<option value="11">���ֵ�</option>
				<option value="12">��û��</option>
				</select> 
				<button type="submit" id="word_btn" style="width:10px; height:10px; margin-top:11px;"><img src="./images/reading_glass.gif" alt="��ȸ ��ư"></button>
			</form>
			</div>
		<div class="search_box" style="float:left;">
 		<span style="font-weight: bolder;font: 14px; float:left; padding-left: 5px;">������ �з�</span>
			<form action = "./loc" method="post">
			<input type="hidden" name="command" value="csNm">	
			<input type="text" name="key_search" id="STAT_NAME"
				placeholder="�˻��� �Է����ּ���." title="�˻�� �Է¹ٶ��ϴ�."
				style="width: 150px; margin-top: 20px; margin-left: 5px; border: 1px solid #c0c0be; ime-mode: active;">
			<input type="submit" value="��ȸ">
			</form> 
			<br style="line-height: 20px;">
			<a href="#" class="bt_spot_detail"
				style="background-color: #4C4C4C; color: white; top: 3px; left: 95px; margin-left: 5px;"
				onclick="window.location.reload(true);">�ʱ�ȭ</a>
		</div>
		</div>
<div class="container" style="width:500px; height:200px; float:left; overflow:auto; margin-top:100px;">
<!--  <div style="width:500px; height:200px; float:left; overflow:auto; margin-top:100px;"> -->
	<table class="table table-hover">
	 <thead>
		<tr>
			<td>ID</td>
			<td>�����Ҹ�</td>
			<td>�ּ�</td>
			<td>����������</td>
		</tr>
	 </thead>
		 <tbody>
			<tr>
				<td>${st.getId()}</td>
				<td>${st.getCsnm()}</td>
				<td>${st.getAddr()}</td>
				<td>${st.getCpnm()}</td>
			</tr>
		 </tbody>
	</table>
<!--  </div> -->
</div>
	<div class="w3-bar w3-indigo w3-card-2">
</div>

		
<div class="w3-bar w3-indigo w3-card-2">
</div>



<!-- Add Google Maps -->
<div style="padding-top:30px;">
<h1>MAP</h1>
</div>

<div id="map" style="width:100%;height:400px;"></div>
<input type="hidden" id="a" name="a" value="${st.getLat()}">
<input type="hidden" id="b" name="b" value="${st.getLongi()}">

<!-- ���� ���� -->
<script>
function myMap() {
	var a=document.getElementById("a").value;
	var b=document.getElementById("b").value;
	var mapProp= {
	    center:new google.maps.LatLng(a,b),
	    zoom:18,
	};
	var map=new google.maps.Map(document.getElementById("map"),mapProp);

	}
</script>
<!-- ���� ���� -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBjvtC_0Hr83DsKOtKr0oamgTdwyBtcuho&callback=myMap"></script>
<!--
To use this code on your website, get a free API key from Google.
Read more at: https://www.w3schools.com/graphics/google_maps_basic.asp
-->

<!-- Footer -->
<footer class="w3-container w3-padding-64 w3-center w3-opacity w3-light-grey w3-xlarge">
  <i class="fa fa-facebook-official w3-hover-opacity"></i>
  <i class="fa fa-instagram w3-hover-opacity"></i>
  <i class="fa fa-snapchat w3-hover-opacity"></i>
  <i class="fa fa-pinterest-p w3-hover-opacity"></i>
  <i class="fa fa-twitter w3-hover-opacity"></i>
  <i class="fa fa-linkedin w3-hover-opacity"></i>
  <p class="w3-medium">Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">team 4</a></p>
</footer>

<script>
// Automatic Slideshow - change image every 4 seconds
var myIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";  
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}    
    x[myIndex-1].style.display = "block";  
    setTimeout(carousel, 4000);    
}

// Used to toggle the menu on small screens when clicking on the menu button
function myFunction() {
    var x = document.getElementById("navDemo");
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
    } else { 
        x.className = x.className.replace(" w3-show", "");
    }
}

</script>



</body>
</html>
