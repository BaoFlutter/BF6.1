import 'package:base_flutter/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  final TextEditingController userNameController = TextEditingController();
  final TextEditingController birthYearController = TextEditingController();

  String userName = "Chưa cập nhật";
  String age = "Chưa cập nhật";
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<String>? information;
  bool pressed = false;

  final userNameNotifier = ValueNotifier<String>("Chưa cập nhật");
  final ageNotifier = ValueNotifier<String>("Chưa cập nhật");



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getInformation();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    userNameNotifier.dispose();
    ageNotifier.dispose();
    userNameController!.dispose();
    birthYearController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("Building toàn bộ màn hình");
    return Scaffold(
      appBar: AppBar(
        title: Text(AGE_CONFIRM),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            children: [
              TextInputWidget(
                  labelText: USER_NAME,
                  hintText: USER_NAME_HINT,
                  controller: userNameController),
              const TextDefaultWidget(),
              TextInputWidget(
                  labelText: BIRTH_YEAR,
                  hintText: BIRTH_YEAR_HINT,
                  controller: birthYearController),

              //confirmButton(),
              CustomButton(
                  buttonName: CONFIRM,
                  onPressed: (){
                    /*
                    pressed = true;
                    userNameNotifier.value = userNameController!.text;
                    ageNotifier.value = ( 2021 - int.parse(birthYearController!.text!)).toString();

                     */


                    setState(() {
                      userName = userNameController!.text;
                      age = ( 2021 - int.parse(birthYearController!.text!)).toString();
                      pressed = true;
                    });


                    storeInformation(userName: userName, age: age);
                  }),
              pressed ? InformationZone(
                  userNameLabelText: USER_NAME,
                  userNameTextContent: userName,
                  ageLabelText: AGE,
                  ageTextContent: age) : InformationZoneFromSharedPreference(information: information,),
              ElevatedButton(
                child: Text("Show SnackBar"),
                onPressed: (){

                  Get.snackbar("Thông báo", "Đây là SnackBar của GetX");

                },
              ),
            ],
          ),

        ),
      )
    );
  }

  Widget appBar(){
    return AppBar(
      title: Text(AGE_CONFIRM),
    );
  }

  storeInformation({@required String? userName, @required String? age }) async
  {
    final prefs =  await _prefs;
    // key: value
    await prefs.setString("information", USER_NAME+ ": " + userName! +"\n" + AGE + ": " + age! );
  }

  getInformation(){
    information = _prefs.then((SharedPreferences? prefs) {
      return (prefs!.getString("information") ?? "Thông tin chưa được lưu vào bộ nhớ");
    });
  }

  Widget textInputWidget({@required String? labelText, @required String? hintText, @required controller }){
    print("Building lại textwidget  - không cần thiết");
    return Container(
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: labelText,
          hintText: hintText,
        ),
        controller: controller,
      ),
    );
  }

  dynamic confirmButton(){
    return ElevatedButton(
        onPressed: (){
          print("Xác nhận tuổi");
        },
        child: Text("Xác nhận"));
  }

  Widget customButton({ @required String? buttonName, @required onPressed}){
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
        margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.blue,
        ),
        child: Center(
          child: Text(buttonName!, style: TextStyle(color: Colors.white),),
        )
      ),
      onTap: onPressed,
    );

  }

  Widget informationZone({@required String? userNameLabelText, @required String? userNameTextContent, @required String? ageLabelText, @required String? ageTextContent}){
    return Card(
      child: Container(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Column(
          children: [
            TextWidget(
                labelText: userNameLabelText,
                textContent: userNameTextContent),
            TextWidget(
                labelText: ageLabelText,
                textContent: ageTextContent),
          ],
        ),
      ),
    );
  }

  Widget informationZoneFromSharedPreference(){

    return FutureBuilder<String>(
      future: information,
        builder: (context,AsyncSnapshot<String>? snapshot ){
        if((snapshot!.hasError)||(!snapshot!.hasData))
          return Center(
            child: CircularProgressIndicator(),
          );
        String userInformation = snapshot!.data!;
        return Container(
          width: MediaQuery.of(context).size.height,
            child: Card(
                child: Container(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0 , left: 10.0, right: 10.0),
                  child: Text(userInformation),
                )
            ),

        );

        });
  }

  Widget textWidget({@required String? labelText, @required String? textContent}){
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Row(
        children: [
          Text(labelText! + ": ", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
          Text(textContent!)
        ],
      ),
    );
  }

}

class TextDefaultWidget extends StatelessWidget {

  const TextDefaultWidget();

  @override
  Widget build(BuildContext context) {
    print("Text Widget - Không cần build lại");
    return Text("Text default");
  }
}

class TextInputWidget extends StatelessWidget {
  final labelText, hintText, controller;

  const TextInputWidget({Key? key, this.labelText, this.hintText, this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    print("Building lại textwidget  - không cần thiết");
    return Container(
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: labelText,
          hintText: hintText,
        ),
        controller: controller,
      ),
    );
  }
}


class CustomButton extends StatelessWidget {

  final buttonName, onPressed;

  const CustomButton({Key? key, this.buttonName, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
          margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.blue,
          ),
          child: Center(
            child: Text(buttonName!, style: TextStyle(color: Colors.white),),
          )
      ),
      onTap: onPressed,
    );
  }
}

class InformationZone extends StatelessWidget {
  final userNameLabelText, ageLabelText, ageTextContent, userNameTextContent;

  const InformationZone({Key? key, this.userNameLabelText, this.ageLabelText, this.ageTextContent, this.userNameTextContent}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Column(
          children: [
            TextWidget(
                labelText: userNameLabelText,
                textContent: userNameTextContent),
            TextWidget(
                labelText: ageLabelText,
                textContent: ageTextContent),
          ],
        ),
      ),
    );
  }
}


class InformationZoneFromSharedPreference extends StatelessWidget {
  final information ;

  const InformationZoneFromSharedPreference({Key? key, this.information}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: information,
        builder: (context,AsyncSnapshot<String>? snapshot ){
          if((snapshot!.hasError)||(!snapshot!.hasData))
            return Center(
              child: CircularProgressIndicator(),
            );
          String userInformation = snapshot!.data!;
          return Container(
            width: MediaQuery.of(context).size.height,
            child: Card(
                child: Container(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0 , left: 10.0, right: 10.0),
                  child: Text(userInformation),
                )
            ),

          );

        });
  }
}


class TextWidget extends StatelessWidget {
  final labelText, textContent;

  const TextWidget({Key? key, this.labelText, this.textContent}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Row(
        children: [
          Text(labelText! + ": ", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
          Text(textContent!)
        ],
      ),
    );
  }
}
