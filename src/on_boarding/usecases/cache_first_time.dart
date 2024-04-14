import 'package:flutter_useable_widget_and_classes/core/usecase/usecase.dart';
import 'package:flutter_useable_widget_and_classes/core/utils/typedef.dart';
import 'package:flutter_useable_widget_and_classes/src/on_boarding/domain/repo/onboarding_repo.dart';

class CacheFirstTime extends UseCaseswithOutParams<void> {
  CacheFirstTime(this._repo);
  final OnBoardingRepo _repo;
  @override
  FutureResult<void> call() async => _repo.cacheFirstTimer();
}
