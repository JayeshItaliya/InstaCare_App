class NewsModel {
  int status;
  String message;
  List<NewsListModel> data;

  NewsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
    status: json["status"],
    message: json["message"],
    data: List<NewsListModel>.from(json["data"].map((x) => NewsListModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class NewsListModel {
  int id;
  AddedBy addedBy;
  int type;
  String title;
  String description;
  int isActive;
  DateTime updatedAt;

  NewsListModel({
    required this.id,
    required this.addedBy,
    required this.type,
    required this.title,
    required this.description,
    required this.isActive,
    required this.updatedAt,
  });

  factory NewsListModel.fromJson(Map<String, dynamic> json) => NewsListModel(
    id: json["id"],
    addedBy: AddedBy.fromJson(json["added_by"]),
    type: json["type"],
    title: json["title"],
    description: json["description"],
    isActive: json["is_active"],
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  static List<NewsListModel>? getListFromJson(List<dynamic> list) {
    List<NewsListModel> unitList = [];
    for (var unit in list) {
      if (unit is String) {
      } else {
        unitList.add(NewsListModel.fromJson(unit));
      }
    }
    return unitList;
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "added_by": addedBy.toJson(),
    "type": type,
    "title": title,
    "description": description,
    "is_active": isActive,
    "updated_at": updatedAt.toIso8601String(),
  };
}

class AddedBy {
  int id;
  String fname;
  String fullname;
  String imageUrl;

  AddedBy({
    required this.id,
    required this.fname,
    required this.fullname,
    required this.imageUrl,
  });

  factory AddedBy.fromJson(Map<String, dynamic> json) => AddedBy(
    id: json["id"],
    fname: json["fname"],
    fullname: json["fullname"],
    imageUrl: json["image_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fname": fname,
    "fullname": fullname,
    "image_url": imageUrl,
  };
}
