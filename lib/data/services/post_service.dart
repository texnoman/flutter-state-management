
import 'package:fake_posts/data/models/post_model.dart';
import 'package:fake_posts/data/services/http_service.dart';

/// API dan post larni olib kelish uchun
class PostService {
  /// [getPosts] postlarni GET metod orqali olish
  // ignore: missing_return
  static Future<List<PostModel>> getPosts() async {
    try {
      final httpService = HTTPService();
      final result = await httpService.get(path: "/post?limit=40");
      var mapResult = result.data['data'];
      var postModelResult = List<PostModel>();
      mapResult.forEach((element) {
        postModelResult.add(PostModel.fromMap(element));
      });
      return postModelResult;
    } catch (e) {
      print(e.toString());
    }
  }
}
