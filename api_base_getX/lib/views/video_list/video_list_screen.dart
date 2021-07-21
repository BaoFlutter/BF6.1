import 'package:api_base/data_sources/api_services.dart';
import 'package:api_base/providers/video_list/video_list_model.dart';
import 'package:api_base/providers/video_list_getx/video_list_getx_controller.dart';
import 'package:api_base/resources/strings.dart';
import 'package:api_base/views/detail_video/detail_video_screen.dart';
import 'package:api_base/views/moderation_widget/moderation_widget.dart';
import 'package:api_base/views/video_list/video_model.dart';
import 'package:api_base/views/video_list_screen_3/video_list_screen_3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class VideoListScreen extends StatefulWidget {
  @override
  _VideoListScreenState createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {
  @override
  Widget build(BuildContext context) {

    final videoListOnProvider = Provider.of<VideoListModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(VIDEO_LIST),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.of(context).pop();
            //Get.back();
          },
        ),
        actions: [
          IconButton(
              onPressed: (){
               // Get.to(VideoListScreen3());

                var route = MaterialPageRoute(builder: (context)=> VideoListScreen3());
                Navigator.push(context, route);


              },

              icon: Icon(Icons.description))
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,

        child: FutureBuilder<List<VideoModel>>(
          future: ApiServices().fetchVideoList(),
          builder: (context, AsyncSnapshot? snapshot){
            if((snapshot!.hasError)||(!snapshot!.hasData))
              return Center(
                child: CircularProgressIndicator(),
              );
            
            List<VideoModel> videoList = snapshot!.data!;

            //context.read<VideoListModel>().videoList = videoList;
            //context.read<VideoListModel>().updateVideoList(videoList);
            videoListOnProvider.updateVideoList(videoList);
            Get.put(VideoListGetXController()).updateVideoList(videoList);

            return GridView.builder(
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
            );
            
            
            
            
          },
        ),


      ),
      
    );
  }
}
