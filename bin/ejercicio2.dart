import 'dart:io';

void main() {
  var tareas = [];
  bool menuActivo = true;

  // Abrimos el menu con un bucle while
  while (menuActivo) {
    //mostrarMenu();
    print("\n╔═════════════════════════════════════════╗");
    print("║   Gestor de tareas                      ║");
    print("║                                         ║");
    print("║   1. Añadir tarea                       ║");
    print("║   2. Mostrar tareas                     ║");
    print("║   3. Salir                              ║");
    print("╚═════════════════════════════════════════╝");
    // Usamos std.write para escribir sin saltar de
    stdout.write("Elige una opción: ");
    String? opcion = stdin.readLineSync();
    
    // Seleccionamos la opción que se ha seleccionado
    if (opcion == '1') {
      
      stdout.write("\nIntroduce una tarea: ");
      String? tarea = stdin.readLineSync();

      // Tenemos que asegurarnos de que tarea no sea null antes de que dart nos permita usar .isNotEmpty
      if (tarea != null && tarea.isNotEmpty) {
        tareas.add(tarea);
        print("\nLa tarea $tarea ha sido añadida.");
      } else {
        print("\nERROR: No se puede añadir una tarea vacía.");
      }
    } else if (opcion == '2') {
      if (tareas.isEmpty) {
        print("\nAún no se ha introducido ninguna tarea.");
      } else {
        print("\nTareas:");
        for (var tarea in tareas) {
          print("- $tarea");
        }
      }
    } else if (opcion == '3') {
      menuActivo = false;
    } else {
      print("Opción no válida. Por favor, elige una opción del menú.");
    }
  }
}