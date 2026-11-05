import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:thawab/l10n/generated/app_localizations.dart';
import 'package:thawab/core/routing/app_routes.dart';
import 'package:thawab/features/azkar/domain/entities/azkar_category_entity.dart';
import 'package:thawab/features/azkar/domain/entities/zikr_session_entity.dart';
import 'package:thawab/features/azkar/presentation/manager/azkar_categories_cubit/azkar_categories_cubit.dart';
import 'package:thawab/features/azkar/presentation/manager/zikr_session_cubit/zikr_session_cubit.dart';
import 'package:thawab/features/azkar/presentation/widgets/azkar_tab.dart';
import 'package:thawab/core/utils/app_navigation_index.dart';
import 'package:thawab/core/utils/app_spacing.dart';
import 'package:thawab/core/widgets/app_screen.dart';

class AzkarView extends StatelessWidget {
  const AzkarView({super.key, this.session, this.categories = const []});

  final ZikrSessionEntity? session;
  final List<AzkarCategoryEntity> categories;

  @override
  Widget build(
    BuildContext context,
  ) => BlocBuilder<AzkarCategoriesCubit, AzkarCategoryState>(
    builder: (context, categoryState) {
      final strings = S.of(context);
      final loadedCategories =
          categoryState is AzkarCategorySuccess &&
              categoryState.items.isNotEmpty
          ? categoryState.items
          : categories;
      return BlocBuilder<ZikrSessionCubit, ZikrSessionState>(
        builder: (context, sessionState) {
          final loadedSession =
              sessionState is ZikrSessionSuccess &&
                  sessionState.items.isNotEmpty
              ? sessionState.items.first
              : session;
          return AppScreen(
            title: strings.azkarTitle,
            bottomNavigationBar: const AppBottomBar(
              index: AppNavigationIndex.azkar,
            ),
            action: IconButton(
              tooltip: strings.azkarCategories,
              onPressed: () => _openCategories(context, loadedCategories),
              icon: const Icon(Icons.grid_view),
            ),
            children: [
              SegmentedButton<AzkarTab>(
                segments: [
                  ButtonSegment(
                    value: AzkarTab.tasbeeh,
                    icon: Icon(Icons.touch_app_outlined),
                    label: Text(strings.electronicTasbeeh),
                  ),
                  ButtonSegment(
                    value: AzkarTab.categories,
                    icon: Icon(Icons.menu_book_outlined),
                    label: Text(strings.azkarCategories),
                  ),
                ],
                selected: const {AzkarTab.tasbeeh},
                onSelectionChanged: (selection) {
                  if (selection.contains(AzkarTab.categories)) {
                    _openCategories(context, loadedCategories);
                  }
                },
              ),
              SectionTitle(strings.yourTasbeeh),
              FlatCard(
                child: Column(
                  children: [
                    if (loadedSession == null)
                      ContentStateMessage(
                        isLoading:
                            sessionState is ZikrSessionLoading ||
                            sessionState is ZikrSessionInitial,
                        errorMessage: sessionState is ZikrSessionFailure
                            ? sessionState.message
                            : null,
                        emptyMessage: strings.loadZikrToStart,
                      )
                    else
                      Text(
                        loadedSession.text,
                        style: TextStyle(
                          fontSize: 21.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    SizedBox(height: 16.h),
                    SizedBox(
                      width: math.min(176.w, AppSpacing.featureArtworkMaxSize),
                      height: math.min(176.w, AppSpacing.featureArtworkMaxSize),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CircularProgressIndicator(
                            value:
                                loadedSession == null ||
                                    loadedSession.target <= 0
                                ? 0
                                : ((sessionState is ZikrSessionSuccess
                                              ? sessionState.count
                                              : 0) /
                                          loadedSession.target)
                                      .clamp(0, 1)
                                      .toDouble(),
                            strokeWidth: 5.r,
                            color: Theme.of(context).colorScheme.secondary,
                            backgroundColor: Theme.of(context)
                                .colorScheme
                                .surfaceContainerHighest,
                          ),
                          Positioned.fill(
                            child: Padding(
                              padding: EdgeInsets.all(5.r),
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  side: BorderSide.none,
                                ),
                                onPressed: loadedSession == null
                                    ? null
                                    : () => context
                                          .read<ZikrSessionCubit>()
                                          .incrementCount(),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      loadedSession == null
                                          ? '—'
                                          : '${sessionState is ZikrSessionSuccess ? sessionState.count : 0}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall
                                          ?.copyWith(
                                            fontWeight: FontWeight.w700,
                                          ),
                                    ),
                                    Text(
                                      loadedSession == null
                                          ? strings.counter
                                          : strings.countOf(
                                              loadedSession.target,
                                            ),
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () =>
                          context.read<ZikrSessionCubit>().resetCount(),
                      icon: const Icon(Icons.refresh),
                      label: Text(strings.resetCounter),
                    ),
                  ],
                ),
              ),
              SectionTitle(
                strings.azkarCategories,
                trailing: TextButton(
                  onPressed: () => _openCategories(context, loadedCategories),
                  child: Text(strings.viewAll),
                ),
              ),
              if (loadedCategories.isEmpty)
                FlatCard(
                  child: ContentStateMessage(
                    isLoading:
                        categoryState is AzkarCategoryLoading ||
                        categoryState is AzkarCategoryInitial,
                    errorMessage: categoryState is AzkarCategoryFailure
                        ? categoryState.message
                        : null,
                    emptyMessage: strings.azkarUnavailable,
                  ),
                )
              else
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: loadedCategories.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: _gridColumnCount(context),
                    mainAxisSpacing: 12.h,
                    crossAxisSpacing: 12.w,
                    childAspectRatio: 1.35,
                  ),
                  itemBuilder: (context, index) {
                    final category = loadedCategories[index];
                    return Card(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16.r),
                        onTap: () => _openCategories(context, loadedCategories),
                        child: Padding(
                          padding: EdgeInsets.all(14.r),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.auto_awesome_outlined,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              Text(
                                category.name,
                                style: Theme.of(context).textTheme.titleSmall
                                    ?.copyWith(fontWeight: FontWeight.w700),
                              ),
                              Text(
                                strings.azkarEntryCount(category.entryCount),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
            ],
          );
        },
      );
    },
  );

  static void _openCategories(
    BuildContext context,
    List<AzkarCategoryEntity> loadedCategories,
  ) => context.push(AppRoutes.kAzkarCategoriesView, extra: loadedCategories);

  int _gridColumnCount(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width >= AppSpacing.expandedBreakpoint) return 4;
    if (width >= AppSpacing.tabletBreakpoint) return 3;
    return 2;
  }
}
