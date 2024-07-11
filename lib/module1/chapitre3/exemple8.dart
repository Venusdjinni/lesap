void main() {
  // première boucle
  int nombreOeufs = 5;
  for (int i = 0; i < nombreOeufs; i++) {
    print("je cuis l'oeuf numéro ${i + 1}");
  }

  // deuxième boucle
  List clients = ["Alain", "Marie", "Nicole", "Pierre"];
  for (String client in clients) {
    print("$client, veuillez acepter ce verre d'eau");
  }
}