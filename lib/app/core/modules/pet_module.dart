import 'package:flutter/material.dart';
import 'package:meupet/app/core/modules/pet_list_page.dart';
import 'package:provider/single_child_widget.dart';

abstract class PetModule {
  final Map<String, WidgetBuilder> _routers;
  final List<SingleChildWidget>? _bindings;

  PetModule(
      {List<SingleChildWidget>? bindings,
      required Map<String, WidgetBuilder> routers})
      : _routers = routers,
        _bindings = bindings;

  Map<String, WidgetBuilder> get routers {
    return _routers.map((key, pageBuilder) => MapEntry(
        key,
        (_) => PetListPage(
              bindings: _bindings,
              page: pageBuilder,
            )));
  }

  Widget getPage(String path, BuildContext context) {
    final widgetBuilder = _routers[path];
    if (widgetBuilder != null) {
      return PetListPage(page: widgetBuilder, bindings: _bindings);
    }
    throw Exception();
  }
}
