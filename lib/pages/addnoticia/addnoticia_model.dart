import '/flutter_flow/flutter_flow_util.dart';
import 'addnoticia_widget.dart' show AddnoticiaWidget;
import 'package:flutter/material.dart';

class AddnoticiaModel extends FlutterFlowModel<AddnoticiaWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for titulo widget.
  FocusNode? tituloFocusNode;
  TextEditingController? tituloController;
  String? Function(BuildContext, String?)? tituloControllerValidator;
  // State field(s) for Contenido widget.
  FocusNode? contenidoFocusNode;
  TextEditingController? contenidoController;
  String? Function(BuildContext, String?)? contenidoControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    tituloFocusNode?.dispose();
    tituloController?.dispose();

    contenidoFocusNode?.dispose();
    contenidoController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
