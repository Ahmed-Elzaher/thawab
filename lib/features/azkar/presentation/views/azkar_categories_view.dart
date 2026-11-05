import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:thawab/core/routing/app_routes.dart';
import 'package:thawab/features/azkar/data/models/azkar_category_model.dart';
import 'package:thawab/core/utils/app_colors.dart';
import 'package:thawab/features/azkar/presentation/manager/azkar_categories_cubit/azkar_categories_cubit.dart';
import 'package:thawab/core/widgets/app_screen.dart';

class AzkarCategoriesView extends StatefulWidget {
  const AzkarCategoriesView({super.key, this.categories = const []});

  final List<AzkarCategoryModel> categories;

  @override
  State<AzkarCategoriesView> createState() => _AzkarCategoriesViewState();
}

class _AzkarCategoriesViewState extends State<AzkarCategoriesView> {
  String _query = '';

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<AzkarCategoriesCubit, AzkarCategoryState>(
        builder: (context, state) {
          final loadedCategories =
              state is AzkarCategorySuccess && state.items.isNotEmpty
              ? state.items
              : widget.categories;
          final filteredCategories = loadedCategories
              .where((category) => category.name.contains(_query))
              .toList();
          return AppScreen(
            title: 'أقسام الأذكار',
            bottomNavigationBar: const AppBottomBar(index: 3),
            backgroundColor: AppColors.prayerBackground,
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
                selected: const {'categories'},
                onSelectionChanged: (selection) {
                  if (selection.contains('counter')) {
                    context.go(AppRoutes.kAzkarView);
                  }
                },
              ),
              TextField(
                textDirection: TextDirection.rtl,
                onChanged: (value) => setState(() => _query = value),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'ابحث في الأذكار والأدعية...',
                ),
              ),
              SectionTitle(
                'الأقسام الرئيسية',
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
                    emptyMessage: 'ستظهر الأقسام بعد تحميل بيانات الأذكار.',
                  ),
                )
              else if (filteredCategories.isEmpty)
                const FlatCard(child: Text('لا توجد أقسام مطابقة للبحث.'))
              else
                ...filteredCategories.map(
                  (category) => Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(context).colorScheme.secondary
                            .withValues(alpha: .12),
                        child: Icon(
                          Icons.favorite_border,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      title: Text(category.name),
                      subtitle: Text(category.description),
                    ),
                  ),
                ),
            ],
          );
        },
      );
}
