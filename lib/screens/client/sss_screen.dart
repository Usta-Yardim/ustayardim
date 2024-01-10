import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ustayardim/global/global.dart';
import 'package:ustayardim/models/sss_model.dart';

class SSSScrean extends StatefulWidget {
  const SSSScrean({super.key});

  @override
  State<SSSScrean> createState() => _SSSScreanState();
}

class _SSSScreanState extends State<SSSScrean> {
  ValueNotifier<List<int>> openedIndexes = ValueNotifier([]);

  List<SSSModel> sssModels = [
    SSSModel(
        title: "Usta Yardım nedir?",
        content:
            "Usta Yardım, kolayca usta çağırabileceğiniz bir hizmettir. Usta yardım üzerinden istediğiniz her kategoride bulabileceğiniz ustaları çağırabilirsiniz.")

,    SSSModel(
        title: "Usta Yardım nasıl kullanılır?",
        content:
        "Usta Yardım, kolayca usta çağırabileceğiniz bir hizmettir. Usta yardım üzerinden istediğiniz her kategoride bulabileceğiniz ustaları çağırabilirsiniz.")

  ];

  Widget _buildItem({required SSSModel sssModel}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all()),
      child: Column(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              int index = sssModels.indexOf(sssModel);
              if (openedIndexes.value.contains(index)) {
                openedIndexes.value.remove(index);
              } else {
                openedIndexes.value.add(index);
              }
              openedIndexes.notifyListeners();
            },
            child: Container(
              width: width * 0.9,
              height: 50,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            sssModel.title,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          )),
                    ),
                  ),
                  AnimatedRotation(
                    turns: openedIndexes.value.contains(sssModels.indexOf(sssModel)) ? 0 : -0.25,
                    duration: Duration(milliseconds: 300),
                    child: Icon(Icons.keyboard_arrow_down_rounded),
                  )
                ],
              ),
            ),
          ),
          AnimatedCrossFade(
            firstChild: Container(),
            secondChild: Container(
              width: width * 0.9,
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(sssModel.content),
            ),
            crossFadeState: openedIndexes.value.contains(sssModels.indexOf(sssModel))
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: Duration(milliseconds: 300),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("S.S.S"),
        scrolledUnderElevation: 0,
      ),
      body: ValueListenableBuilder(
          valueListenable: openedIndexes,
          builder: (context, indexes, child) {
            return ListView.separated(
              itemCount: sssModels.length,
              padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: 20),
              separatorBuilder: (context,index){
                return SizedBox(height: 10,);
              },
              itemBuilder: (context, index) {
                return _buildItem(sssModel: sssModels[index]);
              },
            );
          }),
    );
  }
}
