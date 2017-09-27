<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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


/* Full-width input fields */
input[type=text], input[type=password] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

/* Set a style for all buttons */
button {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
}

button:hover {
    opacity: 0.8;
}

/* Extra styles for the cancel button */
.cancelbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #f44336;
}

/* Center the image and position the close button */
.imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
    position: relative;
}

img.avatar {
    width: 40%;
    border-radius: 50%;
}

.container {
    padding: 16px;
}

span.psw {
    float: right;
    padding-top: 16px;
}

/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
    background-color: #fefefe;
    margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
    border: 1px solid #888;
    width: 80%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
.close {
    position: absolute;
    right: 25px;
    top: 0;
    color: #000;
    font-size: 35px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: red;
    cursor: pointer;
}

/* Add Zoom Animation */
.animate {
    -webkit-animation: animatezoom 0.6s;
    animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
    from {-webkit-transform: scale(0)} 
    to {-webkit-transform: scale(1)}
}
    
@keyframes animatezoom {
    from {transform: scale(0)} 
    to {transform: scale(1)}
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
    span.psw {
       display: block;
       float: none;
    }
    .cancelbtn {
       width: 100%;
    }
}


</style>
<body>

<%
	String id = request.getParameter("id");
	
%>

<!-- Navbar -->
<div class="w3-top">
  <div class="w3-bar w3-black w3-card-2">
			<a
				class="w3-bar-item w3-button w3-padding-large w3-hide-medium w3-hide-large w3-right"
				href="javascript:void(0)" onclick="myFunction()"
				title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a> <a
				href="#" class="w3-bar-item w3-button w3-padding-large">HOME</a> <a
				href="#ch"
				class="w3-bar-item w3-button w3-padding-large w3-hide-small">������</a>
			<a href="#car"
				class="w3-bar-item w3-button w3-padding-large w3-hide-small">������</a>
			<a href="#contact"
				class="w3-bar-item w3-button w3-padding-large w3-hide-small">CONTACT</a>
			<a href="#map"
				class="w3-bar-item w3-button w3-padding-large w3-hide-small">MAP</a>
			<a href="stationlist"
				class="w3-bar-item w3-button w3-padding-large w3-hide-small">������
				������ ����</a>
    
    <div class="w3-dropdown w3-hide-small w3-right">
    <a href="javascript:void(0)" class="w3-bar-item w3-button w3-padding-large w3-hide-small" onclick="info()">��������</a>
    <a href="javascript:void(0)" class="w3-bar-item w3-button w3-padding-large w3-hide-small" onclick="logoutPro()">�α׾ƿ�</a>   
    </div>
  </div>
</div>
<!-- Navbar on small screens -->
<div id="navDemo" class="w3-bar-block w3-black w3-hide w3-hide-large w3-hide-medium w3-top" style="margin-top:46px">
  <a href="#ch" class="w3-bar-item w3-button w3-padding-large">ch</a>
  <a href="#car" class="w3-bar-item w3-button w3-padding-large">TOUR</a>
  <a href="#contact" class="w3-bar-item w3-button w3-padding-large">CONTACT</a>
  <a href="#map" class="w3-bar-item w3-button w3-padding-large">MAP</a>
</div>

<!-- Page content -->
<div class="w3-content" style="max-width:2000px;margin-top:46px">

  <!-- Automatic Slideshow Images -->
  <div class="mySlides w3-display-container w3-center">
    <img src="./images/car8.PNG" style="width:100%">
    <div class="w3-display-bottommiddle w3-container w3-text-black w3-padding-32 w3-hide-small">
      <h3>�ǰ��� �����մϴ�</h3>
      <p><b>�ڵ��� ���� �����κ��� �ع�</b></p>   
    </div>
  </div>
  <div class="mySlides w3-display-container w3-center">
    <img src="./images/car1.PNG" style="width:100%">
    <div class="w3-display-bottommiddle w3-container w3-text-black w3-padding-32 w3-hide-small">
      <h3>�������� �����մϴ�</h3>
      <p><b>����� ����ȿ�� </b></p>    
    </div>
  </div>
  <div class="mySlides w3-display-container w3-center">
    <img src="./images/car9.PNG" style="width:100%">
    <div class="w3-display-bottommiddle w3-container w3-text-gray w3-padding-32 w3-hide-small">
      <h3>������</h3>
      <p><b>�̷��� �����մϴ�</b></p>    
    </div>
  </div>

  <!-- The Band Section -->
  <div class="w3-container w3-content w3-center w3-padding-64" style="max-width:800px" id="ch">
    <h2 class="w3-wide">������ ������</h2>
 
    <p class="w3-justify">���� ���� �� ������ ������ �̸��̸� ��ġ Ȯ���ϼ���.<br> ���� �� ������ ��ġ�� �̸� �˸� ���ᰡ ���������� ������ �����.</p>
    <div class="w3-row w3-padding-32 w3-right">
      <div class="w3-third ">
    		 <div class="w3-third ">
        <p>������ ã�� �̵�</p>
        <a href='Charging.jsp'><img src="./images/car4.PNG" class="w3-round w3-margin-bottom " alter="1" alt="Random Name" style="width:100%"></a>
      	</div>
      </div>
    
      
    </div>
  </div>

  <!-- The car Section -->
  <div class="w3-black" id="car">
    <div class="w3-container w3-content w3-padding-64" style="max-width:800px">
      <h2 class="w3-wide w3-center">������</h2>
      <p class="w3-opacity w3-center"><i>2020�� ��ÿ���!</i></p><br>

      <ul class="w3-ul w3-border w3-white w3-text-grey">
        <li class="w3-padding">�ƿ�� <span class="w3-tag w3-red w3-margin-left">2018��</span></li>
        <li class="w3-padding">���� <span class="w3-tag w3-red w3-margin-left">2019��</span></li>
        <li class="w3-padding">���� <span class="w3-tag w3-red w3-margin-left">2019��</span></li>
      </ul>

      <div class="w3-row-padding w3-padding-32" style="margin:0 -16px">
        <div class="w3-third w3-margin-bottom">
          <img src="/w3images/newyork.jpg" alt="�ƿ��" style="width:100%" class="w3-hover-opacity">
          <div class="w3-container w3-white">
            <p><b>�ƿ��</b></p>
            <p class="w3-opacity">Q6</p>
            <p>�ڻ� ù Ǯ ���� SUV�� 2018����� �����Ѵٰ� ����</p>
            <button class="w3-button w3-black w3-margin-bottom" onclick="document.getElementById('More').style.display='block'">More</button>
          </div>
        </div>
        <div class="w3-third w3-margin-bottom">
          <img src="/w3images/paris.jpg" alt="����" style="width:100%" class="w3-hover-opacity">
          <div class="w3-container w3-white">
            <p><b>����</b></p>
            <p class="w3-opacity">Volvo</p>
            <p>�ڻ� Ǯ �������� 2019�� ����Ѵٰ� ����</p>
            <button class="w3-button w3-black w3-margin-bottom" onclick="document.getElementById('More1').style.display='block'">More</button>
          </div>
        </div>
        <div class="w3-third w3-margin-bottom">
          <img src="/w3images/sanfran.jpg" alt="����" style="width:100%" class="w3-hover-opacity">
          <div class="w3-container w3-white">
            <p><b>����</b></p>
            <p class="w3-opacity">apple</p>
            <p>������ 2019����� ���߿� �������� ����Ѵٰ� ���� </p>
            <button class="w3-button w3-black w3-margin-bottom" onclick="document.getElementById('More2').style.display='block'">More</button>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- �ƿ�� -->
  <div id="More" class="w3-modal">
    <div class="w3-modal-content w3-animate-top w3-card-4">
      <header class="w3-container w3-teal w3-center w3-padding-32"> 
        <span onclick="document.getElementById('More').style.display='none'" 
       class="w3-button w3-teal w3-xlarge w3-display-topright">��</span>
        <h2 class="w3-wide"><i class="w3-margin-right"></i>More</h2>
      </header>
      <div class="w3-container">
        <p><label><i class="fa fa-car"></i>Q6</label></p>
       
        <img src="./images/q6.PNG" style="width:100%">
       
      
        <button class="w3-button w3-red w3-section" onclick="document.getElementById('More').style.display='none'">Close <i class="fa fa-remove"></i></button>
        
      </div>
    </div>
  </div>
  
  <!-- ���� -->
  <div id="More1" class="w3-modal">
    <div class="w3-modal-content w3-animate-top w3-card-4">
      <header class="w3-container w3-teal w3-center w3-padding-32"> 
        <span onclick="document.getElementById('More1').style.display='none'" 
       class="w3-button w3-teal w3-xlarge w3-display-topright">��</span>
        <h2 class="w3-wide"><i class="w3-margin-right"></i>More</h2>
      </header>
      <div class="w3-container">
        <p><label><i class="fa fa-car"></i>Volvo</label></p>
       
        <img src="./images/vo.PNG" style="width:100%">
       
      
        <button class="w3-button w3-red w3-section" onclick="document.getElementById('More1').style.display='none'">Close <i class="fa fa-remove"></i></button>
        
      </div>
    </div>
  </div>
  
  <!-- ���� -->
  <div id="More2" class="w3-modal">
    <div class="w3-modal-content w3-animate-top w3-card-4">
      <header class="w3-container w3-teal w3-center w3-padding-32"> 
        <span onclick="document.getElementById('More2').style.display='none'" 
       class="w3-button w3-teal w3-xlarge w3-display-topright">��</span>
        <h2 class="w3-wide"><i class="w3-margin-right"></i>More</h2>
      </header>
      <div class="w3-container">
        <p><label><i class="fa fa-car"></i>apple</label></p>
       
        <img src="./images/ap.PNG" style="width:100%">
       
      
        <button class="w3-button w3-red w3-section" onclick="document.getElementById('More2').style.display='none'">Close <i class="fa fa-remove"></i></button>
        
      </div>
    </div>
  </div>

  <!-- The Contact Section -->
  <div class="w3-container w3-content w3-padding-64" style="max-width:800px" id="contact">
    <h2 class="w3-wide w3-center">CONTACT</h2>
    <p class="w3-opacity w3-center"><i>we love electric vehicles</i></p>
    <div class="w3-row w3-padding-32">
      <div class="w3-col m6 w3-large w3-margin-bottom">
        <i class="fa fa-map-marker" style="width:30px"></i> ����<br>
        <i class="fa fa-phone" style="width:30px"></i> Phone: 02 1234 1234<br>
        <i class="fa fa-envelope" style="width:30px"> </i> Email: mail@mail.com<br>
      </div>
      <div class="w3-col m6">
       
      </div>
    </div>
  </div>
  
<!-- End Page Content -->
</div>
<!-- Add Google Maps -->
<h1>MAP</h1>

<div id="map" style="width:100%;height:400px;"></div>


<!-- ���� ���� -->
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

// When the user clicks anywhere outside of the modal, close it
var modal = document.getElementById('More');
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}

var modal = document.getElementById('More1');
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}

var modal = document.getElementById('More2');
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>

<!-- �α׾ƿ�  -->
<script>
		function logoutPro(){
			location.href="logoutPro.jsp";
		}
</script>

<!-- ���� ���� -->
 <script>
		function info(){
			location.href="info.jsp?id=${id}";
		}
</script>


</body>
</html>
