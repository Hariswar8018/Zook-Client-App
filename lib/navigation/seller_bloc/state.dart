import 'package:zook/models/SellerModel.dart' show SellerModel;

abstract class SellerState {}

class SellerInitial extends SellerState {}
class SellerLoading extends SellerState {}
class SellerExists extends SellerState {
  final SellerModel seller;
  SellerExists(this.seller);
}

class SellerNotFound extends SellerState {}
class SellerError extends SellerState {
  final String message;
  SellerError(this.message);
}
