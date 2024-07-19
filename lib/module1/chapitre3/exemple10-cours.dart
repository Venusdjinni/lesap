void main() {
  saluerClient(nom: "Youssouf", portions:  4, commande: "Pizza");
  saluerClient(commande: "Omelette", nom: "Débora");
  saluerClient(nom: "Cédric");
}

void saluerClient({required String nom, String? commande, int portions = 1}) {
  if (commande == null) {
    print("Bonjour, $nom. Prenez un verre d'eau.");
  } else {
    print("Bonjour, $nom. Votre $commande est en cours pour $portions personnes.");
  }
}