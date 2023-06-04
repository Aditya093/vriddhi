String getWeatherIcon(int condition)
{
  String rootPath="assets/images/weather/";

  String extension=".json";

  if (condition < 300)
  {
    return rootPath+'Weather_ThunderStorm'+extension;
  }
  else if (condition < 600)
  {
    return rootPath+'Weather_Rainy'+extension;;
  }
  else if (condition < 700)
  {

    return rootPath+'Weather_SnowStorm'+extension;
  }
  else if (condition < 800)
  {
    return rootPath+'Weather_SunnyCloud'+extension;
  }
  else if (condition == 800)
  {
    return rootPath+'Weather_Sunny'+extension;
  }
  else if (condition <= 804)
  {
    return rootPath+'Weather_Cloudy'+extension;
  }
  else
  {
    return rootPath+'Weather_Night'+extension;
  }
}