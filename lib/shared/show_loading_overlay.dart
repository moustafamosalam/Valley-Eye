import 'package:flutter/material.dart';

class LoadingOverlay {
  final BuildContext context;
  late final OverlayEntry _overlayEntry;

  LoadingOverlay(this.context) {
    _overlayEntry = OverlayEntry(
      builder: (_) => Stack(
        children: [
          // Semi-transparent background
          Container( color: Colors.black54 ),
          // Centered loading spinner
          const Center(child: CircularProgressIndicator( color: Colors.grey),),
        ],
      ),
    );
  }

  /// Show the loading overlay
  void show() {
    Overlay.of(context).insert(_overlayEntry);
  }

  /// Hide the loading overlay
  void hide() {
    _overlayEntry.remove();
  }
}