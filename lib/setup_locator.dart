import 'package:get_it/get_it.dart';
import 'form_state_service.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<FormStateService>(() => FormStateService());
}
