            

 // chart colors
 var colors = ['red','skyblue','yellowgreen','#c3e6cb','#dc3545','#6c757d'];

 /* 3 donut charts */
 var donutOptions = {
   cutoutPercentage: 30, //도넛두께 : 값이 클수록 얇아짐
   legend: {position:'bottom', padding:5, labels: {pointStyle:'circle', usePointStyle:true}}
 };
 
 // donut 2
 var chDonutData2 = {
     labels: ['총 거래수', '채결 거래수', '대기수'],
     datasets: [
       {
         backgroundColor: colors.slice(0,3),
         borderWidth: 0,
         data: [100, 70, 30]
       }
     ]
 };
 var chDonut2 = document.getElementById("chDonut2");
   if (chDonut2) {
     new Chart(chDonut2, {
       type: 'pie',
       data: chDonutData2,
       options: donutOptions
   });
 }

