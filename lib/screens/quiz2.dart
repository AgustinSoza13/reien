import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
class Quiz2 extends StatelessWidget {
  const Quiz2({super.key});
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
            ConstrainedBox(
              constraints:const BoxConstraints(maxHeight: 450),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    child: Text('pregunta 1'),
                  ),
                  Flexible(child: ListView.builder(shrinkWrap: true,itemCount: 3,itemBuilder:(_, index){
                    return Container(
                      margin: const EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.indigo.shade100,
                        width: 2),
                        borderRadius: BorderRadius.circular(12),
                        //color:Colors.purple,
                      ),
                      child: ListTile(
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12),),),
                        leading: Text('${index+1}'),
                        title: Text('Respuesta'),
                        onTap: () {},
                      ),
                    );
                  },),),

                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple[400],
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
                  //TextButton(onPressed: () {}, child: Text('Ship'))
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
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
            tooltip: "Volver",
          ),
          Expanded(
            child: title,
          ),
        ],
      ),
    );
  }
}
