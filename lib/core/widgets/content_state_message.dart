import 'package:flutter/material.dart';

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
      return Text(message);
    }
    return Text(emptyMessage);
  }
}
