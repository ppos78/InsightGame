<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>전체게시판/스트리머게시판 게시글수</title>
<script src='js/moment.min.js'></script>
<script src='js/Chart.js'></script>
<script src='js/utils.js'></script>
<style>
		canvas {
			-moz-user-select: none;
			-webkit-user-select: none;
			-ms-user-select: none;
		}
	</style>
</head>

<body>
	<div style="width:1000px">
		<canvas id="chart1"></canvas>
	</div>
	
	<script>
		function randomNumber(min, max) {
			return Math.random() * (max - min) + min;
		}

		function randomBar(date, lastClose) {
			var open = randomNumber(lastClose * .95, lastClose * 1.05);
			var close = randomNumber(open * .95, open * 1.05);
			var high = randomNumber(Math.max(open, close), Math.max(open, close) * 1.1);
			var low = randomNumber(Math.min(open, close) * .9, Math.min(open, close));
			return {
				t: date.valueOf(),
				y: close
			};
		}

		var dateFormat = 'MMMM DD YYYY';
		var date = moment('December 01 2017', dateFormat);
		var data = [randomBar(date, 30)];
		var labels = [date];
		while (data.length < 58) {
			date = date.clone().add(1, 'd');
			if (date.isoWeekday() <= 5) {
				data.push(randomBar(date, data[data.length - 1].y));
				labels.push(date);
			}
		}

		var ctx = document.getElementById("chart1").getContext("2d");
		ctx.canvas.width = 1000;
		ctx.canvas.height = 300;
		var cfg = {
			type: 'bar',
			data: {
				labels: labels,
				datasets: [{
					label: "스트리머 게시판 게시글 차트",
					data: data,
					type: 'line',
					pointRadius: 0,
					fill: false,
					lineTension: 0,
					borderWidth: 2
				}]
			},
			options: {
				scales: {
					xAxes: [{
						type: 'time',
						distribution: 'series',
						ticks: {
							source: 'labels'
						}
					}],
					yAxes: [{
						scaleLabel: {
							display: true,
							labelString: '게시글 수'
						}
					}]
				}
			}
		};
		var chart = new Chart(ctx, cfg);
		
		document.getElementById('update').addEventListener('click', function() {
			var type = document.getElementById('type').value;
 			chart.config.data.datasets[0].type = type;
			chart.update();
		});


		

	</script>
</body>

</html>