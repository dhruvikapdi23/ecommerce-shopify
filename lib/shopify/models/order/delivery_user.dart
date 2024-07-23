
class DeliveryUser {
  int? id;
  String? profilePicture;
  String? name;

  DeliveryUser.fromJson(json) {
    id = int.parse(json['id']?.toString() ?? '-1');
    name = json['name'] ?? '';
    if (json['profile_picture'] != null &&
        json['profile_picture'] is List &&
        List.from(json['profile_picture']).isEmpty) {
      profilePicture = 'https://trello-attachments.s3.amazonaws.com/5d64f19a7cd71013a9a418cf/640x480/1dfc14f78ab0dbb3de0e62ae7ebded0c/placeholder.jpg';
    } else {
      profilePicture = json['profile_picture'] ?? 'https://trello-attachments.s3.amazonaws.com/5d64f19a7cd71013a9a418cf/640x480/1dfc14f78ab0dbb3de0e62ae7ebded0c/placeholder.jpg';
    }
  }
}
