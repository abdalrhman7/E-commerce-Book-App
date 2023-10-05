class GovernoratesModel {
  int? id;
  String? governorateNameEn;

  GovernoratesModel({this.id, this.governorateNameEn});

  GovernoratesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    governorateNameEn = json['governorate_name_en'];
  }
}
