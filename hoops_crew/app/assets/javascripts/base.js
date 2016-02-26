$(document).ready(function() {
  console.log(requestUrl);

  var satNumInArray;
  var sunNumInArray;

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


  // get correct weekend day from api array
  var dayOfWeek = new Date().getDay(); 
  console.log(dayOfWeek);

  function getWeekendDayNums (dayNum) {
    if (dayNum === 1) {
        satNumInArray = "8";
        sunNumInArray = "0"
      } else if (dayNum === 2) {
        satNumInArray = "0";
        sunNumInArray = "1";
      }else if (dayNum === 3) {
        satNumInArray = "1";
        sunNumInArray = "2";
      }else if (dayNum === 4) {
        satNumInArray = "2";
        sunNumInArray = "3";
      } else if (dayNum === 5) {
        satNumInArray = "3";
        sunNumInArray = "4";
      } else if (dayNum === 6) {
        satNumInArray = "4";
        sunNumInArray = "5";
      } else if (dayNum === 7) {
        satNumInArray = "5";
        sunNumInArray = "6";
      }
  }

  getWeekendDayNums(dayOfWeek)


  var satReport = [];
  var sunReport = [];
  // jquery ajax parse
  $.get(requestUrl, function(response){
    console.log(response)
    // sat api info
    satReport.push(response);
    var satDateString = satReport["0"]["list"][satNumInArray].dt
    var satDate = new Date(satDateString * 1000);
    console.log("day:" + satDate)
    var satDescription = satReport["0"]["list"][satNumInArray]["weather"]["0"].description
    var satDayTemp = satReport["0"]["list"][satNumInArray]["temp"].day;
    var satWeatherId = satReport["0"]["list"][satNumInArray]["weather"]["0"].id
    var satWeatherIdClass = "wi wi-owm-" + satWeatherId;

    // sat DOM
    $("#sat-weather-icon-id").addClass(satWeatherIdClass);
    $("#sat-desciption").text(satDescription)
    $("#sat-temp").text(satDayTemp + "\xB0")
    $("#sat-weather-icon-id").addClass("wi wi-owm-" + satWeatherId)
    
    // sun api info
    sunReport.push(response);
    var sunDateString = sunReport["0"]["list"][sunNumInArray].dt
    var sunDate = new Date(sunDateString * 1000);
    console.log("day:" + sunDate)
    var sunDescription = sunReport["0"]["list"][sunNumInArray]["weather"]["0"].description
    var sunDayTemp = sunReport["0"]["list"][sunNumInArray]["temp"].day;
    var sunWeatherId = sunReport["0"]["list"][sunNumInArray]["weather"]["0"].id
    var sunWeatherIdClass = "wi wi-owm-" + satWeatherId;
    // sun DOM
    $("#sun-weather-icon-id").addClass(sunWeatherIdClass);
    $("#sun-desciption").text(sunDescription)
    $("#sun-temp").text(sunDayTemp + "\xB0" )
    $("#sun-weather-icon-id").addClass("wi wi-owm-" + sunWeatherId)

    // console.log(satWeatherId)
    // console.log(sunWeatherId)

    var satDateString0 = satReport["0"]["list"]["1"].dt * 1000;
    var satDateString2 = satReport["0"]["list"]["2"].dt * 1000;
    var satDateString3 = satReport["0"]["list"]["3"].dt * 1000;
    var satDateString4 = satReport["0"]["list"]["4"].dt * 1000;




    var currentLinuxTime = new Date()
    // var currentDay = currentLinuxTime * 1000

    if (typeof currentLinuxTime == "string") {console.log("its is a string")}

    // console.log(currentLinuxTime).toString();

    // var checkDay = currentLinuxTime.match(/thu/)
    // console.log(checkDay)

    



   
    // naive appraoch

    // var dayNum = []
    // var saturay = dayNum[0]
    // var sunday = dayNum[1]

    // var satReportList = satReport["0"]["list"];

    // console.log(satReportList);

    // function getWeekendDayNums(reportList) {
    //   for (i=0; i < reportList.length; i++) {
    //     var dayLinuxTime = reportList[i].dt
    //     var dayString = new Date(dayLinuxTime * 1000)
    //     console.log(dayString)
    //     if (dayString.match(/sat/) || dayString.match(/sun/g)) {
    //       dayNum.push(dayString);
    //     }
    //   }
    // }

    // getWeekendDayNums(satReportList)









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


