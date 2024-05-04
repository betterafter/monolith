import 'package:get_it/get_it.dart';

class ServiceLocator {
  final _getIt = GetIt.instance;

  void injectSpecificDependency<T>(T? object, Function? registerFunction) {
    if (object == null) {
      return;
    }

    if (_getIt.isRegistered(instance: object)) {
      registerFunction?.call();
    }
  }


}