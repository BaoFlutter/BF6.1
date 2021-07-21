import 'package:api_base/views/video_list/video_model.dart';
import 'package:flutter/material.dart';
class DetailVideoScreen extends StatelessWidget {
  final VideoModel? videoModel;

  const DetailVideoScreen({Key? key, @required this.videoModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Image.network(videoModel!.url_photo!, fit: BoxFit.cover,),
            Text(videoModel!.title!, style: TextStyle(fontWeight: FontWeight.bold),),
            Text(videoModel!.description!),
            Text(videoModel!.url_video!),
          ],
        ),
      ),

    );
  }
}
