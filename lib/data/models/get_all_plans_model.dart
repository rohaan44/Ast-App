class GetAllPlansModel {
  bool? success;
  Data? data;

  GetAllPlansModel({this.success, this.data});

  GetAllPlansModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Null>? plans;

  Data({this.plans});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['plans'] != null) {
      plans = [];
      json['plans'].forEach((v) {
        plans!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.plans != null) {
      data['plans'] = this.plans!.map((v) => v).toList();
    }
    return data;
  }
}