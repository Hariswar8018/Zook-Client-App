import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zook/navigation/seller_bloc/event.dart';
import 'package:zook/navigation/seller_bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as ds;

import '../../models/SellerModel.dart';


class SellerBloc extends Bloc<SellerEvent, SellerState> {
  final SellerRepository repository;

  SellerBloc(this.repository) : super(SellerInitial()) {
    on<CheckSellerEvent>(_onCheckSeller);
  }

  Future<void> _onCheckSeller(
      CheckSellerEvent event, ds.Emitter<SellerState> emit) async {
    emit(SellerLoading());
    final seller = await repository.fetchSellerByEmail(event.email);

    if (seller != null) {
      emit(SellerExists(seller));
    } else {
      emit(SellerNotFound());
    }
  }
}


class SellerRepository {
  Future<SellerModel?> fetchSellerByEmail(String email) async {
    try {
      final request = ModelQueries.list(
        SellerModel.classType,
        where: SellerModel.AWSEMAIL.eq(email),
      );

      final response = await Amplify.API.query(request: request).response;

      if (response.data != null && response.data!.items.isNotEmpty) {
        return response.data!.items.first;
      }
      return null;
    } catch (e) {
      safePrint('Error fetching seller: $e');
      return null;
    }
  }
}
