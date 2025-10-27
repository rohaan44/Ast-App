import 'package:flutter/foundation.dart';

class FlowDataProvider with ChangeNotifier {
  final Map<String, Map<String, dynamic>> _flowData = {};

  Map<String, Map<String, dynamic>> get flowData => _flowData;

  // 🔹 Add or Update Flow
  void addOrUpdateFlow({
    required String flowTag,
    required Map<String, dynamic> data,
  }) {
    if (_flowData.containsKey(flowTag)) {
      _flowData[flowTag] = {..._flowData[flowTag]!, ...data};
    } else {
      _flowData[flowTag] = data;
    }
    notifyListeners();
  }

  // 🔹 Remove a specific key from a flow
  void removeKeyFromFlow({
    required String flowTag,
    required String key,
  }) {
    if (_flowData.containsKey(flowTag)) {
      _flowData[flowTag]!.remove(key);
      notifyListeners();
    }
  }

  // 🔹 Clear a flow entirely
  void clearFlow(String flowTag) {
    _flowData.remove(flowTag);
    notifyListeners();
  }

  // 🔹 Get data of a specific flow
  Map<String, dynamic>? getFlowData(String flowTag) {
    return _flowData[flowTag];
  }

  // 🔹 Reset all
  void clearAllFlows() {
    _flowData.clear();
    notifyListeners();
  }
}
