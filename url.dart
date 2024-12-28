import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkOpener extends StatelessWidget {
  final String url = "https://www.google.com"; // Replace with your desired URL

  void _openLink() async {
    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Open Link Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _openLink,
          child: Text('Open Link in Chrome'),
        ),
      ),
    );
  }
}
