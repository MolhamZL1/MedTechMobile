class UpdateProfileEntity {
  final String username;
  final String email;
  final String number;
//  final String location;
  final String? image;

  UpdateProfileEntity({
    required this.username,
    required this.email,
    required this.number,
  //  required this.location,
    this.image,
  });
}
 