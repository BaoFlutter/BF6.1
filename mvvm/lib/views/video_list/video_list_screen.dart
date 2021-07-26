import 'package:api_base/data_sources/api_services.dart';
import 'package:api_base/view_models/video_list_model.dart';
import 'package:api_base/resources/strings.dart';
import 'package:api_base/models/video_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VideoListScreen extends StatefulWidget {
  @override
  _VideoListScreenState createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<VideoListModel>(context, listen: false).getVideoList();
  }


  @override
  Widget build(BuildContext context) {
    final videoListOnProvider = Provider.of<VideoListModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(VIDEO_LIST),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        child: videoListOnProvider.videoList.length!= 0 ?
        GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: videoListOnProvider.videoList.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                child: Container(
                  child: Card(
                      child: Column(
                        children: [
                          Image.network(videoListOnProvider.videoList[index].url_photo!, fit: BoxFit.cover,),
                          Text(videoListOnProvider.videoList[index].title!),
                        ],
                      )
                  ),
                ),
                onTap: (){
                  //var route = MaterialPageRoute(builder: (context)=> DetailVideoScreen(videoModel: videoList[index],));
                  //Navigator.push(context, route);
                },
              );
            }
        ) :
          Center(
            child: Container(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(),
            )
          )


      ),
      
    );
  }
}
