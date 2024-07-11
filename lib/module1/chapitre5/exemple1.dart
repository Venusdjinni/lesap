import 'package:lesap/module1/chapitre4/classes.dart';

void main() {
  preparerPizza();
  preparerOmelette();
  preparerSteak();
}

Pizza preparerPizza() {
  print("La pizza est prête");
  return const Pizza();
}

Omelette preparerOmelette() {
  print("L'omelette est prête!");
  return const Omelette();
}

Steak preparerSteak() {
  print("Le steak est prêt!");
  return const Steak();
}