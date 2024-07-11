class Personne {
  final String? nom;

  Personne(this.nom);

  Personne.anonyme() : nom = null;
}

void main() {
  Personne alain = Personne("Alain");
  Personne ano = Personne.anonyme();
}