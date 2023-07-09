class LoginModel {
  int status;
  String message;
  String token;
  Userdata userdata;

  LoginModel({
    required this.status,
    required this.message,
    required this.token,
    required this.userdata,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    status: json["status"],
    message: json["message"],
    token: json["token"],
    userdata: Userdata.fromJson(json["userdata"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "token": token,
    "userdata": userdata.toJson(),
  };
}

class Userdata {
  int id;
  String type;
  String role;
  dynamic facilityId;
  String fname;
  String lname;
  String phone;
  String email;
  String city;
  String state;
  String country;
  String zipcode;
  String timezone;
  String language;
  dynamic fcmToken;
  String image;
  String status;
  int isWebLogin;
  int isAppLogin;
  int isLogin;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;
  String fullname;
  String imageUrl;

  Userdata({
    required this.id,
    required this.type,
    required this.role,
    this.facilityId,
    required this.fname,
    required this.lname,
    required this.phone,
    required this.email,
    required this.city,
    required this.state,
    required this.country,
    required this.zipcode,
    required this.timezone,
    required this.language,
    this.fcmToken,
    required this.image,
    required this.status,
    required this.isWebLogin,
    required this.isAppLogin,
    required this.isLogin,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.fullname,
    required this.imageUrl,
  });

  factory Userdata.fromJson(Map<String, dynamic> json) => Userdata(
    id: json["id"],
    type: json["type"],
    role: json["role"],
    facilityId: json["facility_id"],
    fname: json["fname"],
    lname: json["lname"],
    phone: json["phone"],
    email: json["email"],
    city: json["city"],
    state: json["state"],
    country: json["country"],
    zipcode: json["zipcode"],
    timezone: json["timezone"],
    language: json["language"],
    fcmToken: json["fcm_token"],
    image: json["image"],
    status: json["status"],
    isWebLogin: json["is_web_login"],
    isAppLogin: json["is_app_login"],
    isLogin: json["is_login"],
    deletedAt: json["deleted_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    fullname: json["fullname"],
    imageUrl: json["image_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "role": role,
    "facility_id": facilityId,
    "fname": fname,
    "lname": lname,
    "phone": phone,
    "email": email,
    "city": city,
    "state": state,
    "country": country,
    "zipcode": zipcode,
    "timezone": timezone,
    "language": language,
    "fcm_token": fcmToken,
    "image": image,
    "status": status,
    "is_web_login": isWebLogin,
    "is_app_login": isAppLogin,
    "is_login": isLogin,
    "deleted_at": deletedAt,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "fullname": fullname,
    "image_url": imageUrl,
  };
}
