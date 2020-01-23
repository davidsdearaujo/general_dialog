import 'dart:async';

import 'package:flutter/cupertino.dart';

mixin GeneralDialogController<T extends StatefulWidget> on State<T> {
  OverlayEntry _overlayEntry;
  static final _child$ = StreamController<Widget>.broadcast();

  static showDialog(Widget child) {
    _child$.add(child);
  }

  @override
  void initState() {
    _child$.stream.listen((child) {
      if (child != null) {
        this._overlayEntry = OverlayEntry(
          builder: (context) => this.overlayEntry(child),
        );
        Overlay.of(context).insert(this._overlayEntry);
      } else {
        this._overlayEntry.remove();
      }
    });

    super.initState();
  }

  static void hideDialog() {
    _child$.add(null);
  }

  Widget overlayEntry(Widget child);

  @override
  void dispose() {
    _child$.close();
    super.dispose();
  }
}
