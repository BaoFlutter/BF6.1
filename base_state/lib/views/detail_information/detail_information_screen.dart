import 'package:base_state/data_sources/databases/mark_database.dart';
import 'package:base_state/data_sources/databases/mark_model.dart';
import 'package:base_state/resources/strings.dart';
import 'package:base_state/resources/widgets/common_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
/*
class DetailInformationScreen extends StatelessWidget {
  final String? averageMark;
  final String? grade;

  const DetailInformationScreen({Key? key, @required this.averageMark, @required this.grade}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(DETAIL_INFORMATION),
        centerTitle: true,
      ),
      body: Container(
        child: resultZone(
            averageMark: AVERAGE_MARK,
            averageMarkContent: averageMark,
            grade: GRADE,
            gradeContent: grade),
      ),
    );
  }
}

 */

class DetailInformationScreen extends StatefulWidget {
  final String? averageMark;
  final String? grade;

  const DetailInformationScreen({Key? key, this.averageMark, this.grade}) : super(key: key);

  @override
  _DetailInformationScreenState createState() => _DetailInformationScreenState();
}

class _DetailInformationScreenState extends State<DetailInformationScreen> {

  final Future<SharedPreferences> _prefs =  SharedPreferences.getInstance();
  Future<String>? markInfor ;

  final db = MarkDatabase();

  Future<List<MarkModel>>? markList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMarkInformation();
    getMarkInformationOnMarkDatabase();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(DETAIL_INFORMATION),
        centerTitle: true,
      ),
      /*
      body: Container(
        child: resultZone(
            averageMark: AVERAGE_MARK,
            averageMarkContent: widget.averageMark,
            grade: GRADE,
            gradeContent: widget.grade),
      ),

       */

     /*
      body: Container(
        child: FutureBuilder<String>(
          future: markInfor,
          builder: (context, AsyncSnapshot<String>? snapshot)
          {
            if((snapshot!.hasError)||(!snapshot!.hasData))
              return Center(
                child: CircularProgressIndicator(),
              );
            String infor = snapshot!.data!;
            return informationWidget(text: infor);
          },

        ),
      ),

      */
      body: Container(
        child: FutureBuilder<List<MarkModel>>(
          future: markList,
          builder: (context, AsyncSnapshot<List<MarkModel>>? snapshot)
          {
            if((snapshot!.hasError)||(!snapshot!.hasData))
              return Center(
                child: CircularProgressIndicator(),
              );
            List<MarkModel> list = snapshot!.data!;
            return ListView.builder(
              itemCount: list.length,
                itemBuilder: (context, index)
            {
              return informationWidgetForSQFlite(
                  text1: list[index].mark_average,
                  text2: list[index].grade);
            });

          },

        ),
      ),
    );
  }

  getMarkInformation(){
    markInfor = _prefs.then((SharedPreferences? prefs) {
      return (prefs!.getString("mark_infor")?? "Th??ng tin ch??a ???????c l??u v??o b??? nh???");
    });

  }

  getMarkInformationOnMarkDatabase()
  {
    markList = db.fetchAll();
  }

  Widget informationWidget({@required String? text}){
    return Container(
      padding: EdgeInsets.all(10),
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: Card(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Text(text!),
        )
      ),
    );
  }

  Widget informationWidgetForSQFlite({@required String? text1, @required String? text2 }){
    return Container(
      padding: EdgeInsets.all(10),
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: Card(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(

              children: [
                Text(text1!),
                Text(text2!)
              ],
            )
          )
      ),
    );
  }
}

