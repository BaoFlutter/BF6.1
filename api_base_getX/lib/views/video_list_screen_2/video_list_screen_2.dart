import 'package:api_base/providers/video_list/video_list_model.dart';
import 'package:api_base/views/detail_video/detail_video_screen.dart';
import 'package:api_base/views/video_list/video_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class VideoListScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Cach 1
    //List<VideoModel> videoList =  context.watch<VideoListModel>().videoList;


    // Cach 2
    //final videoListOnProvider = Provider.of<VideoListModel>(context);

    //List<VideoModel> videoList = videoListOnProvider.videoList;


    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Consumer<VideoListModel>(
          builder: (context, videoListModel, child){
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: videoListModel.videoList.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: Container(
                      child: Card(
                          child: Column(
                            children: [
                              Image.network(videoListModel.videoList[index].url_photo!, fit: BoxFit.cover,),
                              Text(videoListModel.videoList[index].title!),

                            ],
                          )
                      ),
                    ),
                    onTap: (){
                      var route = MaterialPageRoute(builder: (context)=> DetailVideoScreen(videoModel: videoListModel.videoList[index],));
                      Navigator.push(context, route);
                    },
                  );
                }
            );
          },
        ),
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
