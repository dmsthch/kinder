<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<meta charset="utf-8">
	<title>Title</title>
	
	<!-- CSS Link -->
	<c:import url="../module/importCSS.jsp"></c:import>
	<!-- JS Link -->
	<c:import url="../module/importJS.jsp"></c:import>
	
	<!-- sidevar 색칠하기 -->
	<script src="js/KHS/hsCustom.js"></script>
	
	<!-- 달력 css -->
	<link rel="stylesheet" type="text/css" href="css/KHS/Calendar.css" />
	<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Lato:300,400,700">
	
	
	<style type="text/css">
		h6 {
			color : black;
		}
	</style>
	
	<script>
		$(document).ready(function(e){
			
			//검색창에서 카테고리 버튼
		    $('.search-panel .dropdown-menu').find('a').click(function(e) {
				e.preventDefault();
				var param = $(this).attr("href").replace("#",""); //해당 버튼의 href속성에서 #을 제거한 값
				var concept = $(this).text(); //해당 버튼의 내용
				
				$('.search-panel span#search_concept').text(concept); //선택 버튼의 내용을 클릭한 버튼의 내용으로 변경
				$('.input-group #search_param').val(param);
			});
			
			//사이드바 active속성 주기
		    setSidenavActive(4);
		    
		    
		});
	</script>
	
</head>

<body class="container-fluid">


<!-- navbar -->
<c:import url="../module/navbar.jsp"></c:import>


<div class="wrapper">
	
	<!-- sideNav -->
    <c:import url="../module/KHS/CommuteSideNav.jsp"></c:import>

    <div class="main-panel">
    
		<div class="content">
			<div class="container-fluid">
			
				<div class="row">
					<div class="text-center"><h1>월별 출석 현황</h1></div>
				</div><br/>
				
				<div class="row">
					<div class="calendar col-sm-12">
						<header>		
							<h2>September</h2>
							<a class="btn-prev fontawesome-angle-left" href="#"></a>
							<a class="btn-next fontawesome-angle-right" href="#"></a>
						</header>
						<table>
							<thead>
								<tr>
									<td>Mo</td>
									<td>Tu</td>
									<td>We</td>
									<td>Th</td>
									<td>Fr</td>
									<td>Sa</td>
									<td>Su</td>
								</tr>
							</thead>
			
							<tbody>
								<tr>
									<td class="prev-month">26</td>
									<td class="prev-month">27</td>
									<td class="prev-month">28</td>
									<td class="prev-month">29</td>
									<td class="prev-month">30</td>
									<td class="prev-month">31</td>
									<td>1</td>
								</tr>
								<tr>
									<td>2</td>
									<td>3</td>
									<td>4</td>
									<td>5</td>
									<td>6</td>
									<td>7</td>
									<td>8</td>
								</tr>
								<tr>
									<td>9</td>
									<td class="event">10</td>
									<td>11</td>
									<td>12</td>
									<td>13</td>
									<td>14</td>
									<td>15</td>
								</tr>
								<tr>
									<td>16</td>
									<td>17</td>
									<td>18</td>
									<td>19</td>
									<td>20</td>
									<td class="event">21</td>
									<td>22</td>
								</tr>
								<tr>
									<td class="current-day event">23</td>
									<td>24</td>
									<td>25</td>
									<td>26</td>
									<td>27</td>
									<td>28</td>
									<td>29</td>
								</tr>
								<tr>
									<td>30</td>
									<td class="next-month">1</td>
									<td class="next-month">2</td>
									<td class="next-month">3</td>
									<td class="next-month">4</td>
									<td class="next-month">5</td>
									<td class="next-month">6</td>
								</tr>
							</tbody>
						</table>
					</div> <!-- end calendar -->
				</div> <!-- end container -->
							
				
			</div>
		</div>
			
			
	</div>
</div>

</body>
</html>