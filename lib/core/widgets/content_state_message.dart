import 'package:flutter/material.dart';
import 'package:thawab/core/errors/failure_code.dart';
import 'package:thawab/l10n/generated/app_localizations.dart';

class ContentStateMessage extends StatelessWidget {
  const ContentStateMessage({
    super.key,
    required this.isLoading,
    this.errorMessage,
    required this.emptyMessage,
  });

  final bool isLoading;
  final String? errorMessage;
  final String emptyMessage;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (errorMessage case final message?) {
      final localizedMessage = switch (message) {
        FailureCode.dataSourceUnavailable =>
          S.of(context).dataSourceUnavailable,
        _ => message,
      };
      return Text(localizedMessage);
    }
    return Text(emptyMessage);
  }
}
