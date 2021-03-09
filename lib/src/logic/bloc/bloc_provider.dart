import 'package:flutter/material.dart';

import './bloc.dart';

class BlocProvider<T extends Bloc> extends StatefulWidget {
  final Widget child;
  final T bloc;
  BlocProvider({Key key, @required this.child, this.bloc}) : super(key: key);
  // ------------------------------- of ----------------------------------------
  static T of<T extends Bloc>(BuildContext context) {
    BlocProvider<T> provider =
        context.findAncestorWidgetOfExactType<BlocProvider<T>>();
    return provider.bloc;
  }

  // ------------------------------ createState --------------------------------
  _BlocProviderState<T> createState() => _BlocProviderState<T>();
}

class _BlocProviderState<T> extends State<BlocProvider<Bloc>> {
  // ------------------------------- build -------------------------------------
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

// ---------------------------------- dispose ----------------------------------
  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }
}
