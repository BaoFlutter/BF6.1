import 'package:api_base/data_sources/api_services.dart';
import 'package:api_base/resources/strings.dart';
import 'package:api_base/views/detail_video/detail_video_screen.dart';
import 'package:api_base/views/video_list/video_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class VideoListScreen extends StatefulWidget {
  @override
  _VideoListScreenState createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(VIDEO_LIST),
        centerTitle: true,
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
