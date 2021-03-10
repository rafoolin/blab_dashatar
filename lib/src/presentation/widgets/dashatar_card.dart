import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import '../../data/data.dart';
import '../presentation.dart';
import '../../logic/logic.dart';
import '../../constants/constants.dart';

class DashatarCard extends StatelessWidget {
  final Characteristic characteristic;

  const DashatarCard({Key key, this.characteristic}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    DashatarBloc dashatarBloc = BlocProvider.of<DashatarBloc>(context);
    Dashatar dashatar;

    return StreamBuilder<Dashatar>(
      stream: dashatarBloc.createDashatar(characteristic),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.hasError) return Container();

        dashatar = snapshot.data;
        return GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(
            DetailScreen.routeName,
            arguments: dashatar,
          ),
          child: CachedNetworkImage(
            imageUrl: dashatar.imageUrl,
            imageBuilder: (context, imageProvider) => _Card(
              dashatar: dashatar,
              imageProvider: imageProvider,
            ),
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(
              child: CircularProgressIndicator(
                value: downloadProgress.progress,
              ),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        );
      },
    );
  }
}

class _Card extends StatefulWidget {
  final Dashatar dashatar;
  final ImageProvider imageProvider;

  const _Card({Key key, this.dashatar, this.imageProvider}) : super(key: key);

  @override
  __CardState createState() => __CardState();
}

class __CardState extends State<_Card> {
  DashatarBloc _dashatarBloc;
  ImageProvider _imageProvider;
  Dashatar _dashatar;
  bool _isFavored;

  @override
  void didUpdateWidget(covariant _Card oldWidget) {
    _dashatar = widget.dashatar;
    _imageProvider = widget.imageProvider;
    _isFavored = _dashatar.isFavored;
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    _dashatar = widget.dashatar;
    _imageProvider = widget.imageProvider;
    _isFavored = _dashatar.isFavored;
    _dashatarBloc = BlocProvider.of<DashatarBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      width: 300.0,
      height: 280.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: _imageProvider,
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(_dashatar.characteristic.role.name, textScaleFactor: 1.2),
              IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: _isFavored ? Colors.red : Colors.grey,
                ),
                onPressed: () {
                  _dashatarBloc
                      .setAsFav(_dashatar.characteristic, !_isFavored)
                      .then(
                          (value) => setState(() => _isFavored = !_isFavored));
                },
              )
            ],
          ),
          _AttributeTile(attributes: _dashatar.characteristic.attributes),
        ],
      ),
    );
  }
}

class _AttributeTile extends StatelessWidget {
  final Attributes attributes;

  const _AttributeTile({Key key, this.attributes}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );
    return Container(
      height: 24.0,
      alignment: Alignment.center,
      color: Colors.white54,
      child: RichText(
        text: TextSpan(
          text: "S: ",
          style: style,
          children: [
            TextSpan(
              style: style.copyWith(color: Colors.blueGrey),
              text: "${attributes.strength}",
            ),
            TextSpan(
              text: "\t\tA: ",
            ),
            TextSpan(
              style: style.copyWith(color: Colors.blueGrey),
              text: "${attributes.agility}",
            ),
            TextSpan(
              text: "\t\tW: ",
            ),
            TextSpan(
              style: style.copyWith(color: Colors.blueGrey),
              text: "${attributes.wisdom}",
            ),
            TextSpan(
              text: "\t\tC: ",
            ),
            TextSpan(
              style: style.copyWith(color: Colors.blueGrey),
              text: "${attributes.charisma}",
            ),
          ],
        ),
      ),
    );
  }
}
