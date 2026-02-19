import 'package:course_app_flutter/styles/app_colors.dart';
import 'package:flutter/material.dart';

class ReturnMachineScreen extends StatefulWidget {
  const ReturnMachineScreen({super.key});

  @override
  State<ReturnMachineScreen> createState() => _ReturnMachineScreenState();
}

class _ReturnMachineScreenState extends State<ReturnMachineScreen> {
  final List<Map<String, String>> activeRentals = [
    {'id': 'C-102', 'client': 'María García', 'machine': 'Mini Cargador S450'},
    {
      'id': 'C-105',
      'client': 'Roberto Gómez',
      'machine': 'Plataforma de Tijera',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'Hacer Devolución',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.primaryText,
          ),
        ),
        backgroundColor: AppColors.primary,
      ),
      body: activeRentals.isEmpty
          ? const Center(
              child: Text(
                'No hay alquileres activos',
                style: TextStyle(color: AppColors.secondaryText),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: activeRentals.length,
              itemBuilder: (context, index) {
                final rental = activeRentals[index];
                return Card(
                  color: AppColors.backgroundComponent,
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    title: Text(
                      rental['machine']!,
                      style: const TextStyle(
                        color: AppColors.primaryText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Cliente: ${rental['client']}\nContrato: ${rental['id']}',
                      style: const TextStyle(color: AppColors.secondaryText),
                    ),
                    trailing: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          activeRentals.removeAt(index);
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Maquinaria devuelta correctamente'),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.success,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('DEVOLVER'),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
