import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  int _questionNum = 1;
  int get questionNum => _questionNum;
  set questionNum(int value) {
    _questionNum = value;
  }

  DateTime? _weekAgo;
  DateTime? get weekAgo => _weekAgo;
  set weekAgo(DateTime? value) {
    _weekAgo = value;
  }

  bool _lessonEnable = false;
  bool get lessonEnable => _lessonEnable;
  set lessonEnable(bool value) {
    _lessonEnable = value;
  }

  SubscriptionDetailsStruct _userSub =
      SubscriptionDetailsStruct.fromSerializableMap(jsonDecode(
          '{\"subId\":\"0\",\"name\":\"0\",\"frequencyPerWeek\":\"0\",\"lessonLimit\":\"0\"}'));
  SubscriptionDetailsStruct get userSub => _userSub;
  set userSub(SubscriptionDetailsStruct value) {
    _userSub = value;
  }

  void updateUserSubStruct(Function(SubscriptionDetailsStruct) updateFn) {
    updateFn(_userSub);
  }

  DialogState? _dialogState = DialogState.processing;
  DialogState? get dialogState => _dialogState;
  set dialogState(DialogState? value) {
    _dialogState = value;
  }

  String _userInput = '';
  String get userInput => _userInput;
  set userInput(String value) {
    _userInput = value;
  }

  bool _onLesson = false;
  bool get onLesson => _onLesson;
  set onLesson(bool value) {
    _onLesson = value;
  }

  String _log = '';
  String get log => _log;
  set log(String value) {
    _log = value;
  }

  bool _onHold = false;
  bool get onHold => _onHold;
  set onHold(bool value) {
    _onHold = value;
  }

  bool _startPopup = false;
  bool get startPopup => _startPopup;
  set startPopup(bool value) {
    _startPopup = value;
  }

  bool _interruption = false;
  bool get interruption => _interruption;
  set interruption(bool value) {
    _interruption = value;
  }

  final _getTeachersManager = FutureRequestManager<List<TeachersRecord>>();
  Future<List<TeachersRecord>> getTeachers({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<TeachersRecord>> Function() requestFn,
  }) =>
      _getTeachersManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGetTeachersCache() => _getTeachersManager.clear();
  void clearGetTeachersCacheKey(String? uniqueKey) =>
      _getTeachersManager.clearRequest(uniqueKey);
}
