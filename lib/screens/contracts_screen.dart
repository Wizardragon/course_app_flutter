import 'package:course_app_flutter/models/contract.dart';
import 'package:course_app_flutter/styles/app_colors.dart';
import 'package:flutter/material.dart';

class ContractsScreen extends StatefulWidget {
  const ContractsScreen({super.key});

  @override
  State<ContractsScreen> createState() => _ContractsScreenState();
}

class _ContractsScreenState extends State<ContractsScreen> {
  final TextEditingController _searchController = TextEditingController();
  
  final List<Contract> _allContracts = [
    Contract(
      id: 'C-101',
      clientName: 'Juan Pérez',
      machineName: 'Excavadora 320',
      startDate: DateTime(2026, 2, 1),
      endDate: DateTime(2026, 2, 15),
      totalAmount: 2250.0,
      isPaid: true,
    ),
    Contract(
      id: 'C-102',
      clientName: 'María García',
      machineName: 'Mini Cargador S450',
      startDate: DateTime(2026, 2, 5),
      endDate: DateTime(2026, 2, 10),
      totalAmount: 425.0,
      isPaid: false,
    ),
    Contract(
      id: 'C-103',
      clientName: 'Ana Martínez',
      machineName: 'Retroexcavadora 3CX',
      startDate: DateTime(2026, 2, 18),
      endDate: DateTime(2026, 2, 25),
      totalAmount: 840.0,
      isPaid: true,
    ),
  ];

  List<Contract> _filteredContracts = [];

  @override
  void initState() {
    super.initState();
    _filteredContracts = _allContracts;
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
      _filteredContracts = _allContracts
          .where((contract) =>
              contract.clientName.toLowerCase().contains(_searchController.text.toLowerCase()) ||
              contract.machineName.toLowerCase().contains(_searchController.text.toLowerCase()) ||
              contract.id.toLowerCase().contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'Gestión de Contratos',
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
                hintText: 'Buscar por cliente, máquina o ID...',
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
            child: _filteredContracts.isEmpty
                ? const Center(child: Text('No se encontraron contratos', style: TextStyle(color: AppColors.secondaryText)))
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: _filteredContracts.length,
                    itemBuilder: (context, index) => _buildContractCard(_filteredContracts[index]),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildContractCard(Contract contract) {
    return Card(
      color: AppColors.backgroundComponent,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  contract.id,
                  style: const TextStyle(color: AppColors.accent, fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: contract.isPaid ? AppColors.success.withOpacity(0.2) : AppColors.error.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    contract.isPaid ? 'Pagado' : 'Pendiente',
                    style: TextStyle(
                      color: contract.isPaid ? AppColors.success : AppColors.error,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              contract.clientName,
              style: const TextStyle(color: AppColors.primaryText, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.handyman, size: 16, color: AppColors.secondaryText),
                const SizedBox(width: 8),
                Text(contract.machineName, style: const TextStyle(color: AppColors.secondaryText)),
              ],
            ),
            const Divider(color: AppColors.backgroundHover, height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Periodo', style: TextStyle(color: AppColors.secondaryText, fontSize: 12)),
                    Text(
                      '${_formatDate(contract.startDate)} - ${_formatDate(contract.endDate)}',
                      style: const TextStyle(color: AppColors.primaryText, fontSize: 14),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text('Total', style: TextStyle(color: AppColors.secondaryText, fontSize: 12)),
                    Text(
                      '\$${contract.totalAmount.toStringAsFixed(2)}',
                      style: const TextStyle(color: AppColors.accent, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
