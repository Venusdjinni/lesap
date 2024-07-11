void main() {
  int nombreOeufs = 4;
  double taillePizza = 60.5;
  String recetteDuJour = "omelette";
  List clients = ["Arthur", "Sabrina", "Raymond"];

  nombreOeufs -= 2; // deux préparés pour le client
  double rayonPizza = taillePizza / 2;
  double surfacePizza = 3.14 * rayonPizza * rayonPizza;

  String client1 = clients[0];
  String commande = "$recetteDuJour de $client1"; // même chose que
  // recette du jour + " de " + client1;
  String menuPizza = "Pizza de ${taillePizza / 2} cm de rayon"; // calcule
  // automatiquement le rayon et l'ajoute au texte
}