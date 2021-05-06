<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
   <script src="/bono/assets/js/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="/bono/assets/css/header.css" />
    <link rel="stylesheet" href="/bono/assets/css/mainPage.css" />
    
</head>
<body>

  <%@ include file="../common/header.jsp" %>

                   
    <!-- 전체 -->
    <div class="innerwrap">

        <!-- 위쪽 컨테이너 -->
        <div class="container-top"> 

            <!-- 일,월 매출 (차트)--> 
            <div class="chart-line">

                <!-- Select Box-->
                <div class="box">
                    <select id="select">
                        <option value="day">일 별</option>
                        <option value="month">월 별</option>
                    </select>
                </div>

                <!-- 일 매출 차트-->
                <div class="chart-day">
                	<canvas id="myChart" ></canvas>
                </div>

                <!-- 월 매출 차트 -->
                <div class="chart-month">
                    <canvas id="myChart2"></canvas>
            	</div>


            </div>
           
            <!-- top3 도넛차트 -->
            <div class="chart-pie">
                <div class="chart-rank">
                    <canvas id="myChart3"></canvas>
                </div>    
            </div>


        


        </div> 
        
            
        <!-- 아래쪽 컨테이너 -->
        <div class="container-bottom"> 

            <!-- 일,월 매출 (숫자)-->
            <div class="dash-card">

                <div class="day-card">
                    <div class="day-card-inner">
                        <div class="day-money">
                          <div class="day-earnings-text" >Earnings(Day)</div>
                          <div class="day-money-text">\1,300,000</div>
                        </div>
                        <div class="icon">
                          <i class="fa fa-krw" aria-hidden="true"    style=  "
        font-size: 160px;
        opacity: 0.3;
        margin-left: 25%;
        margin-top: 7%;
        color: rgba(0, 0, 255, 0.15); "> </i>
                        </div>
                    </div>    
                </div>  
                   
                <!-- 여백 -->
                <br />


                 <div class="month-card">
                    <div class="month-card-inner">
                         <div class="month-money">
                             <div class="month-earnings-text">Earnings(Month)</div>
                             <div class="month-money-text">\90,000,000</div>
                         </div>
                         <div class="icon">
                             <i class="fa fa-krw" aria-hidden="true"   style=  "
        font-size: 160px;
        opacity: 0.3;
        margin-left: 25%;
        margin-top: 7%;
        color: rgba(0, 0, 255, 0.15); "></i>
        
        <script>
        	$(function() {
        		$.ajax({
					url : "/bono/earn.mp",
					type : "post",
					success : function(data) {
					
						console.log(data);
						
						var $date = data[i].date;
						var $d_amount = data[i].amount;
						for(var i in data) {
							
						}
					
					}, error : function(error) {
						console.log("상품정보 에러발생");
					}
				});
        	});
        </script>
                         </div>
                    </div>     
                </div>
            </div>

            <!-- 메인페이지 발주 게시판-->
            <div class="order">
                <table class="order-table">
                   <thead>
                        <tr>
                            <th>No.</th>
                            <th>상품명</th>
                            <th>남은 수량</th>
                            <th>발주 신청</th>
                        </tr>
                    </thead>
                    <tbody>
                         <tr>
                             <td>1</td>
                             <td>ThinkPad X1 Carbon Gen 9</td>
                             <td>0</td>
                             <td><button onclick="">발주</button></td>
                         </tr>
                         <tr>
                             <td>2</td>
                             <td>갤럭시 북 Flex 알파 39.6 cm Core™ i7 / 1 TB SSD</td>
                             <td>1</td>
                             <td><button onclick="">발주</button></td>
                         </tr>
                         <tr>
                             <td>3</td>
                             <td>노트북 오디세이 39.6 cm Core™ i7 / 512 GB NVMe SSD</td>
                             <td>4</td>
                             <td><button onclick="">발주</button></td>
                         </tr>
                         <tr>
                             <td>4</td>
                             <td>갤럭시 북 S Wi-Fi 33.7 cm + 멀티 포트 어댑터(2019)</td>
                             <td>7</td>
                             <td><button onclick="">발주</button></td>
                         </tr>
                         <tr>
                             <td>5</td>
                             <td>갤럭시 북 S LTE 33.7 cm + 멀티 포트 어댑터(2019)</td>
                             <td>9</td>
                             <td><button onclick="">발주</button></td>
                         </tr>
                    </tbody>
                </table>
            </div>

        </div>
    </div>


<%@ include file="../common/footer.jsp" %>

<script>
    // select 일,월 
    $(document).ready(function() {
        $('#select').change(function(){
            var value = $('#select option:selected').val();
            if (value == "month"){
                $(".chart-month").show();
                $(".chart-day").hide();
               
            } else if (value == "day") {
                $(".chart-month").hide();
                $(".chart-day").show();
            } 
            
        });
    });


   
	// 일 별 매출액
	var ctx = document.getElementById('myChart').getContext('2d');
    var chart = new Chart(ctx, {

        type: 'line',

        data: {
            labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
            datasets: [{
                label: '일 별 매출액',
            	borderColor: 'rgba(0, 0, 237, 0.70)',
              	fill : false,
                data: [710000, 420000, 700000, 470000, 360000, 600000, 450000]
            }]
        },
		options: {
       		maintainAspectRatio : false,
            legend : {
                display : false
            },
            title : {
                display : true,
                text: '일 별 매출액',
                fontSize : 13
                
            },
            tooltips : {
                backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      titleMarginBottom: 10,
      titleFontColor: '#6e707e',
      titleFontSize: 14,
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      intersect: false,
      mode: 'index',
      caretPadding: 10,
      callbacks: {
        label: function(tooltipItem, chart) {
          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
          return datasetLabel + ': $' + number_format(tooltipItem.yLabel);
        }
      }
            }
            
         }
    });
    
    
    // 월별 차트
    $(function(){
		$.ajax({
			url : '/bono/chart.mo',
			type : 'get',
			success : function(result) {
				var ctx = document.getElementById('myChart2').getContext('2d');
			    var chart = new Chart(ctx, {

			        type: 'line',

			        data: {
			            labels: [result[0].month, result[1].month,
			            			result[2].month, result[3].month, 
			            			result[4].month],
			            datasets: [{
			                label: '월 별 매출액',
			                borderColor: 'rgba(0, 205, 226, 0.70)',
			              	fill : false,
			                data: [result[0].amount, result[1].amount,
			                			result[2].amount, result[3].amount,
			                			result[4].amount]
			            }]
			        },
			  		 options: {
			       		maintainAspectRatio : false ,
			            legend : {
			                display : false
			            },
			            title : {
			                display : true,
			                text: '월 별 매출액',
			                fontSize : 13
			                
			            },
			            tooltips : {
			                backgroundColor: "rgb(255,255,255)",
			      bodyFontColor: "#858796",
			      titleMarginBottom: 10,
			      titleFontColor: '#6e707e',
			      titleFontSize: 14,
			      borderColor: '#dddfeb',
			      borderWidth: 1,
			      xPadding: 15,
			      yPadding: 15,
			      displayColors: false,
			      intersect: false,
			      mode: 'index',
			      caretPadding: 10,
			      callbacks: {
			        label: function(tooltipItem, chart) {
			          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
			          return datasetLabel + ': $' + number_format(tooltipItem.yLabel);
			        }
			      }
			            }
			        }
			    });

			}
		});
	});
    
   

    // 도넛차트
    $(function(){ 
 	  	 $.ajax({
    		url : '/bono/chart.do',
    		type : 'get',
    		success : function(result) {
    			var ctx = document.getElementById('myChart3').getContext('2d');
    			 var chart = new Chart(ctx, {

    			        type: 'pie',

    			        data: {
    			            labels: [result[0].c_name, result[1].c_name, result[2].c_name],
    			            datasets: [{
    			                backgroundColor: ['yellow','rgba(200, 145, 255, 1)','blue',],
    			                data: [result[0].s_quan, result[1].s_quan, result[2].s_quan],
    			                borderWidth: 0
    			            }]
    			        },
    			  		 options: {
    			       		maintainAspectRatio : false,
    			            legend: {position:'bottom', padding:5, labels: {pointStyle:'circle', usePointStyle:true}},
    			            cutoutPercentage: 85,
    			            title : {
    			                display : false
    			            }
    			        }
    			    });
    		}
 	   })
    })
    
 
    Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
    Chart.defaults.global.defaultFontColor = '#858796';

    function number_format(number, decimals, dec_point, thousands_sep) {
      
      number = (number + '').replace(',', '').replace(' ', '');
      var n = !isFinite(+number) ? 0 : +number,
        prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
        sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
        dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
        s = '',
        toFixedFix = function(n, prec) {
          var k = Math.pow(10, prec);
          return '' + Math.round(n * k) / k;
        };
      
      s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
      if (s[0].length > 3) {
        s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
      }
      if ((s[1] || '').length < prec) {
        s[1] = s[1] || '';
        s[1] += new Array(prec - s[1].length + 1).join('0');
      }
      return s.join(dec);
    }
</script>

 
</body>
</html>