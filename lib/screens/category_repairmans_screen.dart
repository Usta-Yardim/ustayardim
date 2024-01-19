import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ustayardim/api/api.dart';
import 'package:ustayardim/models/category_model.dart';
import 'package:ustayardim/models/repairman_model.dart';
import 'package:ustayardim/widgets/repairman_model_widget.dart';

class CategoryRepairmansScreen extends StatefulWidget {
  const CategoryRepairmansScreen({super.key, required this.categoryModel});

  final CategoryModel categoryModel;

  @override
  State<CategoryRepairmansScreen> createState() => _CategoryRepairmansScreenState();
}

class _CategoryRepairmansScreenState extends State<CategoryRepairmansScreen> {
  ValueNotifier<List<RepairmanModel>> repairmans = ValueNotifier([]);
  ValueNotifier<bool> isLoading = ValueNotifier(true);

  @override
  void initState() {
    _getRepairmans();
    super.initState();
  }

  _getRepairmans() async {
    isLoading.value = true;
    repairmans.value = await Api.getCategoryRepairmans(id: widget.categoryModel.id);
    isLoading.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0,
        title: Text(widget.categoryModel.name),
      ),
      body: ValueListenableBuilder(
          valueListenable: isLoading,
          builder: (context, loading, child) {
            return loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ValueListenableBuilder(
                    valueListenable: repairmans,
                    builder: (context, list, child) {
                      return list.isEmpty
                          ? Center(
                              child: Text("Usta bulunamadı!"),
                            )
                          : ListView.builder(
                              itemCount: list.length,
                              itemBuilder: (context, index) {
                                RepairmanModel repairmanModel = list[index];
                                return RepairmanModalWidget(
                                  repairmanModel: repairmanModel,
                                );
                              });
                    });
          }),
    );
  }
}
