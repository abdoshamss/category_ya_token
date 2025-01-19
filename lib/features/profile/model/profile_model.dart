class ProfileModel {
  final String nationalId;
  final String name;

  final String phone;
  final String email;
  final String profileImage;

  ProfileModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.profileImage,
    required this.nationalId,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> jsonData) {
    return ProfileModel(
        name: jsonData["name"],
        email: jsonData["email"],
        phone: jsonData["phone"],
        profileImage: jsonData["profileImage"],
        nationalId: jsonData["nationalId"]);
  }
}

class ProfileModelUserData {
  final ProfileModel profileUserModel;

  ProfileModelUserData({required this.profileUserModel});

  factory ProfileModelUserData.fromJson(Map<String, dynamic> jsonData) {
    return ProfileModelUserData(
        profileUserModel: ProfileModel.fromJson(jsonData["user"]));
  }
}

// "user": {
// "name": "aya",
// "email": "aya@gmail.com",
// "phone": "01056710052",
// "nationalId": "01056710052789",
// "gender": "female",
// "profileImage": "https://res.cloudinary.com/dzh2hde2n/image/upload/v1702825655/ik8gekfihqfhlamin9ge.jpg",
// "token": "g83xiz4ll4pm625m3bo"
// }