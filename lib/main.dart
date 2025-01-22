
import 'package:category/core/helper/cache.dart';
import 'package:category/features/cart/model/data/cart_data.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'my_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper.init();
  runApp(
      DevicePreview(
          enabled: true,
     builder: (context) =>  const MyApp(),));
}
