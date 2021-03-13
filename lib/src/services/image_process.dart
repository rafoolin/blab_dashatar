import 'dart:io';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

import '../data/data.dart';

class ImageProcess {
  /// Save [Dashatar] avatar to gallery.
  ///
  /// Default quality is 80.
  Future<ServiceResponse> saveDashatar2Gallery(
    Dashatar dashatar,
    DefaultCacheManager cacheManager, {
    int quality = 80,
  }) async {
    // Get dashatar image file
    File file = await cacheManager.getSingleFile(dashatar.imageUrl);
    // Save dashatar
    var response = await ImageGallerySaver.saveImage(
      file.readAsBytesSync(),
      name: dashatar.characteristic.saveFileName,
      quality: quality,
    );
    return ServiceResponse(
      filePath: response["filePath"],
      isSuccess: response["isSuccess"],
    );
  }
}
