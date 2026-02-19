enum MachineStatus { available, rented, maintenance }

class Machine {
  final String id;
  final String name;
  final String model;
  final MachineStatus status;
  final double dailyRate;

  Machine({
    required this.id,
    required this.name,
    required this.model,
    required this.status,
    required this.dailyRate,
  });
}
