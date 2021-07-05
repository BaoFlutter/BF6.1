import 'package:flutter/material.dart';


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

Widget resultZone({
  @required String? averageMark,
  @required String? averageMarkContent,
  @required String? grade,
  @required String? gradeContent}){
  return Card(
    child: Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Column(
        children: [
          textWidget(
              labelText: averageMark,
              textContent: averageMarkContent),
          textWidget(
              labelText: grade,
              textContent: gradeContent),
        ],
      ),
    ),
  );
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