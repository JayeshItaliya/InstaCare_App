class EmployeeModel {
  int status;
  String message;
  List<EmployeeList> data;

  EmployeeModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
    status: json["status"],
    message: json["message"],
    data: List<EmployeeList>.from(json["data"].map((x) => EmployeeList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class EmployeeList {
  int id;
  String fname;
  String lname;
  String image;
  String role;
  String fullname;
  String imageUrl;

  EmployeeList({
    required this.id,
    required this.fname,
    required this.lname,
    required this.image,
    required this.role,
    required this.fullname,
    required this.imageUrl,
  });

  factory EmployeeList.fromJson(Map<String, dynamic> json) => EmployeeList(
    id: json["id"],
    fname: json["fname"],
    lname: json["lname"],
    image: json["image"],
    role: json["role"],
    fullname: json["fullname"],
    imageUrl: json["image_url"],
  );
  static List<EmployeeList>? getListFromJson(List<dynamic> list) {
    List<EmployeeList> unitList = [];
    for (var unit in list) {
      if (unit is String) {
      } else {
        unitList.add(EmployeeList.fromJson(unit));
      }
    }
    return unitList;
  }
  Map<String, dynamic> toJson() => {
    "id": id,
    "fname": fname,
    "lname": lname,
    "image": image,
    "role": role,
    "fullname": fullname,
    "image_url": imageUrl,
  };
}
