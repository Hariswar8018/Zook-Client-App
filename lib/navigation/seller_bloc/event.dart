abstract class SellerEvent {}

class CheckSellerEvent extends SellerEvent {
  final String email;
  CheckSellerEvent(this.email);
}
