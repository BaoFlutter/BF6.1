import 'package:api_base/views/video_list/video_model.dart';
import 'package:get/get.dart';

class VideoListGetXController extends  GetxController{
  List<VideoModel> videoList = [];

  updateVideoList( List<VideoModel>? videoList )
  {
    this.videoList = videoList!;
    update();
  }



}