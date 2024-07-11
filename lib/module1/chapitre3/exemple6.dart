void main() {
  String client = "Julie";

  if (client == "Alain") {
    print("Nous préparons le poulet pour Alain");
  } else if (client == "Marie") {
    print("La commande de Marie est le riz cuit");
  } else if (client == "Nicole") {
    print("Nous préparons la commande de Nicole: un poisson braisé");
  } else if (client == "Pierre") {
    print("Pierre a choisi une salade de fruits");
  } else {
    print("client inconnu");
  }

  switch (client) {
    case "Alain":
      print("Nous préparons le poulet pour Alain");
      break;
    case "Marie":
      print("La commande de Marie est le riz cuit");
      break;
    case "Nicole":
      print("Nous préparons la commande de Nicole: un poisson braisé");
      break;
    case "Pierre":
      print("Pierre a choisi une salade de fruits");
      break;
    default:
      print("client inconnu");
      break;
  }
}