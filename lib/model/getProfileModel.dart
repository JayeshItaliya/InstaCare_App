// To parse this JSON data, do
//
//     final getProfile = getProfileFromJson(jsonString);

import 'dart:convert';

GetProfile getProfileFromJson(String str) =>
    GetProfile.fromJson(json.decode(str));

String getProfileToJson(GetProfile data) => json.encode(data.toJson());

class GetProfile {
  int? status;
  String? message;
  Userdata? userdata;

  GetProfile({
    this.status,
    this.message,
    this.userdata,
  });

  factory GetProfile.fromJson(Map<String, dynamic> json) => GetProfile(
        status: json["status"],
        message: json["message"],
        userdata: json["userdata"] == null
            ? null
            : Userdata.fromJson(json["userdata"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "userdata": userdata?.toJson(),
      };

  @override
  String toString() {
    return 'GetProfile{status: $status, message: $message, userdata: $userdata}';
  }
}

class Userdata {
  int? id;
  String? type;
  String? role;
  dynamic facilityId;
  String? fname;
  String? lname;
  String? phone;
  String? email;
  String? city;
  String? state;
  String? country;
  String? zipcode;
  String? timezone;
  String? language;
  dynamic fcmToken;
  String? image;
  String? status;
  int? isWebLogin;
  int? isAppLogin;
  int? isLogin;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? fullname;
  String? imageUrl;
  dynamic peopleInfo;
  dynamic userAccessSettings;
  dynamic userNotificationSettings;
  dynamic userPermissionSettings;
  dynamic userOtherSettings;

  Userdata({
    this.id,
    this.type,
    this.role,
    this.facilityId,
    this.fname,
    this.lname,
    this.phone,
    this.email,
    this.city,
    this.state,
    this.country,
    this.zipcode,
    this.timezone,
    this.language,
    this.fcmToken,
    this.image,
    this.status,
    this.isWebLogin,
    this.isAppLogin,
    this.isLogin,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.fullname,
    this.imageUrl,
    this.peopleInfo,
    this.userAccessSettings,
    this.userNotificationSettings,
    this.userPermissionSettings,
    this.userOtherSettings,
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
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        fullname: json["fullname"],
        imageUrl: json["image_url"],
        peopleInfo: json["people_info"],
        userAccessSettings: json["user_access_settings"],
        userNotificationSettings: json["user_notification_settings"],
        userPermissionSettings: json["user_permission_settings"],
        userOtherSettings: json["user_other_settings"],
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
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "fullname": fullname,
        "image_url": imageUrl,
        "people_info": peopleInfo,
        "user_access_settings": userAccessSettings,
        "user_notification_settings": userNotificationSettings,
        "user_permission_settings": userPermissionSettings,
        "user_other_settings": userOtherSettings,
      };

  @override
  String toString() {
    return 'Userdata{id: $id, type: $type, role: $role, facilityId: $facilityId, fname: $fname, lname: $lname, phone: $phone, email: $email, city: $city, state: $state, country: $country, zipcode: $zipcode, timezone: $timezone, language: $language, fcmToken: $fcmToken, image: $image, status: $status, isWebLogin: $isWebLogin, isAppLogin: $isAppLogin, isLogin: $isLogin, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, fullname: $fullname, imageUrl: $imageUrl, peopleInfo: $peopleInfo, userAccessSettings: $userAccessSettings, userNotificationSettings: $userNotificationSettings, userPermissionSettings: $userPermissionSettings, userOtherSettings: $userOtherSettings}';
  }
}
