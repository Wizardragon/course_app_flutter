import 'package:course_app_flutter/components/button_home_screen.dart';
import 'package:course_app_flutter/screens/contracts_screen.dart';
import 'package:course_app_flutter/screens/machinery_screen.dart';
import 'package:course_app_flutter/screens/new_client_screen.dart';
import 'package:course_app_flutter/screens/new_contract_screen.dart';
import 'package:course_app_flutter/screens/return_machine_screen.dart';
import 'package:flutter/material.dart';
import 'package:course_app_flutter/styles/app_colors.dart';
import 'client_search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'Home Screen',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.primaryText,
          ),
        ),
        backgroundColor: AppColors.primary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 80),
            child: SizedBox(
              width: double.infinity,
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 20, // Espacio horizontal
                runSpacing: 20, // Espacio vertical
                children: [
                  Button2HomeScreen(
                    label: 'Nuevo Contrato',
                    onPressed: () => _navigateTo(context, const NewContractScreen()),
                  ),
                  Button2HomeScreen(
                    label: 'Hacer devolución',
                    onPressed: () => _navigateTo(context, const ReturnMachineScreen()),
                  ),
                  Button2HomeScreen(
                    label: 'Nuevo cliente',
                    onPressed: () => _navigateTo(context, const NewClientScreen()),
                  ),
                ],
              )
            ),
            ),
          Padding(
            padding: const EdgeInsets.only(right: 32, left: 32),
            child: SizedBox(
              width: double.infinity,
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 20, // Espacio horizontal
                runSpacing: 20,

                children: [
                  ButtonHomeScreen(
                    label: 'Clientes',
                    onPressed: () => _navigateTo(context, const ClientSearchScreen()),
                  ),
                  ButtonHomeScreen(
                    label: 'Máquinas',
                    onPressed: () =>
                        _navigateTo(context, const MachineryScreen()),
                  ),
                  ButtonHomeScreen(
                    label: 'Contratos',
                    onPressed: () =>
                        _navigateTo(context, const ContractsScreen()),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 32, left: 32,top: 20, bottom: 20),
            child: SizedBox(
              width: double.infinity,
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 20, // Espacio horizontal
                runSpacing: 20,
                children: [
                  ButtonHomeScreen(
                    label: 'Clientes',
                    onPressed: () => _navigateTo(context, const ClientSearchScreen()),
                  ),
                  ButtonHomeScreen(
                    label: 'Máquinas',
                    onPressed: () =>
                        _navigateTo(context, const MachineryScreen()),
                  ),
                  ButtonHomeScreen(
                    label: 'Contratos',
                    onPressed: () =>
                        _navigateTo(context, const ContractsScreen()),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void _navigateTo(BuildContext context, Widget screen) {
  Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));
}
