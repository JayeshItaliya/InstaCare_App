class ReasonListModel {
  int? status;
  String? message;
  List<Datum>? data;

  ReasonListModel({
    this.status,
    this.message,
    this.data,
  });

  factory ReasonListModel.fromJson(Map<String, dynamic> json) => ReasonListModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };

  @override
  String toString() {
    return 'ReasonListModel{status: $status, message: $message, data: $data}';
  }
}

class Datum {
  int? id;
  String? reason;

  Datum({
    this.id,
    this.reason,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    reason: json["reason"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "reason": reason,
  };

  @override
  String toString() {
    return 'Datum{id: $id, reason: $reason}';
  }
}
