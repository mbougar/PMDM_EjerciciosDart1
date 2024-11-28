import 'dart:io';

void main() {
  Set<String> generosFavoritos = {};
  bool menuActivo = true;

  // Abrimos el menu con un bucle while
  while (menuActivo) {
    //mostrarMenu();
    print("\n╔═════════════════════════════════════════╗");
    print("║   Gestor de géneros musicales           ║");
    print("║                                         ║");
    print("║   1. Añadir un género musical           ║");
    print("║   2. Mostrar géneros favoritos          ║");
    print("║   3. Salir                              ║");
    print("╚═════════════════════════════════════════╝");
    // Usamos std.write para escribir sin saltar de
    stdout.write("Elige una opción: ");
    String? opcion = stdin.readLineSync();
    
    // Seleccionamos la opción que se ha seleccionado
    if (opcion == '1') {
      if (generosFavoritos.length >= 5) {
        print("\nERROR: Ya tienes 5 géneros favoritos.");
      } else {
        stdout.write("\nIntroduce el género musical: ");
        String? genero = stdin.readLineSync();

        // Tenemos que asegurarnos de que no sea null antes de que dart nos permita usar .isNotEmpty
        if (genero != null && genero.isNotEmpty) {
          if (generosFavoritos.contains(genero)) {
            print("\nERROR: El género '$genero' ya está en tu lista de favoritos.");
          } else {
            generosFavoritos.add(genero);
            print("\nEl género '$genero' ha sido añadido a tu lista.");
          }
        } else {
          print("\nERROR: No se puede añadir un género vacío.");
        }
      }
    } else if (opcion == '2') {
      if (generosFavoritos.isEmpty) {
        print("\nAún no se ha introducido un género favorito.");
      } else {
        print("\nGéneros:");
        for (var genero in generosFavoritos) {
          print("- $genero");
        }
      }
    } else if (opcion == '3') {
      menuActivo = false;
    } else {
      print("Opción no válida. Por favor, elige una opción del menú.");
    }
  }
}
