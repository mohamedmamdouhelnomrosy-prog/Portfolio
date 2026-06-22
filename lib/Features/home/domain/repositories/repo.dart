import 'package:portfolio/Features/home/domain/entities/portfilio_entity.dart';

import '../../../../Core/Error/failures.dart';
import '../../../../Core/Network/custom_either.dart';

abstract class Repo {
  Future<Either<Failure, PortfolioEntity>> getData();
}
