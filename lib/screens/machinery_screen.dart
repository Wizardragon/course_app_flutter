import 'package:course_app_flutter/models/machine.dart';
import 'package:course_app_flutter/styles/app_colors.dart';
import 'package:flutter/material.dart';

class MachineryScreen extends StatefulWidget {
  const MachineryScreen({super.key});

  @override
  State<MachineryScreen> createState() => _MachineryScreenState();
}

class _MachineryScreenState extends State<MachineryScreen> {
  final TextEditingController _searchController = TextEditingController();
  
  final List<Machine> _allMachines = [
    Machine(id: 'M1', name: 'Excavadora 320', model: 'Caterpillar', status: MachineStatus.available, dailyRate: 150.0),
    Machine(id: 'M2', name: 'Mini Cargador S450', model: 'Bobcat', status: MachineStatus.rented, dailyRate: 85.0),
    Machine(id: 'M3', name: 'Grúa de Torre JT50', model: 'Jaso', status: MachineStatus.maintenance, dailyRate: 300.0),
    Machine(id: 'M4', name: 'Retroexcavadora 3CX', model: 'JCB', status: MachineStatus.available, dailyRate: 120.0),
    Machine(id: 'M5', name: 'Rodillo Compactador', model: 'Dynapac', status: MachineStatus.available, dailyRate: 95.0),
    Machine(id: 'M6', name: 'Plataforma de Tijera', model: 'Genie', status: MachineStatus.rented, dailyRate: 60.0),
  ];

  List<Machine> _filteredMachines = [];

  @override
  void initState() {
    super.initState();
    _filteredMachines = _allMachines;
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _filteredMachines = _allMachines
          .where((machine) =>
              machine.name.toLowerCase().contains(_searchController.text.toLowerCase()) ||
              machine.model.toLowerCase().contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'Inventario de Maquinaria',
          style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.primaryText),
        ),
        backgroundColor: AppColors.primary,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              style: const TextStyle(color: AppColors.primaryText),
              decoration: InputDecoration(
                hintText: 'Buscar por nombre o modelo...',
                hintStyle: const TextStyle(color: AppColors.secondaryText),
                prefixIcon: const Icon(Icons.search, color: AppColors.accent),
                filled: true,
                fillColor: AppColors.backgroundComponent,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppColors.accent, width: 2),
                ),
              ),
            ),
          ),
          Expanded(
            child: _filteredMachines.isEmpty
                ? const Center(child: Text('No hay maquinaria disponible', style: TextStyle(color: AppColors.secondaryText)))
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: _filteredMachines.length,
                    itemBuilder: (context, index) => _buildMachineCard(_filteredMachines[index]),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildMachineCard(Machine machine) {
    Color statusColor;
    String statusText;

    switch (machine.status) {
      case MachineStatus.available:
        statusColor = AppColors.success;
        statusText = 'Disponible';
        break;
      case MachineStatus.rented:
        statusColor = AppColors.secondary;
        statusText = 'Rentada';
        break;
      case MachineStatus.maintenance:
        statusColor = AppColors.error;
        statusText = 'Mantenimiento';
        break;
    }

    return Card(
      color: AppColors.backgroundComponent,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.backgroundHover,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.engineering, color: AppColors.accent),
        ),
        title: Text(
          machine.name,
          style: const TextStyle(color: AppColors.primaryText, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(machine.model, style: const TextStyle(color: AppColors.secondaryText)),
            const SizedBox(height: 4),
            Text(
              '\$${machine.dailyRate.toStringAsFixed(2)} / día',
              style: const TextStyle(color: AppColors.accent, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: statusColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            statusText,
            style: TextStyle(color: statusColor, fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
