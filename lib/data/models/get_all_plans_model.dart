class GetAllPlansModel {
  bool? success;
  Data? data;

  GetAllPlansModel({this.success, this.data});

  GetAllPlansModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Plan>? plans;

  Data({this.plans});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['plans'] != null) {
      plans = <Plan>[];
      json['plans'].forEach((v) {
        plans!.add(Plan.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (plans != null) {
      data['plans'] = plans!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Plan {
  String? sId;
  String? name;
  String? description;
  num? price;
  String? currency;
  String? interval;
  bool? isActive;
  String? stripePriceId;
  String? type;
  List<String>? features;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Plan(
      {this.sId,
      this.name,
      this.description,
      this.price,
      this.currency,
      this.interval,
      this.isActive,
      this.stripePriceId,
      this.type,
      this.features,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Plan.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    
    // Handling price if it's a Map or num
    if (json['price'] is Map) {
      price = json['price']['value'] ?? json['price']['amount'];
    } else {
      price = json['price'];
    }
    
    currency = json['currency'];
    interval = json['interval'];
    isActive = json['isActive'];
    stripePriceId = json['stripePriceId'];
    type = json['type'];
    
    // Handling features safely
    if (json['features'] is List) {
      features = List<String>.from(json['features']);
    } else {
      features = [];
    }
    
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    
    // Handling __v safely
    if (json['__v'] is int) {
      iV = json['__v'];
    } else if (json['__v'] is String) {
      iV = int.tryParse(json['__v']);
    } else if (json['__v'] is Map) {
      iV = json['__v']['value']; // Extra safety
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['currency'] = currency;
    data['interval'] = interval;
    data['isActive'] = isActive;
    data['stripePriceId'] = stripePriceId;
    data['type'] = type;
    data['features'] = features;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
