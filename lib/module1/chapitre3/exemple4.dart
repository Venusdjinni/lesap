void main() {
  int? nombreOeufs; // nombreOeufs est null
  String texteOeufs = nombreOeufs == null
    ? "Il faut ouvrir le frigo pour connaître le nombre d'oeufs"
    : "Il y a $nombreOeufs dans le frigo";

  // ouvre le frigo et compte...

  nombreOeufs = 4;
}