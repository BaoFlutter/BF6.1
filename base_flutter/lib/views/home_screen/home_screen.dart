import 'package:base_flutter/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController? userNameController, birthYearController;

  String userName = "Chưa cập nhật";
  String age = "Chưa cập nhật";
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<String>? information;
  bool pressed = false;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userNameController = TextEditingController();
    birthYearController = TextEditingController();
    getInformation();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    userNameController!.dispose();
    birthYearController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              textInputWidget(
                  labelText: USER_NAME,
                  hintText: USER_NAME_HINT,
                  controller: userNameController),
              textInputWidget(
                  labelText: BIRTH_YEAR,
                  hintText: BIRTH_YEAR_HINT,
                  controller: birthYearController),
              //confirmButton(),
              customButton(
                  buttonName: CONFIRM,
                  onPressed: (){
                    setState(() {
                      userName = userNameController!.text;
                      age = ( 2021 - int.parse(birthYearController!.text!)).toString();
                      pressed = true;
                    });
                    storeInformation(userName: userName, age: age);
                  }),
              pressed ? informationZone(
                  userNameLabelText: USER_NAME,
                  userNameTextContent: userName,
                  ageLabelText: AGE,
                  ageTextContent: age) : informationZoneFromSharedPreference()
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
            textWidget(
                labelText: userNameLabelText,
                textContent: userNameTextContent),
            textWidget(
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
