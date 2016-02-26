$(document).ready(function() {
  console.log(requestUrl);

  var owmEndpoint = "http://api.openweathermap.org/data/2.5/forecast/daily"

  var apiKey = "6dc13aa2cad9e1387de732b0a5cf5052"
  var cityId = "5378538";
  var units = "imperial";
  var mode = "json";
  // prob need some logic here to get right day
  // counts for sat / sun
  // add right day number [...]["list"][DAYNUM]
  var count = 8;
  // contruct request
  var requestUrl = owmEndpoint + "?";
  requestUrl += "id=" + cityId;
  requestUrl += "&" + "appid=" + apiKey;
  requestUrl += "&" + "units=" + units;
  requestUrl += "&" + "mode=" + mode;
  requestUrl += "&" + "cnt=" + count;

  var satReport = [];
  var sunReport = [];
  // jquery ajax parse
  $.get(requestUrl, function(response){
    console.log(response)
    // sat api info
    satReport.push(response);
    var satDateString = satReport["0"]["list"]["4"].dt
    var satDate = new Date(satDateString * 1000);
    console.log("day:" + satDate)
    var satDescription = satReport["0"]["list"]["4"]["weather"]["0"].description
    var satDayTemp = satReport["0"]["list"]["4"]["temp"].day;
    var satWeatherId = satReport["0"]["list"]["4"]["weather"]["0"].id
    var satWeatherIdClass = "wi wi-owm-" + satWeatherId;

    // sat DOM
    $("#sat-weather-icon-id").addClass(satWeatherIdClass);
    $("#sat-desciption").text(satDescription)
    $("#sat-temp").text(satDayTemp + "\xB0")
    $("#sat-weather-icon-id").addClass("wi wi-owm-" + satWeatherId)
    
    // sun api info
    sunReport.push(response);
    var sunDateString = sunReport["0"]["list"]["5"].dt
    var sunDate = new Date(sunDateString * 1000);
    console.log("day:" + sunDate)
    var sunDescription = sunReport["0"]["list"]["5"]["weather"]["0"].description
    var sunDayTemp = sunReport["0"]["list"]["5"]["temp"].day;
    var sunWeatherId = sunReport["0"]["list"]["5"]["weather"]["0"].id
    var satWeatherIdClass = "wi wi-owm-" + satWeatherId;
    // sun DOM
    $("#sun-weather-icon-id").addClass(satWeatherIdClass);
    $("#sun-desciption").text(satDescription)
    $("#sun-temp").text(sunDayTemp + "\xB0" )
    ("#sut-weather-icon-id").addClass("wi wi-owm-" + sutWeatherId)

    console.log(satWeatherId)
    console.log(sunWeatherId)
  });
  
  // votes. need to render with erb from db
  var satVoteCount = 0;
  var sunVoteCount = 0;

  $satVoteScore =  $("#sat-vote-score")
  $("#sat-vote-btn").on("click", function(){
    satVoteCount += 1;
    console.log(satVoteCount)
    $satVoteScore.text(satVoteCount);
  })

  $sunVoteScore =  $("#sun-vote-score")
  $("#sun-vote-btn").on("click", function(){
    sunVoteCount += 1;
    console.log(sunVoteCount)
    $sunVoteScore.text(sunVoteCount);
  })

});


