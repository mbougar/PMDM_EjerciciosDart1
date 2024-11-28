import 'dart:io';

void main() {
  // Mapa para guardar estudiantes y sus notas
  var estudiantes = <String, double>{};
  bool menuActivo = true;

  // Abrimos el menú con un bucle while
  while (menuActivo) {
    print("\n╔═════════════════════════════════════════╗");
    print("║   Gestor de estudiantes y notas         ║");
    print("║                                         ║");
    print("║   1. Añadir estudiante                  ║");
    print("║   2. Mostrar estudiantes y notas        ║");
    print("║   3. Salir                              ║");
    print("╚═════════════════════════════════════════╝");

    stdout.write("Elige una opción: ");
    String? opcion = stdin.readLineSync();

    // Seleccionamos la opción seleccionada
    if (opcion == '1') {
      stdout.write("\nIntroduce el nombre del estudiante: ");
      String? nombre = stdin.readLineSync();

      if (nombre != null && nombre.isNotEmpty) {
        stdout.write("Introduce la nota de $nombre: ");
        String? notaString = stdin.readLineSync();

        if (notaString != null) {
          // Usamos un try para asegurarnos de que la nota introducida es un número con decimales (los decimales son opcionales)
          try {
            double notaDouble = double.parse(notaString);
            if (notaDouble < 0 || notaDouble > 10) {
              print("\nERROR: La nota introducida no esta en el rango 0 a 10.");
            } else {
              estudiantes[nombre] = notaDouble;
              print("\nEl estudiante $nombre con nota $notaDouble ha sido añadido.");
            }
          } on Exception {
            print("\nERROR: La nota introducida no es un valor numérico.");
          }
        }
      } else {
        print("\nERROR: El nombre del estudiante no puede estar vacío.");
      }
    } else if (opcion == '2') {

      if (estudiantes.isEmpty) {
        print("\nAún no se ha registrado ningún estudiante.");
      } else {
        print("\nEstudiantes y sus notas:");
        estudiantes.forEach((nombre, nota) {
          print("- $nombre: $nota");
        });
      }
    } else if (opcion == '3') {
      menuActivo = false;
    } else {
      print("\nOpción no válida. Por favor, elige una opción del menú.");
    }
  }
}