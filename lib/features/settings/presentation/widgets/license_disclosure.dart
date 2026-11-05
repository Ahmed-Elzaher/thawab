import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thawab/l10n/generated/app_localizations.dart';

class LicenseDisclosure extends StatelessWidget {
  const LicenseDisclosure({
    super.key,
    required this.title,
    required this.subtitle,
    required this.sourceUrl,
    required this.licenseAssetPath,
  });

  final String title;
  final String subtitle;
  final String sourceUrl;
  final String licenseAssetPath;

  @override
  Widget build(BuildContext context) => ExpansionTile(
    leading: Icon(
      Icons.article_outlined,
      color: Theme.of(context).colorScheme.secondary,
    ),
    title: Text(title),
    subtitle: Text(subtitle),
    childrenPadding: EdgeInsetsDirectional.fromSTEB(16.w, 0, 16.w, 16.h),
    children: [
      Align(
        alignment: AlignmentDirectional.centerStart,
        child: SelectableText(sourceUrl),
      ),
      SizedBox(height: 8.h),
      FutureBuilder<String>(
        future: rootBundle.loadString(licenseAssetPath),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(S.of(context).dataSourceUnavailable);
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return SelectableText(
            snapshot.data!,
            style: Theme.of(context).textTheme.bodySmall,
          );
        },
      ),
    ],
  );
}
