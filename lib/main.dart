import 'dart:io';

import 'package:flutter/material.dart';
import 'package:scanner/Common/Utilities/shared_storage.dart';
import 'package:scanner/Data/Table/product_hive.dart';
import 'package:scanner/Di/get_it.dart' as getIt;
import 'package:hive/hive.dart';
import 'my_app.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

// import 'package:scanner/page/scanner/scanner.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getIt.init();
  Directory directory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(ProductTableAdapter());
  await SharedStorage.init();
  SharedStorage.initDB();
  // final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  runApp(MyApp());
}
