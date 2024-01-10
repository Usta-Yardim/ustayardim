import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ustayardim/global/global.dart';
import 'package:ustayardim/helpers/adress_helper.dart';
import 'package:ustayardim/helpers/snack_bar_helper.dart';
import 'package:ustayardim/models/il_model.dart';
import 'package:ustayardim/models/ilce_model.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();


  @override
  void initState() {
    nameController.text = "Ebubekir Alp Elvan";
    phoneNumberController.text = "+901234567890";
    emailController.text = "info@test.com";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(scrolledUnderElevation: 0,backgroundColor: Colors.white,),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: CircleAvatar(
                radius: width * 0.2,
                backgroundImage: Image.network("http://localhost:5270/images/user.png").image,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "İsim Soyisim",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  TextFormField(
                    controller: nameController,
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
                      "Telefon",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  TextFormField(
                    controller: phoneNumberController,
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
                      "E-mail",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  TextFormField(
                    controller: emailController,
                  )
                ],
              ),
            ),
            /*SizedBox(
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
            ),*/
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: () {}, child: Text("Kaydet")),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
