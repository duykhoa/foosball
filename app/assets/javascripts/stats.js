$(document).ready(function(){

  if ($('.ct-chart').length) {
    new Chartist.Bar('.ct-chart', teamData, {
      distributeSeries: true
    });
  }
})
