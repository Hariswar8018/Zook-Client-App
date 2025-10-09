import 'package:amplify_core/amplify_core.dart';

class GlobalFunctions{

  static Future<String> getpicsfrompath(String path) async {
    try{
      final urlResult = await Amplify.Storage.getUrl(
        path: StoragePath.fromString(path),
      );
      final getUrlResult1 = await urlResult.result;
      final downloadUrl1 = getUrlResult1.url.toString();
      return downloadUrl1;
    }catch(e){
      return "NA";
    }
  }
}