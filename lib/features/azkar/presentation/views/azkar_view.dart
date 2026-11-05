import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:thawab/core/routing/app_routes.dart';
import 'package:thawab/features/azkar/data/models/azkar_category_model.dart';
import 'package:thawab/features/azkar/data/models/zikr_session_model.dart';
import 'package:thawab/features/azkar/presentation/manager/azkar_categories_cubit/azkar_categories_cubit.dart';
import 'package:thawab/features/azkar/presentation/manager/zikr_session_cubit/zikr_session_cubit.dart';
import 'package:thawab/core/widgets/app_screen.dart';

class AzkarView extends StatelessWidget {
  const AzkarView({super.key, this.session, this.categories = const []});

  final ZikrSessionModel? session;
  final List<AzkarCategoryModel> categories;

  @override
  Widget build(
    BuildContext context,
  ) => BlocBuilder<AzkarCategoriesCubit, AzkarCategoryState>(
    builder: (context, categoryState) {
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
            title: 'الأذكار والمسبحة',
            bottomNavigationBar: const AppBottomBar(index: 3),
            action: IconButton(
              tooltip: 'أقسام الأذكار',
              onPressed: () => _openCategories(context, loadedCategories),
              icon: const Icon(Icons.grid_view),
            ),
            children: [
              SegmentedButton<String>(
                segments: const [
                  ButtonSegment(
                    value: 'counter',
                    icon: Icon(Icons.touch_app_outlined),
                    label: Text('المسبحة الإلكترونية'),
                  ),
                  ButtonSegment(
                    value: 'categories',
                    icon: Icon(Icons.menu_book_outlined),
                    label: Text('أقسام الأذكار'),
                  ),
                ],
                selected: const {'counter'},
                onSelectionChanged: (selection) {
                  if (selection.contains('categories')) {
                    _openCategories(context, loadedCategories);
                  }
                },
              ),
              const SectionTitle('مسبحتك'),
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
                        emptyMessage: 'حمّل ذِكرًا للبدء',
                      )
                    else
                      Text(
                        loadedSession.text,
                        style: const TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: 176,
                      height: 176,
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
                            strokeWidth: 5,
                            color: Theme.of(context).colorScheme.secondary,
                            backgroundColor: Theme.of(context)
                                .colorScheme
                                .surfaceContainerHighest,
                          ),
                          Positioned.fill(
                            child: Padding(
                              padding: const EdgeInsets.all(5),
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
                                          ? 'العداد'
                                          : 'من أصل ${loadedSession.target}',
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
                      label: const Text('إعادة العداد'),
                    ),
                  ],
                ),
              ),
              SectionTitle(
                'أقسام الأذكار',
                trailing: TextButton(
                  onPressed: () => _openCategories(context, loadedCategories),
                  child: const Text('عرض الكل'),
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
                    emptyMessage: 'ستظهر أقسام الأذكار بعد تحميلها.',
                  ),
                )
              else
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: loadedCategories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1.35,
                  ),
                  itemBuilder: (context, index) {
                    final category = loadedCategories[index];
                    return Card(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () => _openCategories(context, loadedCategories),
                        child: Padding(
                          padding: const EdgeInsets.all(14),
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
                                category.description,
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
    List<AzkarCategoryModel> loadedCategories,
  ) => context.push(AppRoutes.kAzkarCategoriesView, extra: loadedCategories);
}
