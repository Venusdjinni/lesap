import 'package:lesap/module1/chapitre4/classes.dart';

void main() {
  preparerPizza();
  preparerOmelette();
  preparerSteak();
}

Future<Pizza> preparerPizza() {
  print("Commencer la pizza");
  return Future.delayed(
    Duration(seconds: 10),
        () {
      print("La pizza est prête!");
      return const Pizza();
    },
  );
}

Future<Omelette> preparerOmelette() {
  print("Commencer l'omelette");
  return Future.delayed(
    Duration(seconds: 3),
        () {
      print("L'omelette est prête!");
      return const Omelette();
    },
  );
}

Future<Steak> preparerSteak() {
  print("Commencer le steak");
  return Future.delayed(
    Duration(seconds: 20),
        () {
      print("Le steak est prêt!");
      return const Steak();
    },
  );
}