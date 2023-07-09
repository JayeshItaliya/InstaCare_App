class PeopleModel {
  int status;
  String message;
  List<PeopleList> peopleList;

  PeopleModel({
    required this.status,
    required this.message,
    required this.peopleList,
  });

  factory PeopleModel.fromJson(Map<String, dynamic> json) => PeopleModel(
    status: json["status"],
    message: json["message"],
    peopleList: List<PeopleList>.from(json["people_list"].map((x) => PeopleList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "people_list": List<dynamic>.from(peopleList.map((x) => x.toJson())),
  };
}

class PeopleList {
  int id;
  String fullname;
  String role;
  String email;
  String status;
  dynamic review;
  dynamic points;
  String image;

  PeopleList({
    required this.id,
    required this.fullname,
    required this.role,
    required this.email,
    required this.status,
    this.review,
    this.points,
    required this.image,
  });

  factory PeopleList.fromJson(Map<String, dynamic> json) => PeopleList(
    id: json["id"],
    fullname: json["fullname"],
    role: json["role"],
    email: json["email"],
    status: json["status"],
    review: json["review"],
    points: json["points"],
    image: json["image"],
  );
  static List<PeopleList>? getListFromJson(List<dynamic> list) {
    List<PeopleList> unitList = [];
    for (var unit in list) {
      if (unit is String) {
      } else {
        unitList.add(PeopleList.fromJson(unit));
      }
    }
    return unitList;
  }
  Map<String, dynamic> toJson() => {
    "id": id,
    "fullname": fullname,
    "role": role,
    "email": email,
    "status": status,
    "review": review,
    "points": points,
    "image": image,
  };
}
