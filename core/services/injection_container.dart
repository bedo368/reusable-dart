part of 'injection_container_imports.dart';

final sl = GetIt.instance;

Future<void> initInjection() async {
  await initToggle();
}

Future<void> initToggle() async {
  sl
    ..registerFactory(
        () => ThemeControllerCubit(getCurrentMode: sl(), toggleTheme: sl()))
    ..registerLazySingleton(() => ToggleThemeUseCase(sl()))
    ..registerLazySingleton(() => GetCurrentModeFromLocalStorageUseCase(sl()))
    ..registerLazySingleton<ThemeRepo>(() => ThemeRepoImpl(sl()))
    ..registerLazySingleton<HiveInterface>(() => Hive);
}
