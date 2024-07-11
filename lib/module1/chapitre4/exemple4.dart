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

  Personne(this.nom, this._age) {
    ajouterPersonne();
  }

  Personne.anonyme() : nom = null, _age = null {
    ajouterPersonne();
  }

  // méthode d'instance. Modifie l'attribut
  void augmenterAge() {
    if (_age != null) {
      // compare l'âge de l'instance avec la valeur statique
      if (_age! < _ageMax) {
        _age = _age! + 1;
      }
    }
  }

  String description() {
    if (nom == null) {
      return "Cette personne est anonyme";
    } else {
      return "$nom a ${_age!} ans";
    }
  }
}

void main() {
  Personne alain = Personne("Alain", 30);
  Personne ano = Personne.anonyme();

  print(alain.description());
  print(ano.description());
}