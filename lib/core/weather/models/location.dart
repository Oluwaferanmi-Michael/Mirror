import 'package:mirror/core/weather/constants/weather_response_constants.dart';

class Location {
  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;
  final String timeZone;
  final String localTime;

  const Location.none()
      : name = '',
        region = '',
        country = '',
        lat = 0,
        lon = 0,
        timeZone = '',
        localTime = '';

  @override
  String toString() =>
      'name: $name, region: $region, country: $country, lat: $lat, lon: $lon, time zone: $timeZone, local time: $localTime';

  Location.fromLocation({required Map<String, dynamic> json})
      : name = json[WeatherResponseConstants.name],
        region = json[WeatherResponseConstants.region],
        country = json[WeatherResponseConstants.country],
        lat = json[WeatherResponseConstants.lat],
        lon = json[WeatherResponseConstants.lon],
        timeZone = json[WeatherResponseConstants.timeZone],
        localTime = json[WeatherResponseConstants.localTime];
}

class Current {
  final double tempC;
  final double tempF;
  final int isDay;
  final Map<String, dynamic> condition;
  final int cloud;
  final double feelsLikeC;
  final double uv;

  Current.none()
      : tempC = 0,
        tempF = 0,
        isDay = 0,
        condition = {},
        cloud = 0,
        feelsLikeC = 0,
        uv = 0;

  @override
  String toString() =>
      ' tempC: $tempC, tempF: $tempF, isDay: $isDay, condition: $condition, cloud: $cloud, feelsLikeC: $feelsLikeC, uv: $uv';

  Current.fromCurrent({required Map<String, dynamic> json})
      : tempC = json[WeatherResponseConstants.tempC],
        tempF = json[WeatherResponseConstants.tempF],
        isDay = json[WeatherResponseConstants.isDay],
        condition = json[WeatherResponseConstants.condition],
        cloud = json[WeatherResponseConstants.cloud],
        feelsLikeC = json[WeatherResponseConstants.feelsLikeC],
        uv = json[WeatherResponseConstants.uv];
}

//
class Forecast {
  final List<ForecastData> forecastDay;

  @override
  String toString() =>
      'forecast day: ${forecastDay.map((element) => element.toString())}';

  Forecast.none() : forecastDay = [];

  Forecast.fromForecast({required Map<String, dynamic> forecast})
      : forecastDay = [
          ...forecast[WeatherResponseConstants.forecastDay]
              .map((data) => ForecastData.fromForecastData(forecastData: data))
        ];
}

//
class ForecastData {
  final String date;
  final Day day;
  // final List<HourData> hour;

  @override
  String toString() => 'date: $date day: $day';

  ForecastData.none()
      : date = '',
        day = Day.none();
  // hour = [];

  ForecastData.fromForecastData({
    required Map<String, dynamic> forecastData,
  })  : date = forecastData[WeatherResponseConstants.date],
        day = Day.fromDay(day: forecastData[WeatherResponseConstants.day]);
  // hour = [
  //   ...forecastData[WeatherResponseConstants.hour]
  //       .map((hours) => HourData.fromHour(hours: hours))
  // ];
}

//
class Day {
  final double maxTempC;
  final double minTempC;
  final double avgTempC;
  final double totalPrecipIn;
  final double totalSnowCm;
  final int dailyChanceofRain;
  final int dailyChanceofSnow;
  final Condition condition;
  final double uv;

  @override
  String toString() =>
      'maxTempC: $maxTempC, minTempC: $minTempC, avgTempC: $avgTempC, totalPrecipIn: $totalPrecipIn, totalSnowCm: $totalSnowCm, dailyChanceofRain: $dailyChanceofRain, dailyChanceofSnow: $dailyChanceofSnow, condition: $condition, uv: $uv';

  Day.none()
      : maxTempC = 0,
        minTempC = 0,
        avgTempC = 0,
        totalPrecipIn = 0,
        totalSnowCm = 0,
        dailyChanceofRain = 0,
        dailyChanceofSnow = 0,
        condition = const Condition.none(),
        uv = 0;

  Day.fromDay({required Map<String, dynamic> day})
      : maxTempC = day[WeatherResponseConstants.maxTempC],
        minTempC = day[WeatherResponseConstants.minTempC],
        avgTempC = day[WeatherResponseConstants.avgTempC],
        totalPrecipIn = day[WeatherResponseConstants.totalPrecipIn],
        totalSnowCm = day[WeatherResponseConstants.totalSnowCm],
        dailyChanceofRain = day[WeatherResponseConstants.dailyChanceOfRain],
        dailyChanceofSnow = day[WeatherResponseConstants.dailyChanceOfSnow],
        condition = Condition.fromCondition(
            condition: day[WeatherResponseConstants.condition]),
        uv = day[WeatherResponseConstants.uv];
}

class HourData {
  final Condition condition;

  @override
  String toString() => 'conditions: $condition';

  HourData.none() : condition = const Condition.none();

  HourData.fromHour({required Map<String, dynamic> hours})
      : condition = Condition.fromCondition(
            condition: hours[WeatherResponseConstants.condition]);
}

class Condition {
  final String? text;
  final String? icon;
  final int? code;

  @override
  String toString() => 'text: $text icon: $icon code: $code';

  const Condition.none()
      : text = '',
        icon = '',
        code = 0;

  Condition.fromCondition({required Map<String, dynamic> condition})
      : text = condition[WeatherResponseConstants.text] ?? '',
        icon = condition[WeatherResponseConstants.icon] ?? '',
        code = condition[WeatherResponseConstants.code] ?? 0;
}
