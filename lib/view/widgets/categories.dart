import 'package:flutter/material.dart';
import 'package:super_meat/model.dart';
import 'package:super_meat/utils/constants.dart';
import 'package:super_meat/utils/styledText.dart';

class Categories extends StatelessWidget {
  const Categories(
    this.categories, {
    Key? key,
  }) : super(key: key);

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(vertical: 15),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: categories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 25,
        crossAxisSpacing: 10,
        childAspectRatio: 1.75,
      ),
      itemBuilder: (context, index) {
        var category = categories[index];
        return CategoryCard(category: category);
      },
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.categoryBoxColor,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: AppColor.green)),
      elevation: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            category.image,
            height: 45,
          ),
          StyledText(
            category.name,
            size: 15,
            color: AppColor.darkGrey,
          )
        ],
      ),
    );
  }
}
