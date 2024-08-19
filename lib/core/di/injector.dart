import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injector.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  asExtension: true,
  preferRelativeImports: true
)
Future<void> injectableInit() async {
  await getIt.init();
}
