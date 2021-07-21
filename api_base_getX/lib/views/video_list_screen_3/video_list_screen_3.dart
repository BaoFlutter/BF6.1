import 'package:api_base/providers/video_list/video_list_model.dart';
import 'package:api_base/providers/video_list_getx/video_list_getx_controller.dart';
import 'package:api_base/resources/strings.dart';
import 'package:api_base/views/detail_video/detail_video_screen.dart';
import 'package:api_base/views/home_screen/home_screen.dart';
import 'package:api_base/views/video_list/video_list_screen.dart';
import 'package:api_base/views/video_list/video_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
class VideoListScreen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //final videoList = Provider.of<List<VideoModel>>(context);
    final VideoListGetXController videoListGetXController = Get.find();
    final videoList = videoListGetXController.videoList;
    

    return Scaffold(
      appBar: AppBar(
        title: Text(VIDEO_LIST),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
           // Get.back();
            /*
            var route = MaterialPageRoute(builder: (context)=> VideoListScreen());
            Navigator.push(context, route);
             */
            //Navigator.pop(context);
            var route = MaterialPageRoute(builder: (context)=> HomeScreen());
            Navigator.pushAndRemoveUntil(context, route, (route) => false);
          },
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: videoList != null ? GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: videoList.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                child: Container(
                  child: Card(
                      child: Column(
                        children: [
                          Image.network(videoList[index].url_photo!, fit: BoxFit.cover,),
                          Text(videoList[index].title!),

                        ],
                      )
                  ),
                ),
                onTap: (){
                  var route = MaterialPageRoute(builder: (context)=> DetailVideoScreen(videoModel: videoList[index],));
                  Navigator.push(context, route);
                },
              );
            }
        ): Center(
          child: CircularProgressIndicator(),
        )
        /*
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: videoList.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                child: Container(
                  child: Card(
                      child: Column(
                        children: [
                          Image.network(videoList[index].url_photo!, fit: BoxFit.cover,),
                          Text(videoList[index].title!),

                        ],
                      )
                  ),
                ),
                onTap: (){
                  var route = MaterialPageRoute(builder: (context)=> DetailVideoScreen(videoModel: videoList[index],));
                  Navigator.push(context, route);
                },
              );
            }
        ),

         */

      ),
    );
  }
}
