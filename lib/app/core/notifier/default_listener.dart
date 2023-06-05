import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';

import '../ui/messages.dart';
import 'default_notifier.dart';

class DefaultListenerNotifier {
  final DefaultChangeNotifier changeNotifier;

  DefaultListenerNotifier({required this.changeNotifier});

  void listener(
      {required BuildContext context,
      required SucessVoidCallBack? sucessCallBack,
      required EverVoidCallBack? everCallBack,
      ErrorVoidCallBack? errorCallBack}) {
    changeNotifier.addListener(() {
      if (everCallBack != null) {
        everCallBack(changeNotifier, this);
      }

      if (changeNotifier.loading) {
        Loader.show(context);
      } else {
        Loader.hide();
      }

      if (changeNotifier.hasError) {
        if (errorCallBack != null) {
          errorCallBack(changeNotifier, this);
        }
        Messages.of(context).showError(changeNotifier.error ?? 'Erro Interno');
      } else if (changeNotifier.isSuccess) {
        if (sucessCallBack != null) {
          sucessCallBack(changeNotifier, this);
        }
      }
    });
  }

  void dispose() {
    changeNotifier.removeListener(() {});
  }
}

typedef SucessVoidCallBack = void Function(
    DefaultChangeNotifier notifier, DefaultListenerNotifier listenerNotifier);

typedef ErrorVoidCallBack = void Function(
    DefaultChangeNotifier notifier, DefaultListenerNotifier listenerNotifier);

typedef EverVoidCallBack = void Function(
    DefaultChangeNotifier notifier, DefaultListenerNotifier listenerNotifier);
