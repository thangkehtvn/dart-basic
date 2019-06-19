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
  void showInfo(var a) {
    print('------ Info ------');
    print('Name: ${a["Avenger"]["name"]}');
    print('Sexual: ${a["Avenger"]["sexual"]}');
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
    dynamic avenger;
    var name ;
    var sexual;
    switch (type) {
      case "Thor":
        avenger = Thor(name: name, sexual: sexual);
        break;
      case "Thanos":
        avenger = Thanos(name: name, sexual: sexual);
        break;
      case "CaptainAmerica":
        avenger = CaptainAmerica(name: name, sexual: sexual);
        break;
    }
    // Avengers.fetchAvenger(url).then((data) {
    //   var name = data["Avenger"]["name"];
    //   var sexual = data["Avenger"]["sexual"];
    //   switch (type) {
    //     case "Thor":
    //       avenger = Thor(name: name,sexual: sexual);
    //       break;
    //     case "Thanos":
    //       avenger = Thanos(name: name,sexual: sexual);
    //       break;
    //     case "CaptainAmerica":
    //       avenger = CaptainAmerica(name: name,sexual: sexual);
    //       break;
    //   }
    //   avenger.showInfo();
    // });
    return avenger;
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

  // static Future<dynamic> fetchAvenger(String url) async {
  //   try {
  //     final response = await http.get(url);
  //     if (response.statusCode == 200) {
  //       // If server returns an OK response, parse the JSON
  //       return JSON.jsonDecode((response.body));
  //     } else {
  //       // If that response was not OK, throw an error.
  //       print('Failed to load post');
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}
