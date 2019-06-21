import 'Avenger.dart';
import './CaptainAmerica.dart';

const List<String> urlAvengers = [
  'https://blogspotscraping.herokuapp.com/avengers/Thor.json',
  'https://blogspotscraping.herokuapp.com/avengers/Thanos.json',
  'https://blogspotscraping.herokuapp.com/avengers/CaptainAmerica.json',
];

void createAvengers() {
  for (final url in urlAvengers) {
    Avengers.fetchAvenger(url).then((avengers) {
      String type = Avengers.getFileNameFromUrl(url);
      String name = avengers["Avenger"]["name"];
      String sexual = avengers["Avenger"]["sexual"];
      Avenger avenger = Avenger(type: type, name: name, sexual: sexual);
      avenger.showInfo();
      //createAvengers();
      //Avengers.fetchAvenger(url);
    }).catchError((error) {
      print("Error");
    });
  }
}

void main() {
  print(
      '============ L11.2 - Call Default Factory Constructor Orderly ============');
  createAvengers();

// todo
  print('============ L11.1 - Named factory constructor ============');
  CaptainAmerica captainAmerica = Avenger.fromURL(urlAvengers[2]);
// todo
}
