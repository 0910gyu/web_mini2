<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="car.dto.SidoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {font-family: "Lato", sans-serif}
.mySlides {display: none}
</style>
<body>

<%
	request.getSession().getAttribute("sdList");
	
%>

<!-- Navbar -->

<header class="w3-top">
  <div class="w3-bar w3-black w3-card-2">
    <a class="w3-bar-item w3-button w3-padding-large w3-hide-medium w3-hide-large w3-right" href="javascript:void(0)" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
    <a href="index.html" class="w3-bar-item w3-button w3-padding-large">HOME</a>
    <a href="index.html#ch" class="w3-bar-item w3-button w3-padding-large w3-hide-small">충전소</a>
    <a href="index.html#car" class="w3-bar-item w3-button w3-padding-large w3-hide-small">전기차</a>
    <a href="index.html#contact" class="w3-bar-item w3-button w3-padding-large w3-hide-small">CONTACT</a>
    <a href="#map" class="w3-bar-item w3-button w3-padding-large w3-hide-small">MAP</a>
    <a href="#map" class="w3-bar-item w3-button w3-padding-large w3-hide-small">데이터 갱신</a>
    
    
  </div>
</header>
		<div style="width:250px; height:270px; float:left; display:inline-block;">
			<div style="margin-top: 80px; padding-bottom: 10px;">
			<form action = "./loc" method = "get"> 
				<input type="hidden" name="command" value="sido">
				<span style="font-weight: bolder;font: 14px; float:left; padding-left: 5px;">지역 선택</span>
				<br style="line-height: 1.5;">
 				<select id="SI_DO" style="margin-left: 5px;" title="시도 선택" name="SI_DO" required onchange=selectStation("${pageContext.request.contextPath}")>
 					<option value="">시도 선택</option>
 					<c:forEach items="${sessionScope.sdList}" var="data">
 						<option value=${data.sidoID}>${data.sidoNm}</option>
 					</c:forEach>
				</select>
				<button type="submit" id="word_btn" value="검색" style="width:10px; height:20px; margin-top:11px;"><img src="./images/reading_glass.gif" alt="조회 버튼"></button>
			</form>
		</div>
		
		<script type="text/javascript">
			var httpRequest = null;
			function sendRequest(addr, params){
				httpRequest = new XMLHttpRequest();
				httpRequest.onreadystatechange = viewTable;
				httpRequest.open("GET", addr+"/loc?command=sido&SI_DO="+encodeURIComponent(params), true);
				httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
				httpRequest.send(null);
			}
			
			function selectStation(addr){
				var str;
				str = document.getElementById("SI_DO").value;
				sendRequest(addr, str);
			}
			
			function viewTable(){
	    		if(httpRequest.readyState == 4 && httpRequest.status == 200){
	    			viewStation.innerHTML = httpRequest.responseText;
				}			
			}
		
		</script>
			
		<div class="search_box" style="float:left;">
 		<span style="font-weight: bolder;font: 14px; float:left; padding-left: 5px;">충전소 분류</span>
			<form action = "./loc" method="post">
			<input type="hidden" name="command" value="csNm">
			<input type="text" name="key_search" id="STAT_NAME"
				placeholder="검색어 입력해주세요." title="검색어를 입력바랍니다."
				style="width: 150px; margin-top: 20px; margin-left: 5px; border: 1px solid #c0c0be; ime-mode: active;">
			<input type="submit" value="조회">
			</form> 
			<br style="line-height: 20px;">
			<a href="#" class="bt_spot_detail"
				style="background-color: #4C4C4C; color: white; top: 3px; left: 95px; margin-left: 5px;"
				onclick="window.location.reload(true);">초기화</a>
		</div>
		</div>
		<div id="viewStation" style="margin-top:50px; width:800px; height:200px; float:left; display:inline-block;">
			<img src="./images/car3.PNG" width="800px" height="250px">
		</div>
		
<div class="w3-bar w3-indigo w3-card-2">
</div>

   

<!-- Add Google Maps -->
<div style="margin-left:5px; padding-top:30px;">
<h1>MAP</h1>
</div>

<div id="map" style="width:100%;height:400px; margin-left:5px; margin-right:5px"></div>


<!-- 구글 지도 -->
<script>
function myMap() {
  var myCenter = new google.maps.LatLng(37.478899, 126.881399);
  var mapCanvas = document.getElementById("map");
  var mapOptions = {center: myCenter, zoom: 18};
  var map = new google.maps.Map(mapCanvas, mapOptions);
  var marker = new google.maps.Marker({position:myCenter});
  marker.setMap(map);
}
</script>
<!-- 구글 지도 -->
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
