import 'package:flutter/material.dart';
import 'package:ustayardim/models/category_model.dart';
import 'package:ustayardim/models/repairman_model.dart';
import 'package:ustayardim/widgets/repairman_model_widget.dart';

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
      appBar: AppBar(centerTitle: false,titleSpacing: 0,title: Text(widget.categoryModel.name),),
      body: ListView.builder(
          itemCount: widget.categoryModel.repairmans.length,
          itemBuilder: (context, index) {
            RepairmanModel repairmanModel = widget.categoryModel.repairmans[index];
            return RepairmanModalWidget(repairmanModel: repairmanModel,);
          }),
    );
  }
}
