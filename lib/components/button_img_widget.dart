import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'button_img_model.dart';
export 'button_img_model.dart';

class ButtonImgWidget extends StatefulWidget {
  const ButtonImgWidget({
    super.key,
    this.text,
    this.imgPath,
    this.color,
    required this.fontSize,
    this.fontColor,
    this.imgWidth,
    bool? imgAsset,
    this.borderColor,
  }) : this.imgAsset = imgAsset ?? false;

  final String? text;
  final String? imgPath;
  final Color? color;
  final double? fontSize;
  final Color? fontColor;
  final double? imgWidth;
  final bool imgAsset;
  final Color? borderColor;

  @override
  State<ButtonImgWidget> createState() => _ButtonImgWidgetState();
}

class _ButtonImgWidgetState extends State<ButtonImgWidget> {
  late ButtonImgModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ButtonImgModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: 48.0,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(
            color: valueOrDefault<Color>(
              widget.borderColor,
              Colors.transparent,
            ),
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.imgAsset)
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: SvgPicture.asset(
                    'assets/images/phone_call.svg',
                    fit: BoxFit.contain,
                  ),
                ),
              if ((widget.imgPath != null && widget.imgPath != '') &&
                  !widget.imgAsset)
                Container(
                  decoration: BoxDecoration(),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(22.0),
                    child: Image.network(
                      '${widget.imgPath}',
                      width: widget.imgWidth,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              Text(
                valueOrDefault<String>(
                  widget.text,
                  'text',
                ),
                style: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Rubik',
                      color: widget.fontColor,
                      fontSize: functions.setFontSize(widget.fontSize!),
                      letterSpacing: 0.0,
                    ),
              ),
            ].divide(SizedBox(width: 10.0)),
          ),
        ),
      ),
    );
  }
}
