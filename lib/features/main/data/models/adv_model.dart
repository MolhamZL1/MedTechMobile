import '../../domain/entity/adv_entity.dart';

class AdvModel {
  int id;
  String title;
  String bio;
  String imageUrl;

  AdvModel({
    required this.id,
    required this.title,
    required this.bio,
    required this.imageUrl,
  });

  factory AdvModel.fromJson(Map<String, dynamic> json) => AdvModel(
    id: json["id"],
    title: json["title"],
    bio: json["bio"],
    imageUrl: json["imageUrl"],
  );
  factory AdvModel.fromEntity(AdvEntity entity) => AdvModel(
    id: entity.id,
    title: entity.title,
    bio: entity.bio,
    imageUrl: entity.imageUrl,
  );
  toEntity() => AdvEntity(id: id, title: title, bio: bio, imageUrl: imageUrl);
  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "bio": bio,
    "imageUrl": imageUrl,
  };
}
