class CheckInsResponseData {
  List<CheckInItem>? checkIns;
  Pagination? pagination;

  CheckInsResponseData({this.checkIns, this.pagination});

  CheckInsResponseData.fromJson(Map<String, dynamic> json) {
    if (json['checkIns'] != null) {
      checkIns = <CheckInItem>[];
      json['checkIns'].forEach((v) {
        checkIns!.add(CheckInItem.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (checkIns != null) {
      data['checkIns'] = checkIns!.map((v) => v.toJson()).toList();
    }
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    return data;
  }
}

class CheckInItem {
  UnitValue? weight;
  UnitValue? bodyMeasurements;
  String? sId;
  Athlete? athlete;
  String? date;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? notes;

  CheckInItem(
      {this.weight,
      this.bodyMeasurements,
      this.sId,
      this.athlete,
      this.date,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.notes});

  CheckInItem.fromJson(Map<String, dynamic> json) {
    weight = json['weight'] != null ? UnitValue.fromJson(json['weight']) : null;
    bodyMeasurements = json['bodyMeasurements'] != null
        ? UnitValue.fromJson(json['bodyMeasurements'])
        : null;
    sId = json['_id'];
    athlete =
        json['athlete'] != null ? Athlete.fromJson(json['athlete']) : null;
    date = json['date'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    notes = json['notes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (weight != null) {
      data['weight'] = weight!.toJson();
    }
    if (bodyMeasurements != null) {
      data['bodyMeasurements'] = bodyMeasurements!.toJson();
    }
    data['_id'] = sId;
    if (athlete != null) {
      data['athlete'] = athlete!.toJson();
    }
    data['date'] = date;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['notes'] = notes;
    return data;
  }
}

class UnitValue {
  String? unit;
  dynamic value;

  UnitValue({this.unit, this.value});

  UnitValue.fromJson(Map<String, dynamic> json) {
    unit = json['unit'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['unit'] = unit;
    data['value'] = value;
    return data;
  }
}

class Athlete {
  String? sId;

  Athlete({this.sId});

  Athlete.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    return data;
  }
}

class Pagination {
  int? page;
  int? limit;
  int? total;
  int? pages;

  Pagination({this.page, this.limit, this.total, this.pages});

  Pagination.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    limit = json['limit'];
    total = json['total'];
    pages = json['pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['limit'] = limit;
    data['total'] = total;
    data['pages'] = pages;
    return data;
  }
}
