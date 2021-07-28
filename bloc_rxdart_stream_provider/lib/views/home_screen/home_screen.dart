import 'package:api_base/blocs/video_list_bloc.dart';
import 'package:api_base/models/video_model.dart';
import 'package:api_base/views/video_list/video_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Container(
            child: ElevatedButton(
              child: Text("Next Page"),
              onPressed: (){
                var route = MaterialPageRoute(builder: (context)=> VideoListScreen()) ;
                Navigator.push(context, route);
                //Get.to(VideoListScreen());
              },

            ),
          ),
        ),
      ),
    );
    /*
    return StreamProvider<List<VideoModel>>.value(
        stream: videoListBloc.videoListStream,
        initialData: [],
        child:


    );

     */
  }
}
