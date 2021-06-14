import 'package:booking_template_app/widgets/news_post.dart';

class NewsService {
  Future<List<NewsPost>> getNewsPosts() async {
    return [
      NewsPost(),
      NewsPost(),
      NewsPost(),
      NewsPost(),
    ];
  }
}
