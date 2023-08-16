import 'dart:ui';

import 'package:flutter/material.dart';

class GlassMorphism extends StatelessWidget {
  final Widget? child;
  final BorderRadiusGeometry? borderRadius;
  final double? sigmaX;
  final double? sigmaY;
  const GlassMorphism({
    super.key,
    this.child,
    this.borderRadius,
    this.sigmaX,
    this.sigmaY,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: sigmaX ?? 20,
          sigmaY: sigmaY ?? 12,
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.008),
            borderRadius: borderRadius ?? BorderRadius.zero,
            border: Border.all(
              width: 1.5,
              color: Colors.white.withOpacity(0.08),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
