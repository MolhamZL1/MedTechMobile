class UserEntity {
  final String name;
  final String email;
  final String token;
  final String id;

  const UserEntity({
    required this.name,
    required this.id,
    required this.email,
    required this.token,
  });
}
