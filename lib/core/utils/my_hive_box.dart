
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';



Box? myBox;

Future<Box> openHiveBox(String boxName) async {
  if (!Hive.isBoxOpen(boxName)) {
    if (!kIsWeb) {
      // في الـ Mobile/Desktop، نحدد المسار
      Hive.init((await getApplicationDocumentsDirectory()).path);
    } else {
      // في الـ Web، مش محتاجين نعمل init لأن Hive بيستخدم IndexedDB تلقائيًا
      await Hive.initFlutter();
    }
  }
  return await Hive.openBox(boxName);
}
void showAuthScreen() {
  if (myBox!.get("notShowAuthScreen") == "true") {
    myBox!.put("notShowAuthScreen", "true");
  } else {
    myBox!.put("notShowAuthScreen", "false");
  }
}