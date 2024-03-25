import 'package:random_user_app/domain/domain.dart';

class Handlers {
  ///
  /// Failure messages handler
  ///
  static String failureToStringMessage(Failure failure) {
    switch (failure) {
      case BadRequestFailure():
        return 'Ha ocurrido un error, intente nuevamente.';
      case NetworkFailure():
        return 'Upps! Parece que hay un error de conexión';
      case UnknownFailure():
        return 'Upps! Ocurrió un error desconocido.';
      default:
        throw UnimplementedError(
          'Unimplemented failure',
        );
    }
  }
}
