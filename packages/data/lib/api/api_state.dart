abstract class ApiState<T> {
  factory ApiState.success({T data}) = ApiSuccessState;
  factory ApiState.error({T? data, Exception? exception}) = ApiErrorState;
}

class ApiSuccessState<T> implements ApiState<T> {
  final T? data;

  ApiSuccessState({this.data});
}

class ApiErrorState<T> implements ApiState<T> {
  final T? data;
  final Exception? exception;

  ApiErrorState({this.data, this.exception});
}