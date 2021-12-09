import '../../models/news_model.dart';
import '../../services/news_services.dart';
import 'package:get/get.dart';

enum NewsLoadStatus {
  initial,
  loading,
  loaded,
  fail,
}

extension NewsLoadStatusExt on NewsLoadStatus {
  bool get isInitial => this == NewsLoadStatus.initial;
  bool get isLoading => this == NewsLoadStatus.loading;
  bool get isLoaded => this == NewsLoadStatus.loaded;
  bool get isFail => this == NewsLoadStatus.fail;
}

class NewsController extends GetxController {
  late List<Rx<NewsModel>> newsList = [];
  Rx<NewsLoadStatus> status = NewsLoadStatus.initial.obs;
  Rx<NewsModel>? selected;

  @override
  void onInit() {
    super.onInit();
    loadNews();
  }

  void loadNews() async {
    status.value = NewsLoadStatus.loading;
    update();
    try {
      newsList = await NewsServices.getNews()
          .then((value) => value.map((e) => e.obs).toList());
      status.value = NewsLoadStatus.loaded;
    } catch (e) {
      status.value = NewsLoadStatus.fail;
    }
    update();
  }

  void selectNews(NewsModel news) {
    selected = news.obs;
    update();
  }
}
