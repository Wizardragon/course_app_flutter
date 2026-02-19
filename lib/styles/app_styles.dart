import 'package:flutter/material.dart';
import 'app_colors.dart'; // Importa tu clase de colores

class AppStyles {
  // Definimos el estilo base para los botones del POS
  static ButtonStyle machineButtonStyle =
      ElevatedButton.styleFrom(
        backgroundColor: AppColors.backgroundComponent,
        foregroundColor: AppColors.primaryText,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      ).copyWith(
        // Aplicamos la lógica de estados modernos con .map
        side: WidgetStateProperty.fromMap({
          WidgetState.selected: const BorderSide(
            color: AppColors.accent,
            width: 2,
          ),
          WidgetState.pressed: const BorderSide(
            color: AppColors.primary,
            width: 2,
          ),
          WidgetState.any: BorderSide.none,
        }),
        elevation: WidgetStateProperty.fromMap({
          WidgetState.pressed: 0,
          WidgetState.hovered: 4,
          WidgetState.any: 2,
        }),
      );
      static ButtonStyle machineButtonStyle2 =
      ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF474747),
        foregroundColor: AppColors.primaryText,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      ).copyWith(
        // Aplicamos la lógica de estados modernos con .map
        side: WidgetStateProperty.fromMap({
          WidgetState.selected: const BorderSide(
            color: AppColors.accent,
            width: 2,
          ),
          WidgetState.pressed: const BorderSide(
            color: AppColors.primary,
            width: 2,
          ),
          WidgetState.any: BorderSide.none,
        }),
        elevation: WidgetStateProperty.fromMap({
          WidgetState.pressed: 0,
          WidgetState.hovered: 4,
          WidgetState.any: 2,
        }),
      );
}
