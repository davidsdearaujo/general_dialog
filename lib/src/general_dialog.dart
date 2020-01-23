import 'package:flutter/material.dart';

import 'general_dialog_controller.dart';

class GeneralDialog extends StatefulWidget {
  final Widget child;

  const GeneralDialog({Key key, this.child}) : super(key: key);
  @override
  _GeneralDialogState createState() => _GeneralDialogState();
}

class _GeneralDialogState extends State<GeneralDialog>
    with GeneralDialogController {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  Widget overlayEntry(Widget child) {
    return Container(
      color: Colors.black26,
      child: child,
    );
  }
}
