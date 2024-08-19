import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'walkthrough_component_model.dart';
export 'walkthrough_component_model.dart';

class WalkthroughComponentWidget extends StatefulWidget {
  const WalkthroughComponentWidget({
    super.key,
    required this.title,
  });

  final String? title;

  @override
  State<WalkthroughComponentWidget> createState() =>
      _WalkthroughComponentWidgetState();
}

class _WalkthroughComponentWidgetState
    extends State<WalkthroughComponentWidget> {
  late WalkthroughComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WalkthroughComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20.0, 12.0, 20.0, 0.0),
      child: Container(
        width: double.infinity,
        height: 60.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 5.0,
              color: Color(0x3416202A),
              offset: Offset(
                0.0,
                2.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(12.0),
          shape: BoxShape.rectangle,
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                Icons.info,
                color: FlutterFlowTheme.of(context).primary,
                size: 24.0,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                  child: Text(
                    valueOrDefault<String>(
                      widget!.title,
                      'cssnvkjsdfng',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Plus Jakarta Sans',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 18.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
