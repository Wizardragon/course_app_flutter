class Contract {
  final String id;
  final String clientName;
  final String machineName;
  final DateTime startDate;
  final DateTime endDate;
  final double totalAmount;
  final bool isPaid;

  Contract({
    required this.id,
    required this.clientName,
    required this.machineName,
    required this.startDate,
    required this.endDate,
    required this.totalAmount,
    this.isPaid = false,
  });
}
