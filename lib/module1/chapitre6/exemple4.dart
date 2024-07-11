import 'package:lesap/module1/chapitre4/classes.dart';

class IngredientException implements Exception {
  final String ingredient;

  IngredientException(this.ingredient);

  @override
  String toString() {
    return 'Ingrédient manquant: $ingredient';
  }
}

class FourException implements Exception {}

Future<Pizza> preparerPizza() async {
  print("Commencer la pizza");

  try {
    await appreterIngredients();
    await melangerIngredients();
    await cuireAuFour();
    return const Pizza();
  } on IngredientException catch (error) {
    print("Il manque un ingrédient: ${error.ingredient}");
    throw Exception("Impossible de préparer une pizza");
  } on FourException catch (error) {
    print("Le four n'est pas opérationnel");
    throw Exception("Impossible de préparer une pizza");
  } catch (error) {
    print("Une erreur inconnue est survenue");
    throw Exception("Impossible de préparer une pizza");
  } finally {
    await nettoyer();
  }
}

Future<void> appreterIngredients() async {
  bool farineDisponible = true;
  bool tomatesDisponible = true;
  bool fromageDisponible = false;
  bool jambonDisponible = true;

  // vérifie si les ingrédients sont disponibles
  if (!farineDisponible) throw IngredientException("farine");
  if (!tomatesDisponible) throw IngredientException("tomates");
  if (!fromageDisponible) throw IngredientException("fromage");
  if (!jambonDisponible) throw IngredientException("jambon");

  await Future.delayed(Duration(seconds: 1));
  print('Ingrédients apprêtés: farine, tomates, fromage, jambon, etc...');
}

Future<void> melangerIngredients() async {
  throw Exception("Aucun ustensile pour mélanger les ingrédients!");
}

Future<void> cuireAuFour() async {
  bool fourEnMarche = false;

  if (fourEnMarche) {
    print('Pizza en cours de cuisson');
    await Future.delayed(Duration(seconds: 2));
  } else {
    throw FourException();
  }
}

Future<void> nettoyer() async {
  await Future.delayed(Duration(seconds: 2));
  print("Le plan de travail a été néttoyé");
}

void main() {
  preparerPizza();
}