class PeopleDetialModel {
  int status;
  String message;
  Peopledata peopledata;

  PeopleDetialModel({
    required this.status,
    required this.message,
    required this.peopledata,
  });

  factory PeopleDetialModel.fromJson(Map<String, dynamic> json) => PeopleDetialModel(
    status: json["status"],
    message: json["message"],
    peopledata: Peopledata.fromJson(json["peopledata"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "peopledata": peopledata.toJson(),
  };
}

class Peopledata {
  int id;
  String fullname;
  String role;
  String fname;
  String lname;
  String email;
  String phone;
  String city;
  String state;
  String country;
  String zipcode;
  String timezone;
  String language;
  String image;
  String status;
  PeopleInfo peopleInfo;
  UserNotificationSettings userNotificationSettings;
  Documents documents;

  Peopledata({
    required this.id,
    required this.fullname,
    required this.role,
    required this.fname,
    required this.lname,
    required this.email,
    required this.phone,
    required this.city,
    required this.state,
    required this.country,
    required this.zipcode,
    required this.timezone,
    required this.language,
    required this.image,
    required this.status,
    required this.peopleInfo,
    required this.userNotificationSettings,
    required this.documents,
  });

  factory Peopledata.fromJson(Map<String, dynamic> json) => Peopledata(
    id: json["id"],
    fullname: json["fullname"],
    role: json["role"],
    fname: json["fname"],
    lname: json["lname"],
    email: json["email"],
    phone: json["phone"],
    city: json["city"],
    state: json["state"],
    country: json["country"],
    zipcode: json["zipcode"],
    timezone: json["timezone"],
    language: json["language"],
    image: json["image"],
    status: json["status"],
    peopleInfo: PeopleInfo.fromJson(json["people_info"]),
    userNotificationSettings: UserNotificationSettings.fromJson(json["user_notification_settings"]),
    documents: Documents.fromJson(json["documents"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fullname": fullname,
    "role": role,
    "fname": fname,
    "lname": lname,
    "email": email,
    "phone": phone,
    "city": city,
    "state": state,
    "country": country,
    "zipcode": zipcode,
    "timezone": timezone,
    "language": language,
    "image": image,
    "status": status,
    "people_info": peopleInfo.toJson(),
    "user_notification_settings": userNotificationSettings.toJson(),
    "documents": documents.toJson(),
  };
}

class Documents {
  String empW4;
  String empVerification;
  String empBackground;
  String empDirect;
  String empHealthIns;
  String emp8850;
  String empCrp;
  String empHandbook;

  Documents({
    required this.empW4,
    required this.empVerification,
    required this.empBackground,
    required this.empDirect,
    required this.empHealthIns,
    required this.emp8850,
    required this.empCrp,
    required this.empHandbook,
  });

  factory Documents.fromJson(Map<String, dynamic> json) => Documents(
    empW4: json["emp_w4"],
    empVerification: json["emp_verification"],
    empBackground: json["emp_background"],
    empDirect: json["emp_direct"],
    empHealthIns: json["emp_health_ins"],
    emp8850: json["emp_8850"],
    empCrp: json["emp_crp"],
    empHandbook: json["emp_handbook"],
  );

  Map<String, dynamic> toJson() => {
    "emp_w4": empW4,
    "emp_verification": empVerification,
    "emp_background": empBackground,
    "emp_direct": empDirect,
    "emp_health_ins": empHealthIns,
    "emp_8850": emp8850,
    "emp_crp": empCrp,
    "emp_handbook": empHandbook,
  };
}

class PeopleInfo {
  String driverLicenseNumber;
  String driverLicenseStatus;
  String ssnTaxId;
  String uniformSize;
  String emrContactName;
  String emrContactPhone;
  String emrContactRelationship;
  String emrContactMiles;
  String emrContactLicenseNumber;
  int empW4;
  int empVerification;
  int empBackground;
  int empDirect;
  int empHealthIns;
  int emp8850;
  int empCrp;
  int empHandbook;
  int immTbTest;
  String startTbTestDate;
  String endTbTestDate;
  String immCovid19Date;
  int immEmployee;
  int immReligious;
  int immMedical;

  PeopleInfo({
    required this.driverLicenseNumber,
    required this.driverLicenseStatus,
    required this.ssnTaxId,
    required this.uniformSize,
    required this.emrContactName,
    required this.emrContactPhone,
    required this.emrContactRelationship,
    required this.emrContactMiles,
    required this.emrContactLicenseNumber,
    required this.empW4,
    required this.empVerification,
    required this.empBackground,
    required this.empDirect,
    required this.empHealthIns,
    required this.emp8850,
    required this.empCrp,
    required this.empHandbook,
    required this.immTbTest,
    required this.startTbTestDate,
    required this.endTbTestDate,
    required this.immCovid19Date,
    required this.immEmployee,
    required this.immReligious,
    required this.immMedical,
  });

  factory PeopleInfo.fromJson(Map<String, dynamic> json) => PeopleInfo(
    driverLicenseNumber: json["driver_license_number"],
    driverLicenseStatus: json["driver_license_status"],
    ssnTaxId: json["ssn_tax_id"],
    uniformSize: json["uniform_size"],
    emrContactName: json["emr_contact_name"],
    emrContactPhone: json["emr_contact_phone"],
    emrContactRelationship: json["emr_contact_relationship"],
    emrContactMiles: json["emr_contact_miles"],
    emrContactLicenseNumber: json["emr_contact_license_number"],
    empW4: json["emp_w4"],
    empVerification: json["emp_verification"],
    empBackground: json["emp_background"],
    empDirect: json["emp_direct"],
    empHealthIns: json["emp_health_ins"],
    emp8850: json["emp_8850"],
    empCrp: json["emp_crp"],
    empHandbook: json["emp_handbook"],
    immTbTest: json["imm_tb_test"],
    startTbTestDate: json["start_tb_test_date"],
    endTbTestDate: json["end_tb_test_date"],
    immCovid19Date: json["imm_covid19_date"],
    immEmployee: json["imm_employee"],
    immReligious: json["imm_religious"],
    immMedical: json["imm_medical"],
  );

  Map<String, dynamic> toJson() => {
    "driver_license_number": driverLicenseNumber,
    "driver_license_status": driverLicenseStatus,
    "ssn_tax_id": ssnTaxId,
    "uniform_size": uniformSize,
    "emr_contact_name": emrContactName,
    "emr_contact_phone": emrContactPhone,
    "emr_contact_relationship": emrContactRelationship,
    "emr_contact_miles": emrContactMiles,
    "emr_contact_license_number": emrContactLicenseNumber,
    "emp_w4": empW4,
    "emp_verification": empVerification,
    "emp_background": empBackground,
    "emp_direct": empDirect,
    "emp_health_ins": empHealthIns,
    "emp_8850": emp8850,
    "emp_crp": empCrp,
    "emp_handbook": empHandbook,
    "imm_tb_test": immTbTest,
    "start_tb_test_date": startTbTestDate,
    "end_tb_test_date": endTbTestDate,
    "imm_covid19_date": immCovid19Date,
    "imm_employee": immEmployee,
    "imm_religious": immReligious,
    "imm_medical": immMedical,
  };
}

class UserNotificationSettings {
  int email;
  int text;

  UserNotificationSettings({
    required this.email,
    required this.text,
  });

  factory UserNotificationSettings.fromJson(Map<String, dynamic> json) => UserNotificationSettings(
    email: json["email"],
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "text": text,
  };
}
