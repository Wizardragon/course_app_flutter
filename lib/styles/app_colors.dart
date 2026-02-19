import 'dart:ui';

class AppColors {
  // Un morado más vibrante para que destaque sobre fondos oscuros
  static const Color primary = Color.fromARGB(255, 116, 12, 132);
  // Profundidad para gradientes o elementos secundarios
  static const Color secondary = Color(0xFF6200EE);
  // Amarillo "Gold" vibrante para alertas, estados activos o botones clave
  static const Color accent = Color(0xFFFFD600);

  // --- Backgrounds & Surfaces ---
  // No uses negro puro (#000), usa un gris azulado/púrpura muy oscuro para dar profundidad
  static const Color background = Color.fromARGB(255, 100, 100, 100);//0xFF121212
  // Elevación nivel 1: Para tarjetas y contenedores
  static const Color backgroundComponent = Color(0xFF1E1E1E);
  // Elevación nivel 2: Para cuando un ítem está seleccionado (un toque del primario)
  static const Color backgroundComponentSelected = Color(0xFF2C2C2C);
  // Efecto hover sutil
  static const Color backgroundHover = Color(0xFF383838);

  // --- Text & Icons ---
  // Blanco roto para evitar la fatiga visual
  static const Color primaryText = Color(0xFFE1E1E1);
  // Gris medio para descripciones o etiquetas menos importantes
  static const Color secondaryText = Color(0xFFB0B0B0);

  // --- Extra: Status (Crítico para maquinaria) ---
  static const Color success = Color(0xFF4CAF50); // Maquinaria disponible
  static const Color error = Color(0xFFCF6679); // Avería o retraso
}
