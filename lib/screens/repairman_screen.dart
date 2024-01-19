import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:ustayardim/global/global.dart';
import 'package:ustayardim/models/repairman_model.dart';
import 'package:ustayardim/theme/theme.dart';

class RepairmanScreen extends StatefulWidget {
  const RepairmanScreen({
    super.key,
    required this.repairmanModel,
  });

  final RepairmanModel repairmanModel;

  @override
  State<RepairmanScreen> createState() => _RepairmanScreenState();
}

class _RepairmanScreenState extends State<RepairmanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
      ),
      body: Container(
        width: width,
        height: height,
        child: Stack(
          children: [
            Positioned(
                child: Container(
              width: width,
              height: width / 2,
              child: widget.repairmanModel.photoUrl == null
                  ? Image.asset(
                      "assets/images/placeholder.png",
                      fit: BoxFit.fitHeight,
                    )
                  : Image.network(widget.repairmanModel.photoUrl!, fit: BoxFit.fitHeight),
            )),
            Container(
              width: width,
              height: height,
              child: ListView(
                physics: ClampingScrollPhysics(),
                children: [
                  SizedBox(
                    height: width / 2 - 10,
                  ),
                  Container(
                    width: width,
                    height: height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: Container(
                                width: width * 0.7,
                                child: FittedBox(
                                  child: Text(
                                    widget.repairmanModel.name,
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: width * 0.9,
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                          "${widget.repairmanModel.ilceModel == null ? "" : widget.repairmanModel.ilceModel!.name} ${widget.repairmanModel.ilceModel != null ? "/" : ""} ${widget.repairmanModel.ilModel == null ? "" : widget.repairmanModel.ilModel!.name}")),
                                  Expanded(
                                      child: Center(
                                    child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                            minimumSize: Size.zero,
                                            backgroundColor: Colors.white,
                                            side: BorderSide(color: Colors.green),
                                            padding: EdgeInsets.all(5),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(40))),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle, color: Colors.green),
                                                padding: EdgeInsets.all(5),
                                                child: Icon(
                                                  Icons.call_rounded,
                                                  size: 15,
                                                )),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              widget.repairmanModel.phoneNumber,
                                              style: TextStyle(color: Colors.green),
                                            ),
                                          ],
                                        )),
                                  ))
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            widget.repairmanModel.aboutMe == null
                                ? Container()
                                : Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text("Hakkında",
                                            style: TextStyle(
                                                fontSize: 18, fontWeight: FontWeight.bold)),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(widget.repairmanModel.aboutMe!),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                            widget.repairmanModel.referanceImages.isEmpty
                                ? Container()
                                : Column(
                                    children: [
                                      GridView.builder(
                                          shrinkWrap: true,
                                          physics: NeverScrollableScrollPhysics(),
                                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 20,
                                              mainAxisSpacing: 20),
                                          itemCount: widget.repairmanModel.referanceImages.length,
                                          itemBuilder: (context, index) {
                                            return FullScreenWidget(
                                              disposeLevel: DisposeLevel.Medium,
                                              child: Hero(
                                                tag: "tag${index}",
                                                child: Image.network(
                                                  widget.repairmanModel.referanceImages[index],
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            );
                                          })
                                    ],
                                  )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
