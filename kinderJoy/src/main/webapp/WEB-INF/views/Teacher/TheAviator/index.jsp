<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<!-- CSS Link -->
	<c:import url="../module/importCSS.jsp"></c:import>
	<!-- JS Link -->
	<c:import url="../module/importJS.jsp"></c:import>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>The Aviator: The Game | Codrops</title>
		<meta name="description" content="Demo of the game: The Making of 'The Aviator': Animating a Basic 3D Scene with Three.js" />
		<meta name="keywords" content="three.js, webgl, tutorial, game, 3d, animation, airplane, web development, javascript" />
		<meta name="author" content="Karim Maaloul for Codrops" />
		<link rel="shortcut icon" href="favicon.ico">
		<link href='https://fonts.googleapis.com/css?family=Playfair+Display:400,700,700italic' rel='stylesheet' type='text/css'>
		<link rel="stylesheet" type="text/css" href="css/JKC/gamecss/demo.css" />
		<link rel="stylesheet" type="text/css" href="css/JKC/gamecss/game.css" />
		<script type="text/javascript" src="js/JKC/gamejs/TweenMax.min.js"></script>
		<script type="text/javascript" src="js/JKC/gamejs/three.min.js"></script>
		<script type="text/javascript" src="js/JKC/gamejs/game.js" /></script>
		<!--[if IE]>
		  <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
	</head>
	<body>
		<div class="game-holder" id="gameHolder">
			<div class="header">
				<h1><span>the</span>Aviator</h1>
				<h2>fly it to the end</h2>
				<div class="score" id="score">
					<div class="score__content" id="level">
						<div class="score__label">level</div>
						<div class="score__value score__value--level" id="levelValue">1</div>
						<svg class="level-circle" id="levelCircle" viewbox="0 0 200 200">
							<circle id="levelCircleBgr" r="80" cx="100" cy="100" fill="none" stroke="#d1b790" stroke-width="24px" />
							<circle id="levelCircleStroke" r="80" cx="100" cy="100" fill="none" #f25346 stroke="#68c3c0" stroke-width="14px" stroke-dasharray="502" />
						</svg>
					</div>
					<div class="score__content" id="dist">
						<div class="score__label">distance</div>
						<div class="score__value score__value--dist" id="distValue">000</div>
					</div>
					<div class="score__content" id="energy">
						<div class="score__label">energy</div>
						<div class="score__value score__value--energy" id="energyValue">
							<div class="energy-bar" id="energyBar"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="world" id="world"></div>
			<div class="message message--replay" id="replayMessage">Click to Replay</div>
			<div class="message message--instructions" id="instructions">이 게임은 codrops에서<span>퍼왔습니다</span></div>
		</div>
		<!-- Demo links -->
		<nav class="meta">
			<a class="demo-link" href="${pageContext.request.contextPath}/">HOME</a>
			<a class="demo-link" href="${pageContext.request.contextPath}/Add">sign up</a>
		</nav>
		<div class="partisan">
			<svg class="partisan__bg" viewBox="0 0 500 188" preserveAspectRatio="none" width="100%" height="100%" aria-hidden="true">
				<polygon points="0 154 123.39 0 235.78 14.79 365.6 28.9 436.24 114.93 500 188 0 188 0 154" fill="#bed730"/>
				<polygon points="0 188 108.84 18.17 347.91 26.79 500 188 365.6 28.9 123.39 0 0 154 0 188" fill="#dde465"/>
			</svg>
		</div>
	</body>
</html>
