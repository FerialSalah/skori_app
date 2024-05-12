/// For Init states with no initial data.
/// if a models is needed please make a custom one e.g. LoginInitState at lib/modules/common/login/cubit
class InitState<T> extends BaseState<T> {
  const InitState();
}

/// For Loading states.
class LoadingState<T> extends BaseState<T> {
  const LoadingState();
}

/// For finished state with models.
class SuccessState<T> extends BaseState<T> {
  final T? data;

  SuccessState({this.data});
}

/// For Error state with optional error message.
class ErrorState<T> extends BaseState<T> {
  final String? msg;

  ErrorState({required this.msg});
}

class ErrorDataState<T> extends BaseState<T> {
  final String? msg;

  ErrorDataState({required this.msg});
}
/// For Error state with optional error message.
class OfflineState<T> extends BaseState<T> {
  final String? msg;

  OfflineState({required this.msg});
}

class ValidateState<T> extends BaseState<T> {
  final Map<String,dynamic>? errors;

  ValidateState({required this.errors});
}

/// For finished state with no models returned or needed.
class DoneState<T> extends BaseState<T> {
  final String? msg;

  DoneState({required this.msg});
}

class PaginateState<T> extends BaseState<T> {
  const PaginateState();
}

/// A Shared base class for all cubits states weather it`s shared like above states or custom ones.
class BaseState<T> {
  const BaseState();

  factory BaseState.init() = InitState<T>;
  factory BaseState.done({required String? msg}) = DoneState<T>;
  factory BaseState.PaginateState() = PaginateState<T>;
  factory BaseState.loading() = LoadingState<T>;
  factory BaseState.success({required T data}) = SuccessState<T>;
  factory BaseState.error({required String? msg}) = ErrorState<T>;
  factory BaseState.errorData({required String? msg}) = ErrorDataState<T>;

  String? getErrorMessage() {
    if (this is ErrorState) {
      return (this as ErrorState<T>).msg;
    }
    return null;
  }
}
