import 'package:base_state/resources/strings.dart';
import 'package:base_state/resources/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
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
            averageMarkContent: widget.averageMark,
            grade: GRADE,
            gradeContent: widget.grade),
      ),
    );
  }
}

