class GetMyProfile {
  bool? success;
  String? error;
  Data? data;

  GetMyProfile({this.success, this.data});

  GetMyProfile.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
   final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['error'] = error;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Profile? profile;

  Data({this.profile});

  Data.fromJson(Map<String, dynamic> json) {
    profile =
        json['profile'] != null ? Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    return {
      if (profile != null) 'profile': profile!.toJson(),
    };
  }
}

class Profile {
  Height? height;
  Weight? weight;
  OnboardingSteps? onboardingSteps;
  String? sId;
  String? user;
  dynamic avatar; // changed from Null?
  List<String>? fitnessGoals;
  bool? onboardingCompleted;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? gender;
  String? dateOfBirth;
  String? bio;
  String? fullName;
  String? id;

  Profile({
    this.height,
    this.weight,
    this.onboardingSteps,
    this.sId,
    this.user,
    this.avatar,
    this.fitnessGoals,
    this.onboardingCompleted,
    this.createdAt,
    this.updatedAt,
    this.iV,
    this.gender,
    this.dateOfBirth,
    this.bio,
    this.fullName,
    this.id,
  });

  Profile.fromJson(Map<String, dynamic> json) {
    height =
        json['height'] != null ? Height.fromJson(json['height']) : null;
    weight =
        json['weight'] != null ? Weight.fromJson(json['weight']) : null;
    onboardingSteps = json['onboardingSteps'] != null
        ? OnboardingSteps.fromJson(json['onboardingSteps'])
        : null;

    sId = json['_id'];
    user = json['user'];
    avatar = json['avatar']; // can be null safely
    fitnessGoals = json['fitnessGoals'] != null
        ? List<String>.from(json['fitnessGoals'])
        : null;

    onboardingCompleted = json['onboardingCompleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    gender = json['gender'];
    dateOfBirth = json['dateOfBirth'];
    bio = json['bio'];
    fullName = json['fullName'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    return {
      if (height != null) 'height': height!.toJson(),
      if (weight != null) 'weight': weight!.toJson(),
      if (onboardingSteps != null)
        'onboardingSteps': onboardingSteps!.toJson(),
      '_id': sId,
      'user': user,
      'avatar': avatar,
      'fitnessGoals': fitnessGoals,
      'onboardingCompleted': onboardingCompleted,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': iV,
      'gender': gender,
      'dateOfBirth': dateOfBirth,
      'bio': bio,
      'fullName': fullName,
      'id': id,
    };
  }
}

class Height {
  double? value;
  String? unit;

  Height({this.value, this.unit});

  Height.fromJson(Map<String, dynamic> json) {
    value = (json['value'] as num?)?.toDouble();
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() => {
        'value': value,
        'unit': unit,
      };
}

class Weight {
  int? value;
  String? unit;

  Weight({this.value, this.unit});

  Weight.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() => {
        'value': value,
        'unit': unit,
      };
}

class OnboardingSteps {
  bool? gender;
  bool? dateOfBirth;
  bool? bodyMetrics;
  bool? fitnessGoals;

  OnboardingSteps({
    this.gender,
    this.dateOfBirth,
    this.bodyMetrics,
    this.fitnessGoals,
  });

  OnboardingSteps.fromJson(Map<String, dynamic> json) {
    gender = json['gender'];
    dateOfBirth = json['dateOfBirth'];
    bodyMetrics = json['bodyMetrics'];
    fitnessGoals = json['fitnessGoals'];
  }

  Map<String, dynamic> toJson() => {
        'gender': gender,
        'dateOfBirth': dateOfBirth,
        'bodyMetrics': bodyMetrics,
        'fitnessGoals': fitnessGoals,
      };
}
