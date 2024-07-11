void main() {
  String client = "Adam";
  bool adamEstClient = client == "Adam";

  if (adamEstClient) {
    // préparer sa commande
  }

  int nombreOeufs = 5;
  if (nombreOeufs >= 2) {
    // faire une omelette
    nombreOeufs -= 2;
  } else {
    // refaire le stock
    nombreOeufs += 10;
  }
}