import 'package:base_state/resources/strings.dart';
import 'package:base_state/resources/utils/utils.dart';
import 'package:base_state/resources/widgets/common_widgets.dart';
import 'package:base_state/views/detail_information/detail_information_screen.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController? mathTextController, litetureTextController, englishTextController;
  String averageMark = "Chưa cập nhật";
  String grade = "Chưa cập nhật";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mathTextController = TextEditingController();
    litetureTextController = TextEditingController();
    englishTextController = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }


  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mathTextController!.dispose();
    englishTextController!.dispose();
    litetureTextController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(mounted) {print("Biến mounted is $mounted");}
    return Scaffold(
      appBar: AppBar(
        title: Text(MARK_TABLE),
        centerTitle: true,
      ),
      body:SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              // math mark input
              textInputWidget(
                  labelText: MATH_MARK,
                  hintText: MATH_MARK_HINT,
                  controller: mathTextController),
              // liteture mark input
              textInputWidget(
                  labelText: LITETURE_MARK,
                  hintText: LITETURE_MARK_HINT,
                  controller: litetureTextController),
              // english mark input
              textInputWidget(
                  labelText: ENGLISH_MARK,
                  hintText: ENGLSIH_MARK_HINT,
                  controller: englishTextController),
              // confirm button
              customButton(
                  buttonName: ORDER,
                  onPressed: (){
                    setState(() {
                      averageMark = roundDouble(
                          targetedNumber: ((
                              double.parse(mathTextController!.text)
                                  + double.parse(litetureTextController!.text)
                                  + double.parse(englishTextController!.text))/3 ),
                          index: 1).toString();
                      grade = setGrade(double.parse(averageMark))!;
                    });


                  }),

              resultZone(
                  averageMark: AVERAGE_MARK,
                  averageMarkContent: averageMark,
                  grade: GRADE,
                  gradeContent: grade),
              customButton(
                  buttonName: NEXT_PAGE,
                  onPressed:() {
                    var route = MaterialPageRoute(builder: (context) => DetailInformationScreen(
                        averageMark: averageMark,
                        grade: grade));
                    Navigator.push(context, route);
                  })
              // result widget
            ],
          ),

        ),
      )
    );
  }



  String? setGrade(double averageMark)
  {
    if(( averageMark < 0)||(averageMark>10))
      return "Điểm không hợp lệ";
    if(averageMark<5) return "Học lực chưa đạt";
    if(averageMark<8.5) return "Học lực Đạt";
    if(averageMark <= 10 ) return "Học lực giỏi";

  }





}


