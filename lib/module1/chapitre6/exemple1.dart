import 'package:lesap/module1/chapitre4/classes.dart';

Future<Pizza> preparerPizza() async {
  print("Commencer la pizza");

  await appreterIngredients();
  await melangerIngredients();
  await cuireAuFour();
  await nettoyer();

  return const Pizza();
}

Future<void> appreterIngredients() async {
  await Future.delayed(Duration(seconds: 1));
  print('Ingrédients apprêtés: farine, tomates, fromage, jambon, etc...');
}

Future<void> melangerIngredients() async {
  throw Exception("Aucun ustensile pour mélanger les ingrédients!");
}

Future<void> cuireAuFour() async {
  print('Pizza en cours de cuisson');
  await Future.delayed(Duration(seconds: 2));
}

Future<void> nettoyer() async {
  await Future.delayed(Duration(seconds: 2));
  print("Le plan de travail a été néttoyé");
}

void main() {
  preparerPizza();
}
