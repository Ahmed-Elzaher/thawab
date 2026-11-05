import 'package:flutter/material.dart';

class SplashOrnamentalDivider extends StatelessWidget {
  const SplashOrnamentalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 44, child: Divider(color: colors.outline)),
        const SizedBox(width: 8),
        Transform.rotate(
          angle: .785398,
          child: SizedBox(
            width: 6,
            height: 6,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: colors.surface,
                border: Border.all(color: colors.secondary),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(width: 44, child: Divider(color: colors.outline)),
      ],
    );
  }
}
