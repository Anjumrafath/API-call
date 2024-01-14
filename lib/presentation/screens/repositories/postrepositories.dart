import 'package:apihandling/presentation/screens/repositories/api/api.dart';
import 'package:dio/dio.dart';
import 'package:apihandling/data/models/post_model.dart';

class PostRepository {
  API api = API();
  Future<List<PostModel>> fetchPosts() async {
    try {
      Response response = await api.sendRequest.get("/posts");
      List<dynamic> postMaps = response.data;
      if (response.statusCode == 200) {
        print("Api is working fine");
      } else {
        print("Something went wrong");
      }
      return postMaps.map((postMap) => PostModel.fromJson(postMap)).toList();
    } catch (ex) {
      throw ex;
    }
  }
}
