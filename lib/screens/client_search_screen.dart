import 'package:course_app_flutter/models/client.dart';
import 'package:course_app_flutter/styles/app_colors.dart';
import 'package:flutter/material.dart';

class ClientSearchScreen extends StatefulWidget {
  const ClientSearchScreen({super.key});

  @override
  State<ClientSearchScreen> createState() => _ClientSearchScreenState();
}

class _ClientSearchScreenState extends State<ClientSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  
  final List<Client> _allClients = [
    Client(id: '1', name: 'Juan Pérez', email: 'juan.perez@example.com', phone: '123-456-7890', isActive: true),
    Client(id: '2', name: 'María García', email: 'maria.garcia@example.com', phone: '234-567-8901', isActive: true),
    Client(id: '3', name: 'Carlos Rodríguez', email: 'carlos.rod@example.com', phone: '345-678-9012', isActive: false),
    Client(id: '4', name: 'Ana Martínez', email: 'ana.mtz@example.com', phone: '456-789-0123', isActive: true),
    Client(id: '5', name: 'Luis López', email: 'luis.lopez@example.com', phone: '567-890-1234', isActive: true),
    Client(id: '6', name: 'Elena Beltrán', email: 'elena.b@example.com', phone: '678-901-2345', isActive: false),
    Client(id: '7', name: 'Roberto Gómez', email: 'roberto.g@example.com', phone: '789-012-3456', isActive: true),
    Client(id: '8', name: 'Sofía Ruiz', email: 'sofia.ruiz@example.com', phone: '890-123-4567', isActive: true),
  ];

  List<Client> _filteredClients = [];

  @override
  void initState() {
    super.initState();
    _filteredClients = _allClients;
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
      _filteredClients = _allClients
          .where((client) =>
              client.name.toLowerCase().contains(_searchController.text.toLowerCase()) ||
              client.email.toLowerCase().contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'Búsqueda de Clientes',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.primaryText,
          ),
        ),
        backgroundColor: AppColors.primary,
        elevation: 4,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              style: const TextStyle(color: AppColors.primaryText),
              decoration: InputDecoration(
                hintText: 'Buscar por nombre o email...',
                hintStyle: const TextStyle(color: AppColors.secondaryText),
                prefixIcon: const Icon(Icons.search, color: AppColors.accent),
                filled: true,
                fillColor: AppColors.backgroundComponent,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppColors.accent, width: 2),
                ),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear, color: AppColors.secondaryText),
                        onPressed: () => _searchController.clear(),
                      )
                    : null,
              ),
            ),
          ),
          Expanded(
            child: _filteredClients.isEmpty
                ? const Center(
                    child: Text(
                      'No se encontraron clientes',
                      style: TextStyle(color: AppColors.secondaryText, fontSize: 16),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: _filteredClients.length,
                    itemBuilder: (context, index) {
                      final client = _filteredClients[index];
                      return _buildClientCard(client);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildClientCard(Client client) {
    return Card(
      color: AppColors.backgroundComponent,
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: CircleAvatar(
          backgroundColor: AppColors.primary.withOpacity(0.2),
          child: Text(
            client.name[0].toUpperCase(),
            style: const TextStyle(color: AppColors.accent, fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(
          client.name,
          style: const TextStyle(
            color: AppColors.primaryText,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.email, size: 14, color: AppColors.secondaryText),
                const SizedBox(width: 4),
                Text(client.email, style: const TextStyle(color: AppColors.secondaryText)),
              ],
            ),
            const SizedBox(height: 2),
            Row(
              children: [
                const Icon(Icons.phone, size: 14, color: AppColors.secondaryText),
                const SizedBox(width: 4),
                Text(client.phone, style: const TextStyle(color: AppColors.secondaryText)),
              ],
            ),
          ],
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: client.isActive
                ? AppColors.success.withOpacity(0.2)
                : AppColors.error.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            client.isActive ? 'Activo' : 'Inactivo',
            style: TextStyle(
              color: client.isActive ? AppColors.success : AppColors.error,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        onTap: () {
          // Future: Navigate to client details
        },
      ),
    );
  }
}
