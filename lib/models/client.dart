class Client {
  final String id;
  final String name;
  final String email;
  final String phone;
  final bool isActive;

  Client({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.isActive = true,
  });
}
