import 'package:course_app_flutter/styles/app_colors.dart';
import 'package:flutter/material.dart';

class ButtomHomeScreen extends StatefulWidget {
  const ButtomHomeScreen({super.key});

  @override
  State<ButtomHomeScreen> createState() => _ButtomHomeScreenState();
}

class _ButtomHomeScreenState extends State<ButtomHomeScreen> {
  bool _isPressed = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _isPressed = !_isPressed;
        });
      },
      style: ElevatedButton.styleFrom(
        // 1. Definir el color de fondo (Primary en Material)
        backgroundColor: AppColors.backgroundComponent,
        // 2. Color del contenido (Texto/Icono)
        foregroundColor: AppColors.primaryText,
        // 3. Forzar dimensiones cuadradas
        fixedSize: const Size(290, 220),
        // 4. Eliminar el redondeo de las esquinas
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        // 5. Elevación sutil para Windows
        elevation: 40,
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 8),
          Text(
            'Clientes',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
