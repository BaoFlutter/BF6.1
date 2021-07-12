import 'package:api_base/data_sources/api_urls.dart';
import 'package:api_base/resources/utils/logs.dart';
import 'package:api_base/views/video_list/video_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;

class ApiServices{

  // fetch Video List
  Future<List<VideoModel>> fetchVideoList() async {
    List<VideoModel> videoList = [];
    var fullVideoListUrl = ApiUrls().VIDEOS_URL;
    var response ;
    try{
      response = await http.get(fullVideoListUrl);
    } catch(e){
      print("ERROR VIDEO LOADDING ... " + e.toString());
    }
    print(response.body.toString());
    var body = json.jsonDecode(response.body);

    Log().printJson(json: body);
    if(body['code'] == "success")
      {
        List jsonList = body['list'];
        for(var jsonItem in jsonList)
          {
            VideoModel videoModel = VideoModel.fromJson(jsonItem);
            videoList.add(videoModel);
          }
      }
    return videoList;
  }





}