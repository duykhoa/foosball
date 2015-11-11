$(document).ready(function(){

  new Chartist.Bar('.ct-chart', teamData, {
    distributeSeries: true
  });
})
