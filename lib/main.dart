import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tutorials/controllers/opensea_controller.dart';
import 'package:url_launcher/url_launcher.dart';

main() {
  runApp(GetMaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  OpenseaController openseaController = Get.put(OpenseaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('opensea Api')),
        body: Obx(
      () => openseaController.isLoading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: openseaController.openseaModel?.assets?.length ?? 0,
              itemBuilder: (context, index) {
                return ListTile(
                    title: Text(
                        openseaController.openseaModel?.assets![index].name ??
                            'no name'),
                    subtitle: Text(openseaController
                            .openseaModel?.assets![index].description ??
                        'no description'),
                    leading: openseaController
                                .openseaModel?.assets![index].imageUrl ==
                            null
                        ? Icon(Icons.image)
                        : Image.network(openseaController
                            .openseaModel!.assets![index].imageUrl!),
                    onTap: () {
                      _launchInBrowser(Uri.parse(openseaController
                          .openseaModel!.assets![index].permalink!));
                    });
              }),
    ));
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }
}
