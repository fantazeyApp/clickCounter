import 'package:url_launcher/url_launcher.dart';
import 'launch_url_interface.dart';

class LaunchUrl implements ILaunchUrlInterface {
 const LaunchUrl();
  @override
  Future<void> openURL(String url) async {
    final uRL = Uri.parse(url);
    if (await canLaunchUrl(uRL)) {
      await launchUrl(uRL, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $uRL';
    }
  }
}
