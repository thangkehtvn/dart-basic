import 'CaptainAmerica.dart';
import 'Thanos.dart';
import 'Thor.dart';
import 'dart:convert' as JSON;
import 'package:http/http.dart' as http;

abstract class Avenger {
  String name;
  String sexual;
  Avenger.forExtendConstructor(
      {String name = "Avenger", String sexual = "Unkown"}) {
    this.name = name;
    this.sexual = sexual;
  }

  void showInfo() {
    print('------ Info ------');
    print('Name: $name');
    print('Sexual: $sexual');
  }

  factory Avenger(
      {String type, String name = "Avenger", String sexual = "Unkown"}) {
    dynamic avenger;
    switch (type) {
      case Avengers.Thanos:
        avenger = Thanos(name: name, sexual: sexual);
        break;
      case Avengers.Thor:
        avenger = Thor(name: name, sexual: sexual);
        break;
      case Avengers.CaptainAmerica:
        avenger = CaptainAmerica(name: name, sexual: sexual);
        break;
    }
    return avenger;
  }

  factory Avenger.fromURL(String url) {
    String type = Avengers.getFileNameFromUrl(url);
    Avenger avenger;
    Avengers.fetchAvenger(url).then((responseJson) {
      String name = responseJson["Avenger"]["name"];
      String sexual = responseJson["Avenger"]["sexual"];
      switch (type) {
        case "Thanos":
          avenger = Thanos(name: name, sexual: sexual);
          break;
        case "Thor":
          avenger = Thor(name: name, sexual: sexual);
          break;
        case "CaptainAmerica":
          avenger = CaptainAmerica(name: name, sexual: sexual);
          break;
      }
      avenger.showInfo();
      return avenger;
    });
    return null;
  }
  void doSkill();
}

class Avengers {
  static const String Thanos = 'Thanos';
  static const String CaptainAmerica = 'Captain America';
  static const String Thor = 'Thor';
  static dynamic getFileNameFromUrl(String url) {
    List<String> l = url.split("\/");
    return l[4].split("\.")[0];
  }

  static Future<dynamic> fetchAvenger(String url) async {
    return await http
        .get(
      url,
    )
        .then((http.Response response) {
      String res = response.body;
      int statusCode = response.statusCode;
      //print("API Response: " + res);
      if (statusCode < 200 || statusCode > 400) {
        res = "{\"status\":" +
            statusCode.toString() +
            ",\"message\":\"error\",\"response\":" +
            res +
            "}";
        throw new Exception(statusCode);
      }
      return JSON.jsonDecode((response.body));
    });
  }
}
