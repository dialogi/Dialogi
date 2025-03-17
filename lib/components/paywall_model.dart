import '/flutter_flow/flutter_flow_util.dart';
import 'paywall_widget.dart' show PaywallWidget;
import 'package:flutter/material.dart';

class PaywallModel extends FlutterFlowModel<PaywallWidget> {
  ///  Local state fields for this component.

  List<String> answer = [];
  void addToAnswer(String item) => answer.add(item);
  void removeFromAnswer(String item) => answer.remove(item);
  void removeAtIndexFromAnswer(int index) => answer.removeAt(index);
  void insertAtIndexInAnswer(int index, String item) =>
      answer.insert(index, item);
  void updateAnswerAtIndex(int index, Function(String) updateFn) =>
      answer[index] = updateFn(answer[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
