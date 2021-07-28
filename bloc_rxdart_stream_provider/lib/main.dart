import 'package:api_base/data_sources/api_services.dart';
import 'package:api_base/providers/video_list_model.dart';
import 'package:api_base/views/home_screen/home_screen.dart';
import 'package:api_base/views/video_list/video_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'blocs/video_list_bloc.dart';
import 'models/video_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final videoListBloc = VideoListBloc();

  @override
  Widget build(BuildContext context) {
    videoListBloc.putDataToVideoListSubject();
    return MultiProvider(
      providers: [
        StreamProvider<List<VideoModel>>(
        create: (_) => videoListBloc.videoListStream,
        initialData: [],),
      ],
      child: GetMaterialApp(
        home: HomeScreen(),
      ),
    );
    /*
    return StreamProvider(
        create: (_) => videoListBloc.videoListStream,
        catchError: (context, error)
        {
          print(error.toString());
        },
        initialData: [],
        child: GetMaterialApp(
          home: HomeScreen(),
        ));

     */
  }
}
