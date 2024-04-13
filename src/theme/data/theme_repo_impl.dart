
import 'package:flutter_useable_widget_and_classes/errors/failure.dart';
import 'package:flutter_useable_widget_and_classes/src/theme/domain/repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_useable_widget_and_classes/usecase/usecase.dart';
import 'package:hive_flutter/hive_flutter.dart';

const currentModeBox = 'currentMode';

class ThemeRepoImpl implements ThemeRepo {
  ThemeRepoImpl(this._hive);
  final HiveInterface _hive;

  @override
  FutureResult<void> toggleTheme() async {
    try {
      final box = await _hive.openBox<bool>(currentModeBox);

      final value = box.get('isDark');
      if (value == null) {
        await box.put('isDark', false);
      } else {
        await box.put('isDark', !value);
      }
      return const Right(null);
    } catch (e) {
      return Left(Failure.createNewFailure(error: e));
    }
  }

  @override
  FutureResult<bool> getCurrentModeFromLocalStorage() async {
    try {
      final box = await _hive.openBox<bool>(currentModeBox);
      final isDark = box.get('isDark') ?? false;

      return Right(isDark);
    } catch (e) {
      return Left(Failure.createNewFailure(error: e));
    }
  }
}
