import 'package:flutter_useable_widget_and_classes/core/usecase/usecase.dart';
import 'package:flutter_useable_widget_and_classes/core/utils/typedef.dart';
import 'package:flutter_useable_widget_and_classes/src/on_boarding/domain/repo/onboarding_repo.dart';

class CheckIfUserIsFirstTime extends UseCaseswithOutParams<bool> {
  CheckIfUserIsFirstTime(this._repo);
  final OnBoardingRepo _repo;
  @override
  FutureResult<bool> call() async => _repo.checkIfUserIsFirstTime();
}
