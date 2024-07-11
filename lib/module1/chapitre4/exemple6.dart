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

class Cuisinier extends Personne {
  Cuisinier(super.nom, super._age);

  void cuisiner(String plat) {
    print("${super.nom} prépare un plat de $plat");
  }

  @override
  String description() {
    return "${super.nom} a ${super._age} ans et est cuisinier";
  }
}

void main() {
  Cuisinier alain = Cuisinier("Alain", 30);
  Personne marie = Personne("Marie", 27);

  print(alain.description());
  print(marie.description());
}