import 'package:dio/dio.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/urls/urls.dart';

class ApiServices {
  final Dio _dio = Dio();
  final Urls _urls = Urls();

  Future<List<Article>?> getNews({
    required String q,
    required String from,
    required String sortBy,
    required String apiKey,
  }) async {
    final params = <String, dynamic>{
      "q": q,
      "from": from,
      "sortBy": sortBy,
      "apiKey": apiKey,
    };
    NewsDataModel? newsDataModel;
    try {
      Response _newsData = await _dio.get(_urls.baseURL + _urls.endPoint,
          queryParameters: params);
          newsDataModel = NewsDataModel.fromJson(_newsData.data);
    } on DioError catch (error) {
      print(error.message);
    }
    return newsDataModel!.articles;
  }
}
