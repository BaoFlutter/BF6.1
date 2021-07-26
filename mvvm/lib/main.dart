import 'package:api_base/data_sources/api_services.dart';
import 'package:api_base/view_models/video_list_model.dart';
import 'package:api_base/views/video_list/video_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/video_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers:[
          ChangeNotifierProvider(create: (context)=> VideoListModel()),

        ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: VideoListScreen()
      ),

     );
  }
}
