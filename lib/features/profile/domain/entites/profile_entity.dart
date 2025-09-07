
class ProfileEntity {
  final int id;
  final String username;
  final String email;
  final String? number;
  final String? image;
  final String? jobTitle;
  final String? bio;
  final bool isBanned;
  final String role;
  final DateTime createdAt;

  ProfileEntity({
    required this.id,
    required this.username,
    required this.email,
    this.number,
    this.image,
    this.jobTitle,
    this.bio,
    required this.isBanned,
    required this.role,
    required this.createdAt,
  });
}
