import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'button_phone_model.dart';
export 'button_phone_model.dart';

class ButtonPhoneWidget extends StatefulWidget {
  const ButtonPhoneWidget({
    super.key,
    this.text,
  });

  final String? text;

  @override
  State<ButtonPhoneWidget> createState() => _ButtonPhoneWidgetState();
}

class _ButtonPhoneWidgetState extends State<ButtonPhoneWidget> {
  late ButtonPhoneModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ButtonPhoneModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: 48.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primary,
        boxShadow: const [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x33000000),
            offset: Offset(
              0.0,
              2.0,
            ),
            spreadRadius: 0.0,
          )
        ],
        borderRadius: BorderRadius.circular(56.0),
      ),
    );
  }
}
