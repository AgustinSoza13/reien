import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Column(
          children: [
            AppBar(
              title: Text(
                "Reien",
                style: Theme.of(context).primaryTextTheme.titleLarge,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.purple[400],
                    ),
                    onPressed: () async {
                      final img =
                          await rootBundle.load('images/congratulations.png');
                      final bufferImg = img.buffer;
                      Share.shareXFiles(
                        [
                          XFile.fromData(
                            bufferImg.asUint8List(
                              img.offsetInBytes,
                              img.lengthInBytes,
                            ),
                            name: 'Congratulations!',
                            mimeType: 'image/png',
                          ),
                        ],
                        subject: 'Reien Quiz Results',
                      );
                    },
                    child: const Text("Share results"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({required this.title, super.key});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(color: Colors.purple[400]),
      child: Row(
        children: [
          const IconButton(
            onPressed: null,
            icon: Icon(Icons.menu),
            tooltip: "Menú Navegación",
          ),
          Expanded(
            child: title,
          ),
        ],
      ),
    );
  }
}
