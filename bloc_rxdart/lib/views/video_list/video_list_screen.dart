import 'package:api_base/blocs/video_list_bloc.dart';
import 'package:api_base/data_sources/api_services.dart';
import 'package:api_base/providers/video_list_model.dart';
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

  final videoListBloc = VideoListBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoListBloc.putDataToVideoListSubject();
    //Provider.of<VideoListModel>(context, listen: false).getVideoList();
  }


  @override
  Widget build(BuildContext context) {
    //final videoListOnProvider = Provider.of<VideoListModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(VIDEO_LIST),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        child: StreamBuilder<List<VideoModel>>(
          stream: videoListBloc.videoListStream,
          builder: (context, snapshot ){
            if((snapshot.hasError)||(!snapshot.hasData))
              return Center(
                child: Container(
                  child: CircularProgressIndicator(),
                ),
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
                      //var route = MaterialPageRoute(builder: (context)=> DetailVideoScreen(videoModel: videoList[index],));
                      //Navigator.push(context, route);
                    },
                  );
                }
            );

          }
        ),
      ),

    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    videoListBloc.dispose();
  }
}
