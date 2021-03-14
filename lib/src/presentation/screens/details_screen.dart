import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import '../../services/image_process.dart';
import '../../constants/constants.dart';
import '../../data/data.dart';

class DetailScreen extends StatelessWidget {
  /// Route name
  static const String routeName = "/DetailScreen";
  final Dashatar dashatar;
  const DetailScreen({Key key, this.dashatar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DefaultCacheManager baseCacheManager = DefaultCacheManager();
    final ImageProcess imageProcess = ImageProcess();

    return Scaffold(
      appBar: AppBar(
        title: Text('Dashatar info'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            tooltip: 'Save Dashatar image to the gallery',
            onPressed: () async {
              // Save the image and show a message to the user.
              await imageProcess
                  .saveDashatar2Gallery(dashatar, baseCacheManager)
                  .then((serviceResponse) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: serviceResponse.isSuccess
                        ? Text('Image Successfully saved in gallery')
                        : Text("Sorry, need a storage permission!"),
                  ),
                );
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            CachedNetworkImage(
              cacheManager: baseCacheManager,
              imageUrl: dashatar.imageUrl,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                child: Center(
                  child: CircularProgressIndicator(
                    value: downloadProgress.progress,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            SizedBox(height: 48.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 48.0),
              child: Column(
                children: [
                  _AttributeInfo(
                    attribute: 'Class',
                    value: dashatar.characteristic.role.name,
                  ),
                  SizedBox(height: 8.0),
                  _AttributeInfo(
                    attribute: 'Strength',
                    value: dashatar.characteristic.attributes.strength,
                  ),
                  SizedBox(height: 8.0),
                  _AttributeInfo(
                    attribute: 'Agility',
                    value: dashatar.characteristic.attributes.agility,
                  ),
                  SizedBox(height: 8.0),
                  _AttributeInfo(
                    attribute: 'Wisdom',
                    value: dashatar.characteristic.attributes.wisdom,
                  ),
                  SizedBox(height: 8.0),
                  _AttributeInfo(
                    attribute: 'Charisma',
                    value: dashatar.characteristic.attributes.charisma,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _AttributeInfo extends StatelessWidget {
  final String attribute;
  final Object value;

  const _AttributeInfo({Key key, this.attribute, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text('$attribute:'),
          Text(
            '$value',
            textScaleFactor: 1.2,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
