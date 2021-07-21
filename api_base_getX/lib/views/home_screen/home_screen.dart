import 'package:api_base/resources/strings.dart';
import 'package:api_base/resources/widgets/common_widgets.dart';
import 'package:api_base/views/video_list/video_list_screen.dart';
import 'package:api_base/views/video_list_screen_3/video_list_screen_3.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(HOME_SCREEN),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: ElevatedButton(
            child: Text(VIDEO_LOAD),
            onPressed: (){
              //Get.to(VideoListScreen());
              var route = MaterialPageRoute(builder: (context)=> VideoListScreen());
              Navigator.push(context, route);
            },

          ),
        ),
        /*

        child: Center(
          child: customButton(
              buttonName: VIDEO_LOAD,
              onPressed: (){
               // var route = MaterialPageRoute(builder: (context)=> VideoListScreen());
                var route = MaterialPageRoute(builder: (context)=> VideoListScreen3());
                Navigator.push(context, route);

              }),
        )

         */
      )

    );
  }
}
