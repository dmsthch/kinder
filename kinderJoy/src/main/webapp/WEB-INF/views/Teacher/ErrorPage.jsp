<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>

<script type="text/javascript">
var TS_last_log_date = null;
var TSMakeLogDate = function() {
	var date = new Date();

	var y = date.getFullYear();
	var mo = date.getMonth()+1;
	var d = date.getDate();

	var time = {
	  h: date.getHours(),
	  mi: date.getMinutes(),
	  s: date.getSeconds(),
	  ms: date.getMilliseconds()
	};

	Object.keys(time).map(function(moment, index) {
		if (moment == 'ms') {
			if (time[moment] < 10) {
				time[moment] = time[moment]+'00';
			} else if (time[moment] < 100) {
				time[moment] = time[moment]+'0';
			}
		} else if (time[moment] < 10) {
			time[moment] = '0' + time[moment];
		}
	});

	var str = y + '/' + mo + '/' + d + ' ' + time.h + ':' + time.mi + ':' + time.s + '.' + time.ms;
	if (TS_last_log_date) {
		var diff = date-TS_last_log_date;
		//str+= ' ('+diff+'ms)';
	}
	TS_last_log_date = date;
	return str+' ';
}

var parseDeepLinkRequest = function(code) {
	var m = code.match(/"id":"([CDG][A-Z0-9]{8})"/);
	var id = m ? m[1] : null;

	m = code.match(/"team":"(T[A-Z0-9]{8})"/);
	var team = m ? m[1] : null;

	m = code.match(/"message":"([0-9]+\.[0-9]+)"/);
	var message = m ? m[1] : null;

	return { id: id, team: team, message: message };
}

</script>


			<!-- output_css "core" -->
    <link href="https://fst.slack-edge.com/70883/style/rollup-plastic.css" rel="stylesheet" type="text/css" >

		<!-- output_css "before_file_pages" -->

	<!-- output_css "file_pages" -->

	
			<!-- output_css "regular" -->
    <link href="https://fst.slack-edge.com/9682/style/404.css" rel="stylesheet" type="text/css">
<body>
	<div id="page">
		<div id="page_contents" data-qa="page_contents">
		
		<!-- 바로 아래 한줄로 스크롤 왔다갔다 하거나 한쪽만 볼 수 있음 -->
	<div id="content" data-background="https://fst.slack-edge.com/4030/img/404/marrakesh-meadow-80.jpg" style="height: 1084px;">

		<img id="background" src="https://fst.slack-edge.com/4030/img/404/marrakesh-meadow-80.jpg" style="transform: translate3d(-67.7766%, 0px, 0px);">

		<div id="sprite-wrapper" style="width: 6504px; transform: translate3d(-67.7766%, 0px, 0px);">

			<div class="sprite piggy piggy_chewing active" style="transform: scale3d(1.084, 1.084, 1.084); margin-bottom: 3.4146px;"></div>
			<div class="sprite chicken chicken_walk_lr" style="transform: scale3d(1.084, 1.084, 1.084); margin-bottom: 3.4146px;"><div class="sub_sprite"></div></div>
			<div class="sprite chicken chicken_peck_2x flipped idle_2" style="transform: scale3d(1.084, 1.084, 1.084) scaleX(-1); margin-bottom: 3.4146px;"></div>
			<div class="sprite piggy piggy_walk piggy_walk_lr" style="transform: scale3d(1.084, 1.084, 1.084); margin-bottom: 3.4146px;"></div>
			<div class="sprite chicken chicken_walk_rl flipped" style="transform: scale3d(1.084, 1.084, 1.084) scaleX(-1); margin-bottom: 3.4146px;"><div class="sub_sprite"></div></div>
			<div class="sprite piggy piggy_walk flipped piggy_walk_rl" style="transform: scale3d(1.084, 1.084, 1.084) scaleX(-1); margin-bottom: 3.4146px;"></div>

			<div class="sprite butterfly butterfly_angle butterfly_angle_lr" style="transform: scale3d(1.084, 1.084, 1.084); margin-bottom: 3.4146px;"></div>
			<div class="sprite butterfly butterfly_angle_1 butterfly_angle_1_lr" style="transform: scale3d(1.084, 1.084, 1.084); margin-bottom: 3.4146px;"></div>
			<div class="sprite butterfly butterfly_rooked butterfly_rooked_lr" style="transform: scale3d(1.084, 1.084, 1.084); margin-bottom: 3.4146px;"></div>
			<div class="sprite butterfly butterfly_side butterfly_side_lr" style="transform: scale3d(1.084, 1.084, 1.084); margin-bottom: 3.4146px;"></div>

			<div class="sprite butterfly butterfly_angle flipped butterfly_angle_rl bottom" style="transform: scale3d(1.084, 1.084, 1.084) scaleX(-1); margin-bottom: 3.4146px;"></div>
			<div class="sprite butterfly butterfly_angle_1 flipped butterfly_angle_1_rl bottom" style="transform: scale3d(1.084, 1.084, 1.084) scaleX(-1); margin-bottom: 3.4146px;"></div>
			<div class="sprite butterfly butterfly_rooked flipped butterfly_rooked_rl bottom" style="transform: scale3d(1.084, 1.084, 1.084) scaleX(-1); margin-bottom: 3.4146px;"></div>
			<div class="sprite butterfly butterfly_side flipped butterfly_side_rl bottom" style="transform: scale3d(1.084, 1.084, 1.084) scaleX(-1); margin-bottom: 3.4146px;"></div>
		
		</div>
	</div>

	<div class="card">
		<h1><i class="ts_icon ts_icon_warning mustard_yellow"></i>404</h1>
		<p>Page Not Found</p>
		<p>페이지가 없습니다. 다시 한번 확인해주세요</p>
	</div>

	<!-- output_js "core" -->
<script type="text/javascript" src="https://fst.slack-edge.com/4a39f/js/libs/jquery.js"></script>

	<!-- output_js "regular" -->
<script type="text/javascript" src="https://fst.slack-edge.com/b80b/js/TS.web._404.js"></script>

</body>
</html>