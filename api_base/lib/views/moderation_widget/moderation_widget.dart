import 'package:api_base/resources/strings.dart';
import 'package:api_base/views/video_list_screen_2/video_list_screen_2.dart';
import 'package:flutter/material.dart';
class ModerationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        child: Center(
          child: ElevatedButton(
            child: Text(VIDEO_LOAD),
            onPressed: (){
              var route  = MaterialPageRoute(builder: (context) => VideoListScreen2());
              Navigator.push(context, route);
            },
          ),
        ),
      ),
    );
  }
}
