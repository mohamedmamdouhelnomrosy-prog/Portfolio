import 'package:flutter/foundation.dart';
import 'package:portfolio/Core/Error/failures.dart';
import 'package:portfolio/Core/Network/custom_either.dart';
import 'package:portfolio/Core/Network/error_message_model.dart';
import 'package:portfolio/Features/home/data/datasources/remote/remote_data_source.dart';
import 'package:portfolio/Features/home/data/models/portfilio_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RemoteDataSourceImp implements RemoteDataSource {
  @override
  Future<Either<Failure, PortfolioModel>> getData() async {
    final supabase = Supabase.instance.client;

    final profileData =
        await supabase.from('profiles').select('id').limit(1).maybeSingle();

    if (profileData == null) {
      return Either.left(ServerFailure(ErrorMessageModel.local(
          statusMessage: 'No Id Found', errorMessage: 'No Id Found')));
    }

    final String firstId = profileData['id'];
    final response = await supabase.rpc(
      'get_portfolio_by_id',
      params: {'p_id': firstId},
    );
    if (response == null) {
      return Either.left(ServerFailure(ErrorMessageModel.local(
          statusMessage: 'No Data Found', errorMessage: 'No Data Found')));
    } else {
      if(kDebugMode) print('data :: ${response['projects']}');
      return Either.right(PortfolioModel.fromJson(response));
    }
  }
}
