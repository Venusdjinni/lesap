import 'dart:math';

Stream<String> obtenirCommandes() async* {
  final menu = ['Pizza', 'Omelette', 'Steak'];

  for (int i = 0; i < 10; i++) {
    await Future.delayed(Duration(seconds: Random().nextInt(5) + 1));
    yield menu[Random().nextInt(menu.length)];
  }
}

void main() {
  Stream<String> commandes = obtenirCommandes();

  commandes.listen((plat) {
    print("Un client a commandé le plat: $plat");
  });
}