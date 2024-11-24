import '/components/button_img_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for buttonImg component.
  late ButtonImgModel buttonImgModel1;
  // Model for buttonImg component.
  late ButtonImgModel buttonImgModel2;

  @override
  void initState(BuildContext context) {
    buttonImgModel1 = createModel(context, () => ButtonImgModel());
    buttonImgModel2 = createModel(context, () => ButtonImgModel());
  }

  @override
  void dispose() {
    buttonImgModel1.dispose();
    buttonImgModel2.dispose();
  }
}
