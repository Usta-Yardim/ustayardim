import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:ustayardim/api/api.dart';
import 'package:ustayardim/enums/enums.dart';
import 'package:ustayardim/global/global.dart';
import 'package:ustayardim/helpers/adress_helper.dart';
import 'package:ustayardim/helpers/cupertino_picker_helper.dart';
import 'package:ustayardim/helpers/date_helper.dart';
import 'package:ustayardim/helpers/navigator_helper.dart';
import 'package:ustayardim/helpers/snack_bar_helper.dart';
import 'package:ustayardim/helpers/user_helper.dart';
import 'package:ustayardim/models/il_model.dart';
import 'package:ustayardim/models/ilce_model.dart';
import 'package:ustayardim/models/mahalle_model.dart';

class PersonalInformationsScreen extends StatefulWidget {
  const PersonalInformationsScreen({super.key});

  @override
  State<PersonalInformationsScreen> createState() => _PersonalInformationsScreenState();
}

class _PersonalInformationsScreenState extends State<PersonalInformationsScreen> {
  ValueNotifier<IlModel?> selectedIl = ValueNotifier(null);
  ValueNotifier<IlceModel?> selectedIlce = ValueNotifier(null);
  ValueNotifier<MahalleModel?> selectedMahalle = ValueNotifier(null);
  ValueNotifier<DateTime?> selectedDate = ValueNotifier(null);
  TextEditingController aboutMeController = TextEditingController();

  TextEditingController dateOfBirthController = TextEditingController();

  @override
  void initState() {
    init();
    super.initState();
  }

  init() async {
    UserHelper userHelper = Provider.of<UserHelper>(context, listen: false);
    aboutMeController.text = userHelper.userModel!.aboutMe ?? "";
    selectedDate.value = userHelper.userModel!.birthTime;
    AdressHelper adressHelper = Provider.of<AdressHelper>(context, listen: false);
    selectedIl.value = userHelper.userModel!.ilModel == null
        ? null
        : adressHelper.iller
            .firstWhere((element) => element.id == userHelper.userModel!.ilModel!.id);
    if (selectedIl.value == null) return;
    await adressHelper.getIlceler(ilId: selectedIl.value!.id);
    selectedIlce.value = userHelper.userModel!.ilceModel == null
        ? null
        : adressHelper.ilceler
            .firstWhere((element) => element.id == userHelper.userModel!.ilceModel!.id);
    if (selectedIlce.value == null) return;
    await adressHelper.getMahalleler(ilceId: selectedIlce.value!.id);
    selectedMahalle.value = userHelper.userModel!.mahalleModel == null
        ? null
        : adressHelper.mahalleler
            .firstWhere((element) => element.id == userHelper.userModel!.mahalleModel!.id);
  }

  _update() {
    String? abouteMe = aboutMeController.text.isEmpty ? null : aboutMeController.text;
    DateTime? dateTime = selectedDate.value;
    IlModel? ilModel = selectedIl.value;
    IlceModel? ilceModel = selectedIlce.value;
    MahalleModel? mahalleModel = selectedMahalle.value;

    if (abouteMe == null &&
        dateTime == null &&
        ilModel == null &&
        ilceModel == null &&
        mahalleModel == null) return;

    Api.update(
        activePane: ActivePane.INFO,
        aboutMe: abouteMe,
        dateOfBirth: dateTime,
        ilModel: ilModel,
        ilceModel: ilceModel,
        mahalleModel: mahalleModel);

    NavigatorHelper.pop();
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
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        children: [
          SizedBox(
            height: 20,
          ),
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
              TextField(
                controller: aboutMeController,
                maxLines: 3,
              ),
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
              ValueListenableBuilder(
                  valueListenable: selectedDate,
                  builder: (context, date, child) {
                    if (date != null) {
                      dateOfBirthController.text = DateHelper.formatDateWithYear(dateTime: date);
                    } else {
                      dateOfBirthController.text = "";
                    }
                    return TextField(
                      controller: dateOfBirthController,
                      readOnly: true,
                      onTap: () async {
                        selectedDate.value = await CupertinoPickerHelper.showCupertinoDatePicker(
                            shouldRestrictMaxDate: true);
                      },
                      maxLines: 1,
                    );
                  }),
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
                            selectedMahalle.value = null;
                            selectedIl.value = v;
                            if (selectedIl.value != null) {
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
                          onTap: () {
                            if (adressHelper.ilceler.isEmpty) {
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
                              selectedMahalle.value = null;
                              selectedIlce.value = v;

                              if (selectedIlce.value != null) {
                                adressHelper.getMahalleler(ilceId: selectedIlce.value!.id);
                              }
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
                Consumer<AdressHelper>(builder: (context, adressHelper, child) {
                  return ValueListenableBuilder(
                      valueListenable: selectedMahalle,
                      builder: (context, selected, child) {
                        return GestureDetector(
                          onTap: () {
                            if (adressHelper.mahalleler.isEmpty) {
                              SnackBarHelper.showSnackBar(
                                  content: "İlçe seçiniz.", type: SnackBarType.INFO);
                            }
                          },
                          child: DropdownButtonFormField(
                              value: selected,
                              items: adressHelper.mahalleler
                                  .map((e) => DropdownMenuItem(
                                        child: Text(e.name),
                                        value: e,
                                      ))
                                  .toList(),
                              onChanged: (v) {
                                selectedMahalle.value = v;
                              }),
                        );
                      });
                })
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(onPressed: _update, child: Text("Kaydet"))
        ],
      ),
    );
  }
}
