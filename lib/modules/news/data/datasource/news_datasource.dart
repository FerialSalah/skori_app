
import 'package:dio/dio.dart';
import 'package:skori/core/network/urls_app.dart';
import '../../../../core/app_storage/app_storage.dart';
import '../../../../core/dio_helper/dio_helper.dart';
import '../../../../core/errors/exception.dart';
import '../model/news_model.dart';



abstract class BaseNewsDataSource{
   Future<AllNewsModel> getNews({required int page, String? type});
   Future<NewsModel> getNewsDetails({ int? playerId, int? teamId,required int articleId});

}

class NewsDataSource implements BaseNewsDataSource{
  //
  // case NEW = 'new';
  // case EXCLUSIVE = 'exclusive';
  // case INTERVIEW = 'interview';
  // case HIGHLIGHT = 'highlight';
  @override
  Future<AllNewsModel> getNews({required int page, String? type}) async{
    try {
      final result = await DioHelper.get("${NEWS_URL}?page=$page&type=$type");
      AllNewsModel response = AllNewsModel.fromJson(result.data);

      print("news data :${result.data}");
      return response;
    } on DioError catch (e) {
       print(runtimeType);
       print(e.response);
      throw handleResponseError(e);
    }
  }

  @override
  Future<NewsModel> getNewsDetails({ int? playerId, int? teamId,required int articleId}) async{
    try {
      print("articleId=====$articleId");
      print("articleId=====$playerId");
      print("articleId=====$teamId");
      String url;
      if(playerId!=null && teamId==null){
        url = "${NEWS_URL}/$articleId?player_id=$playerId";
      }else if(playerId==null && teamId!=null){
        url = "${NEWS_URL}/$articleId?team_id=$teamId";
      }else{
        url = "${NEWS_URL}/$articleId";
      }
    // ?player_id=$playerId&team_id=$teamId"
      final result = await DioHelper.get(url);

      print("stutaas========${result.statusCode}");
      print("The News+=======================");
     if(result.statusCode==200){
       NewsModel response = NewsModel.fromJson(result.data["data"]);
       return response;
     }else if(result.statusCode==403){
       throw ExceptionServiceCallBack(massage: result.data["data"]);
     }else if(result.statusCode==401){
       throw ExceptionServiceCallBack(massage: result.data["message"]);
     }else{
       throw ExceptionServiceCallBack(massage: "404 : Service Not found");
     }
    } on DioError catch (e) {
      print(runtimeType);
      print(e);
      throw handleResponseError(e);
    }
  }
}
