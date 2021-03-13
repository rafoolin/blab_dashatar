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
        title: Text('${dashatar.characteristic.role.name}'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () async {
              // Save the image and show a message to the user.
              await imageProcess
                  .saveDashatar2Gallery(dashatar, baseCacheManager)
                  .then((serviceResponse) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: serviceResponse.isSuccess
                        ? Text('Image Successfully saved in gallery')
                        : Text("Sorry Dashatar couldn't be saved"),
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
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text('Class:'),
                        Text(
                          '${dashatar.characteristic.role.name}',
                          textScaleFactor: 1.2,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text('Strength:'),
                      Text(
                        '${dashatar.characteristic.attributes.strength}',
                        textScaleFactor: 1.2,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text('Agility:'),
                      Text(
                        '${dashatar.characteristic.attributes.agility}',
                        textScaleFactor: 1.2,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text('Widom:'),
                      Text(
                        '${dashatar.characteristic.attributes.wisdom}',
                        textScaleFactor: 1.2,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text('Charisma:'),
                      Text(
                        '${dashatar.characteristic.attributes.charisma}',
                        textScaleFactor: 1.2,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
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
