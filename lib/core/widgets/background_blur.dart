import 'package:flutter/material.dart';
import 'package:portfolio/core/extenstion/extenstions.dart';
import 'package:portfolio/style/app_instes.dart';

class BackgroundBlur extends StatelessWidget {
  const BackgroundBlur({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: -(context.width * .5 * .5),
      top: (-(context.width * .5 * .5)) + Instes.xxxl,
      child: Container(
        width: context.width * .5,
        height: context.height * .5,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: context.colorScheme.primary.withValues(alpha: .4),
              spreadRadius: 100,
              blurRadius: 200,
            ),
          ],
        ),
      ),
    );
  }
}
