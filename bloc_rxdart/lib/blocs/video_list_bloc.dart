import 'package:api_base/data_sources/repository/repository.dart';
import 'package:api_base/models/video_model.dart';
import 'package:rxdart/rxdart.dart';

class VideoListBloc {

  final _repository = Repository();
  final videoListSubject  = PublishSubject<List<VideoModel>>();
  //  put Data to Stream

  putDataToVideoListSubject() async
  {
    List<VideoModel> videoList = await _repository.fetchAllVideos();
    videoListSubject.sink.add(videoList) ;
  }
  // get Stream
  Stream<List<VideoModel>>? get videoListStream => videoListSubject.stream;
  //  dispose
  dispose(){
    videoListSubject.close();
  }

}