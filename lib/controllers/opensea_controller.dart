import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx_tutorials/models/opensea_model.dart';
import 'package:http/http.dart' as http;

class OpenseaController extends GetxController {
  var isLoading = false.obs;
  OpenseaModel? openseaModel;

  @override
  Future<void> onInit() async {
    super.onInit();
    fetchData();
  }

  fetchData() async {
    try {
      isLoading(true);
      http.Response response = await http.get(Uri.tryParse(
          'https://api.opensea.io/api/v1/assets?collection=cryptopunks')!);
      if (response.statusCode == 200) {
        ///data successfully
        var result = jsonDecode(response.body);

        openseaModel = OpenseaModel.fromJson(result);
      } else {
        print('error fetching data');
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isLoading(false);
    }
  }
}
