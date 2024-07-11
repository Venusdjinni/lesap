void main() {
  // paramètres basiques
  void fonctionA(int param1, int param2, int param3) {}

  // paramètres positionnés optionnels. Déclarés dans []
  void fonctionB(int param1, [int? param2, int param3 = 5]) {}

  // paramètres positionnés nommés. Déclarés dans {}
  void fonctionC(int param1, {required int param2, int? param3 = 6}) {}

  // obligé de définir les trois paramètres
  fonctionA(10, 8, 20);

  // les paramètres 2 et 3 sont optionnels
  // c'est la même chose que fonctionB(1, null, 5);
  fonctionB(10);
  // on donne une valeur à param2 mais param3 reste à sa valeur par défaut
  fonctionB(10, 14);
  // on est obligé de définir param2 si on veut changer param3, parce que
  // l'ordre des paramètres est fixé
  fonctionB(3, null, 66);

  // on définit param2 en donnant son nom. param2 est obligatoire à cause du
  // mot-clé "required"
  fonctionC(1, param2: 4);
  // l'ordre n'est pas important pour les paramètres nommés
  fonctionC(1, param3: 26, param2: 7);
}