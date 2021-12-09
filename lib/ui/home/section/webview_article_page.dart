import 'package:flutter/material.dart';
import 'package:flutter_donor/get_x/controller/news_controller.dart';
import 'package:flutter_donor/shared/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewArticlePage extends StatefulWidget {
  const WebviewArticlePage({Key? key}) : super(key: key);

  @override
  State<WebviewArticlePage> createState() => _WebviewArticlePageState();
}

class _WebviewArticlePageState extends State<WebviewArticlePage> {
  NewsController newsController = Get.find();

  @override
  void initState() {
    super.initState();
    WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/vector/ic_back.svg',
            width: 12,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
        title: Text(
          "Detail Artikel",
          style: AppText.textSemiLarge.copyWith(
            color: AppColor.white,
            fontWeight: AppText.semiBold,
          ),
        ),
        backgroundColor: AppColor.cRed,
        elevation: 0,
      ),
      body: WebView(
        initialUrl: newsController.selected?.value.link,
        javascriptMode: JavascriptMode.unrestricted,
        
      ),
    );
  }
}
