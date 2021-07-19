import 'package:api_base/providers/video_list/video_list_model.dart';
import 'package:api_base/views/detail_video/detail_video_screen.dart';
import 'package:api_base/views/video_list/video_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class VideoListScreen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final videoList = Provider.of<List<VideoModel>>(context);
    

    return Scaffold(
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
