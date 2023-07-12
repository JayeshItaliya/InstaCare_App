// To parse this JSON data, do
//
//     final getSingleShiftModel = getSingleShiftModelFromJson(jsonString);

import 'dart:convert';

GetSingleShiftModel getSingleShiftModelFromJson(String str) =>
    GetSingleShiftModel.fromJson(json.decode(str));

String getSingleShiftModelToJson(GetSingleShiftModel data) =>
    json.encode(data.toJson());

class GetSingleShiftModel {
  int? status;
  String? message;
  List<Datum>? data;

  GetSingleShiftModel({
    this.status,
    this.message,
    this.data,
  });

  factory GetSingleShiftModel.fromJson(Map<String, dynamic> json) =>
      GetSingleShiftModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };

  @override
  String toString() {
    return 'GetSingleShiftModel{status: $status, message: $message, data: $data}';
  }
}

class Datum {
  int? id;
  String? name;
  String? about;
  String? guide;
  String? address;
  String? city;
  String? state;
  String? country;
  String? zipcode;
  String? image;
  dynamic deletedAt;
  DateTime? createdAt;
  String? fullname;
  String? imageUrl;
  List<Supervisor>? supervisors;

  Datum({
    this.id,
    this.name,
    this.about,
    this.guide,
    this.address,
    this.city,
    this.state,
    this.country,
    this.zipcode,
    this.image,
    this.deletedAt,
    this.createdAt,
    this.fullname,
    this.imageUrl,
    this.supervisors,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        about: json["about"],
        guide: json["guide"],
        address: json["address"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        zipcode: json["zipcode"],
        image: json["image"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        fullname: json["fullname"],
        imageUrl: json["image_url"],
        supervisors: json["supervisors"] == null
            ? []
            : List<Supervisor>.from(
                json["supervisors"]!.map((x) => Supervisor.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "about": about,
        "guide": guide,
        "address": address,
        "city": city,
        "state": state,
        "country": country,
        "zipcode": zipcode,
        "image": image,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "fullname": fullname,
        "image_url": imageUrl,
        "supervisors": supervisors == null
            ? []
            : List<dynamic>.from(supervisors!.map((x) => x.toJson())),
      };

  @override
  String toString() {
    return 'Datum{id: $id, name: $name, about: $about, guide: $guide, address: $address, city: $city, state: $state, country: $country, zipcode: $zipcode, image: $image, deletedAt: $deletedAt, createdAt: $createdAt, fullname: $fullname, imageUrl: $imageUrl, supervisors: $supervisors}';
  }
}

class Supervisor {
  int? id;
  int? facilitiesId;
  String? name;
  String? email;
  String? phone;

  Supervisor({
    this.id,
    this.facilitiesId,
    this.name,
    this.email,
    this.phone,
  });

  factory Supervisor.fromJson(Map<String, dynamic> json) => Supervisor(
        id: json["id"],
        facilitiesId: json["facilities_id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "facilities_id": facilitiesId,
        "name": name,
        "email": email,
        "phone": phone,
      };

  @override
  String toString() {
    return 'Supervisor{id: $id, facilitiesId: $facilitiesId, name: $name, email: $email, phone: $phone}';
  }
}
