class GetDailyNutrition {
  final bool success;
  final NutritionData? data;
  final String? error;

  GetDailyNutrition({
    required this.success,
    this.data,
    this.error,
  });

  factory GetDailyNutrition.fromJson(Map<String, dynamic> json) {
    return GetDailyNutrition(
      success: json['success'] as bool,
      data: json['data'] != null ? NutritionData.fromJson(json['data']) : null,
      error: json['error'] as String?,
    );
  }
}

class NutritionData {
  final Nutrition calories;
  final Nutrition protein;
  final Nutrition carbs;
  final Nutrition fats;

  NutritionData({
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fats,
  });

  factory NutritionData.fromJson(Map<String, dynamic> json) {
    return NutritionData(
      calories: Nutrition.fromJson(json['calories']),
      protein: Nutrition.fromJson(json['protein']),
      carbs: Nutrition.fromJson(json['carbs']),
      fats: Nutrition.fromJson(json['fats']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "calories": calories.toJson(),
      "protein": protein.toJson(),
      "carbs": carbs.toJson(),
      "fats": fats.toJson(),
    };
  }
}

class Nutrition {
  final int consumed;
  final int goal;
  final int percentage;

  Nutrition({
    required this.consumed,
    required this.goal,
    required this.percentage,
  });

  factory Nutrition.fromJson(Map<String, dynamic> json) {
    return Nutrition(
      consumed: json['consumed'],
      goal: json['goal'],
      percentage: json['percentage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "consumed": consumed,
      "goal": goal,
      "percentage": percentage,
    };
  }
}
