import 'package:flutter/material.dart';
import 'package:ustayardim/models/category_model.dart';

class CategoryRepairmansScreen extends StatefulWidget {
  const CategoryRepairmansScreen({super.key, required this.categoryModel});

  final CategoryModel categoryModel;

  @override
  State<CategoryRepairmansScreen> createState() =>
      _CategoryRepairmansScreenState();
}

class _CategoryRepairmansScreenState extends State<CategoryRepairmansScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: widget.categoryModel.repairmans.length,
          itemBuilder: (context, index) {}),
    );
  }
}
