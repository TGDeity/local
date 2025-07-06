import 'package:url_launcher/url_launcher.dart';

mixin LaunchMixin {
  void name(args);
  //sadece Widgetler kuıllansın
  void launchUrl_(Uri url) async {
    print(await canLaunchUrl(url));

    if (await canLaunchUrl(url) == false) {
      //Şu an çalışmıyor android tarafında native kodları eklemek lazım sadece çalıştırmak için false verdim
      await launchUrl(url);
    } else {
      print('url acılamadı: $url');
    }

    //await canLaunchUrl(url) == true ? print(url) : await launchUrl(url);
  }

}
