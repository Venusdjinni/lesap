import 'package:lesap/module1/chapitre4/classes.dart';

Future<void> appreterIngredients() {
  throw Exception("Plus d'oeufs dans le frigo!");
}

Future<void> melanger() async {
  await Future.delayed(Duration(seconds: 1));
  print('On découpe et mélange tous les ingrédients');
}

Future<void> frire() async {
  await Future.delayed(Duration(seconds: 1));
  print('Notre mélange passe à la poêle!');
}

Future<Omelette> preparerOmelette() async {
  await appreterIngredients();
  await melanger();
  await frire();
  return const Omelette();
}

void main() {
  preparerOmelette().then(
    (omelette) {
      print('Et une omelette servie!');
    },
    onError: (error, trace) {
      print("Le chef ne peut pas faire d'omelette aujourd'hui: $error");
      print("Que s'est-il passé?:\n$trace");
    }
  );
}