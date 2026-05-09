import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:inogami_ui/src/widgets/text.dart';

void showMyAnimatedSnackBar({
  required BuildContext context,
  required String dataToDisplay,
  Color? borderColor,
  double borderWidth = 1,
  Color bgColor = Colors.white70,
  bool isAutoDismiss = true,
  bool enableBlurEffect = false,
  Icon? icon,
}) {
  final myColorScheme = Theme.of(context).colorScheme;

  final overlay = Overlay.of(context);

  final overlayEntry = OverlayEntry(
    builder: (context) {
      return Positioned(
        top: 20,
        left: 20,
        right: 20,
        child: TweenAnimationBuilder<Offset>(
          tween: Tween(begin: Offset.zero, end: const Offset(0, 1)),
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOutCubic,
          builder: (context, offset, child) {
            return Transform.translate(offset: offset * 80, child: child);
          },
          child: Material(
            color: Colors.transparent,
            // color: Colors.white,
            child: BackdropFilter(
              enabled: enableBlurEffect,
              filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
              child: Container(
                padding: const EdgeInsets.all(16),
                // padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: borderColor ?? myColorScheme.inversePrimary,
                    width: borderWidth,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: myColorScheme.surfaceContainerHigh,
                      blurRadius: 4,
                      offset: Offset.zero,
                      blurStyle: BlurStyle.outer,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    icon ??
                        Icon(
                          Icons.info_outline_rounded,
                          color: myColorScheme.outline,
                          size: (dataToDisplay.length < 56) ? 26 : 40,
                        ),
                    SizedBox(width: 8),
                    Expanded(child: MyText(text: dataToDisplay, maxLines: 5)),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );

  overlay.insert(overlayEntry);

  // Auto dismiss after 2s
  Future.delayed(const Duration(milliseconds: 3500), () {
    if (isAutoDismiss) {
      overlayEntry.remove();
    }
  });
}
