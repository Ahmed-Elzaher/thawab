import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:thawab/l10n/generated/app_localizations.dart';
import 'package:thawab/core/routing/app_routes.dart';
import 'package:thawab/core/utils/app_spacing.dart';
import 'package:thawab/features/azkar/domain/entities/azkar_category_entity.dart';
import 'package:thawab/features/azkar/presentation/manager/azkar_categories_cubit/azkar_categories_cubit.dart';
import 'package:thawab/features/azkar/presentation/manager/zikr_session_cubit/zikr_session_cubit.dart';
import 'package:thawab/features/azkar/presentation/widgets/azkar_tab.dart';
import 'package:thawab/core/utils/app_navigation_index.dart';
import 'package:thawab/core/widgets/app_screen.dart';

class AzkarCategoriesView extends StatefulWidget {
  const AzkarCategoriesView({
    super.key,
    this.categories = const [],
    this.selectedCategory,
  });

  final List<AzkarCategoryEntity> categories;
  final AzkarCategoryEntity? selectedCategory;

  @override
  State<AzkarCategoriesView> createState() => _AzkarCategoriesViewState();
}

class _AzkarCategoriesViewState extends State<AzkarCategoriesView> {
  String _query = '';

  @override
  Widget build(
    BuildContext context,
  ) => BlocBuilder<AzkarCategoriesCubit, AzkarCategoryState>(
    builder: (context, state) {
      final strings = S.of(context);
      final loadedCategories =
          state is AzkarCategorySuccess && state.items.isNotEmpty
          ? state.items
          : widget.categories;
      final filteredCategories = loadedCategories
          .where((category) => category.name.contains(_query))
          .toList();
      return BlocBuilder<ZikrSessionCubit, ZikrSessionState>(
        builder: (context, sessionState) {
          final selectedCategory = widget.selectedCategory;
          final categorySessions =
              selectedCategory == null || sessionState is! ZikrSessionSuccess
              ? const []
              : sessionState.items
                    .where((item) => item.categoryId == selectedCategory.id)
                    .toList();
          return AppScreen(
            title: selectedCategory?.name ?? strings.azkarCategories,
            bottomNavigationBar: const AppBottomBar(
              index: AppNavigationIndex.azkar,
            ),
            children: selectedCategory != null
                ? [
                    if (categorySessions.isEmpty)
                      FlatCard(
                        child: ContentStateMessage(
                          isLoading:
                              sessionState is ZikrSessionLoading ||
                              sessionState is ZikrSessionInitial,
                          errorMessage: sessionState is ZikrSessionFailure
                              ? sessionState.message
                              : null,
                          emptyMessage: strings.azkarSearchEmpty,
                        ),
                      )
                    else
                      ...categorySessions.map(
                        (session) => Card(
                          child: Padding(
                            padding: EdgeInsets.all(AppSpacing.large.r),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  session.text,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium,
                                ),
                                SizedBox(height: AppSpacing.small.h),
                                Text(
                                  strings.countOf(session.target),
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ]
                : [
                    SegmentedButton<AzkarTab>(
                      segments: [
                        ButtonSegment(
                          value: AzkarTab.tasbeeh,
                          icon: const Icon(Icons.touch_app_outlined),
                          label: Text(strings.electronicTasbeeh),
                        ),
                        ButtonSegment(
                          value: AzkarTab.categories,
                          icon: const Icon(Icons.menu_book_outlined),
                          label: Text(strings.azkarCategories),
                        ),
                      ],
                      selected: const {AzkarTab.categories},
                      onSelectionChanged: (selection) {
                        if (selection.contains(AzkarTab.tasbeeh)) {
                          context.go(AppRoutes.kAzkarView);
                        }
                      },
                    ),
                    TextField(
                      onChanged: (value) => setState(() => _query = value),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: strings.azkarSearchHint,
                      ),
                    ),
                    SectionTitle(
                      strings.mainCategories,
                      trailing: Text('${filteredCategories.length}'),
                    ),
                    if (loadedCategories.isEmpty)
                      FlatCard(
                        child: ContentStateMessage(
                          isLoading:
                              state is AzkarCategoryLoading ||
                              state is AzkarCategoryInitial,
                          errorMessage: state is AzkarCategoryFailure
                              ? state.message
                              : null,
                          emptyMessage: strings.azkarUnavailable,
                        ),
                      )
                    else if (filteredCategories.isEmpty)
                      FlatCard(child: Text(strings.azkarSearchEmpty))
                    else
                      ...filteredCategories.map(
                        (category) => Card(
                          child: ListTile(
                            onTap: () => context.push(
                              AppRoutes.kAzkarCategoriesView,
                              extra: category,
                            ),
                            leading: CircleAvatar(
                              backgroundColor: Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withValues(alpha: .12),
                              child: Icon(
                                Icons.favorite_border,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                            title: Text(category.name),
                            subtitle: Text(
                              strings.azkarEntryCount(category.entryCount),
                            ),
                          ),
                        ),
                      ),
                  ],
          );
        },
      );
    },
  );
}
