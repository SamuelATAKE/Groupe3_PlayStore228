import 'package:url_launcher/url_launcher.dart';

void OpenBrowser(String url) async {
  await launchUrl(Uri.parse(url));
}
