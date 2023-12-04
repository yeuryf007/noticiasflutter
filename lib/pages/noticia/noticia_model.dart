import '/flutter_flow/flutter_flow_util.dart';
import 'noticia_widget.dart' show NoticiaWidget;
import 'package:flutter/material.dart';

class NoticiaModel extends FlutterFlowModel<NoticiaWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Comentario widget.
  FocusNode? comentarioFocusNode;
  TextEditingController? comentarioController;
  String? Function(BuildContext, String?)? comentarioControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    comentarioFocusNode?.dispose();
    comentarioController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
