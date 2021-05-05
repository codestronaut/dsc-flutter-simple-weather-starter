class Weather {
  final int id;
  final String city;
  final double temperature;
  final double wind;
  final int humidity;

  Weather({
    this.id,
    this.city,
    this.temperature,
    this.wind,
    this.humidity,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: json['weather'][0]['id'],
      city: json['name'],
      temperature: json['main']['temp'],
      wind: json['wind']['speed'],
      humidity: json['main']['humidity'],
    );
  }
}
