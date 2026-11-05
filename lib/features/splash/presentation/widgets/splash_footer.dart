import 'package:flutter/material.dart';

class SplashFooter extends StatelessWidget {
  const SplashFooter({
    required this.loadingMessage,
    required this.verse,
    required this.version,
    super.key,
  });

  final String loadingMessage;
  final String verse;
  final String version;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 192,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: LinearProgressIndicator(
              value: null,
              minHeight: 3,
              backgroundColor: colors.outline,
              valueColor: AlwaysStoppedAnimation<Color>(colors.secondary),
            ),
          ),
        ),
        const SizedBox(height: 14),
        Text(
          loadingMessage,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            height: 16 / 12,
            color: colors.onSurfaceVariant,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 31),
        Divider(color: colors.outline, height: 1),
        const SizedBox(height: 17),
        Row(
          textDirection: TextDirection.ltr,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              version,
              style: TextStyle(
                fontSize: 10,
                height: 1.5,
                color: colors.onSurfaceVariant,
              ),
            ),
            Text(
              verse,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: 12,
                height: 1.5,
                color: colors.onSurface,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
