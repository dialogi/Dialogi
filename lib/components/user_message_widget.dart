import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'user_message_model.dart';
export 'user_message_model.dart';

class UserMessageWidget extends StatefulWidget {
  const UserMessageWidget({
    super.key,
    this.user,
    this.image,
    this.content,
    this.name,
  });

  final bool? user;
  final String? image;
  final String? content;
  final String? name;

  @override
  State<UserMessageWidget> createState() => _UserMessageWidgetState();
}

class _UserMessageWidgetState extends State<UserMessageWidget> {
  late UserMessageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserMessageModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if ((widget.name == 'עומר') && !widget.user!)
              Flexible(
                child: Align(
                  alignment: AlignmentDirectional(1.0, 0.0),
                  child: Container(
                    width: 38.0,
                    height: 38.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(9999.0),
                      child: Image.asset(
                        'assets/images/cropped_image_1.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            if ((widget.name == 'תמר') && !widget.user!)
              Flexible(
                child: Align(
                  alignment: AlignmentDirectional(1.0, 0.0),
                  child: Container(
                    width: 38.0,
                    height: 38.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(9999.0),
                      child: Image.asset(
                        'assets/images/cropped_image_2.png',
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            if ((widget.name == 'יואב') && !widget.user!)
              Flexible(
                child: Align(
                  alignment: AlignmentDirectional(1.0, 0.0),
                  child: Container(
                    width: 38.0,
                    height: 38.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(9999.0),
                      child: Image.asset(
                        'assets/images/cropped_image_4.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            if ((widget.name == 'נועה') && !widget.user!)
              Flexible(
                child: Align(
                  alignment: AlignmentDirectional(1.0, 0.0),
                  child: Container(
                    width: 38.0,
                    height: 38.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(9999.0),
                      child: Image.asset(
                        'assets/images/cropped_image_3.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            if (widget.user ?? true)
              Flexible(
                child: Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Container(
                    width: 38.0,
                    height: 38.0,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      widget.image!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
          ],
        ),
        Flexible(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0),
                      topLeft: Radius.circular(valueOrDefault<double>(
                        widget.user! ? 12.0 : 0.0,
                        0.0,
                      )),
                      topRight: Radius.circular(valueOrDefault<double>(
                        widget.user! ? 0.0 : 12.0,
                        0.0,
                      )),
                    ),
                    shape: BoxShape.rectangle,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      valueOrDefault<String>(
                        widget.content,
                        'hello',
                      ),
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Rubik',
                            color: Color(0xFF546DEF),
                            fontSize: functions.setFontSize(16.0),
                            letterSpacing: 0.0,
                            lineHeight: 1.5,
                          ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ].divide(SizedBox(height: 8.0)),
    );
  }
}
