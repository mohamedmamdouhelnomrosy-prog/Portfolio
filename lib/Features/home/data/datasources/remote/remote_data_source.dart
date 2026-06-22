import 'package:portfolio/Core/Error/failures.dart';
import 'package:portfolio/Core/Network/custom_either.dart';
import 'package:portfolio/Features/home/data/models/portfilio_model.dart';

abstract class RemoteDataSource {
  Future<Either<Failure, PortfolioModel>> getData();
}
