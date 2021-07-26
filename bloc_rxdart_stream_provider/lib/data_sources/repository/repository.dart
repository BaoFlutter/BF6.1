import 'package:api_base/models/video_model.dart';

import '../api_services.dart';

class Repository {

  final ApiServices _apiServices = ApiServices();
  // fetch VideoList
  Future<List<VideoModel>> fetchAllVideos() => _apiServices.fetchVideoList();

  // fetch UserInformation
  



}