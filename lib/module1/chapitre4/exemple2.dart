class Personne {
  // attribut statique, lié à la classe
  static int nombrePersonnes = 0;

  static void ajouterPersonne() {
    // les méthodes statiques ne manipulent que les attributs classiques
    nombrePersonnes++;
  }

  // attribut statique et privé
  static final _ageMax = 100;

  // attribut fixe. Une fois défini il ne changera plus
  final String? nom;
  // attribut privé. On ne peut pas y accéder hors de la classe
  int? _age;

  Personne(this.nom) {
    print("La personne $nom vient d'être créée");
  }
}

void main() {
  Personne alain = Personne("Alain");
}