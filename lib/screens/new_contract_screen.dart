import 'package:course_app_flutter/styles/app_colors.dart';
import 'package:flutter/material.dart';

class NewContractScreen extends StatefulWidget {
  const NewContractScreen({super.key});

  @override
  State<NewContractScreen> createState() => _NewContractScreenState();
}

class _NewContractScreenState extends State<NewContractScreen> {
  String? selectedClient;
  String? selectedMachine;
  DateTimeRange? selectedDateRange;

  final List<String> clients = ['Juan Pérez', 'María García', 'Carlos Rodríguez', 'Ana Martínez'];
  final List<String> machines = ['Excavadora 320', 'Mini Cargador S450', 'Retroexcavadora 3CX'];

  void _selectDateRange() async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: AppColors.primary,
              onPrimary: Colors.white,
              surface: AppColors.backgroundComponent,
              onSurface: AppColors.primaryText,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        selectedDateRange = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'Nuevo Contrato',
          style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.primaryText),
        ),
        backgroundColor: AppColors.primary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildDropdown(
              label: 'Seleccionar Cliente',
              value: selectedClient,
              items: clients,
              onChanged: (val) => setState(() => selectedClient = val),
              icon: Icons.person,
            ),
            const SizedBox(height: 20),
            _buildDropdown(
              label: 'Seleccionar Maquinaria',
              value: selectedMachine,
              items: machines,
              onChanged: (val) => setState(() => selectedMachine = val),
              icon: Icons.engineering,
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: _selectDateRange,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.backgroundComponent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.calendar_today, color: AppColors.accent),
                    const SizedBox(width: 12),
                    Text(
                      selectedDateRange == null
                          ? 'Seleccionar Fechas'
                          : '${selectedDateRange!.start.day}/${selectedDateRange!.start.month} - ${selectedDateRange!.end.day}/${selectedDateRange!.end.month}',
                      style: TextStyle(
                        color: selectedDateRange == null ? AppColors.secondaryText : AppColors.primaryText,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: (selectedClient != null && selectedMachine != null && selectedDateRange != null)
                  ? () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Contrato creado')),
                      );
                      Navigator.pop(context);
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accent,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                disabledBackgroundColor: AppColors.backgroundComponentSelected,
              ),
              child: const Text(
                'CREAR CONTRATO',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required String? value,
    required List<String> items,
    required void Function(String?) onChanged,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.backgroundComponent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<String>(
          value: value,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(color: AppColors.secondaryText),
            prefixIcon: Icon(icon, color: AppColors.accent),
            border: InputBorder.none,
          ),
          dropdownColor: AppColors.backgroundComponent,
          style: const TextStyle(color: AppColors.primaryText, fontSize: 16),
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
