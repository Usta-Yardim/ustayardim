import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ustayardim/global/global.dart';
import 'package:ustayardim/helpers/adress_helper.dart';
import 'package:ustayardim/helpers/snack_bar_helper.dart';
import 'package:ustayardim/models/il_model.dart';
import 'package:ustayardim/models/ilce_model.dart';

class PersonalInformationsScreen extends StatefulWidget {
  const PersonalInformationsScreen({super.key});

  @override
  State<PersonalInformationsScreen> createState() => _PersonalInformationsScreenState();
}

class _PersonalInformationsScreenState extends State<PersonalInformationsScreen> {

  ValueNotifier<IlModel?> selectedIl = ValueNotifier(null);
  ValueNotifier<IlceModel?> selectedIlce = ValueNotifier(null);

  TextEditingController dateOfBirthController = TextEditingController();


  @override
  void initState() {
    dateOfBirthController.text = "25/07/2001";
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: Text("Kişisel Bilgiler"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: width*0.05),
        children: [
          SizedBox(height: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Hakkında",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              TextField(maxLines: 3,),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Doğum günü",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              TextField(controller: dateOfBirthController,maxLines: 1,enabled: false,),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "İl",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Consumer<AdressHelper>(
                  builder: (context, adressHelper, child) {
                    return ValueListenableBuilder(
                      valueListenable: selectedIl,
                      builder: (context, selected, child) {
                        return DropdownButtonFormField(
                          value: selected,
                          items: adressHelper.iller
                              .map(
                                (e) => DropdownMenuItem(
                              value: e,
                              child: Text(e.name),
                            ),
                          )
                              .toList(),
                          onChanged: (v) {
                            selectedIlce.value = null;
                            selectedIl.value = v;
                            if (selectedIl.value != null){
                              adressHelper.getIlceler(ilId: selectedIl.value!.id);
                            }
                          },
                        );
                      },
                    );
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "İlçe",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Consumer<AdressHelper>(
                  builder: (context, adressHelper, child) {
                    return ValueListenableBuilder(
                      valueListenable: selectedIlce,
                      builder: (context, selected, child) {
                        return GestureDetector(
                          onTap: (){
                            if (adressHelper.ilceler.isEmpty){
                              SnackBarHelper.showSnackBar(
                                  content: "İl seçiniz.", type: SnackBarType.INFO);
                            }
                          },
                          behavior: HitTestBehavior.translucent,
                          child: DropdownButtonFormField(
                            value: selected,
                            items: adressHelper.ilceler
                                .map(
                                  (e) => DropdownMenuItem(
                                value: e,
                                child: Text(e.name),
                              ),
                            )
                                .toList(),
                            onChanged: (v) {
                              selectedIlce.value = v;
                            },
                          ),
                        );
                      },
                    );
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Mahalle",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                DropdownButtonFormField(items: [], onChanged: (v) {})
              ],
            ),
          ),
          SizedBox(height: 30,),
          ElevatedButton(onPressed: (){}, child: Text("Kaydet"))
        ],
      ),
    );
  }
}
