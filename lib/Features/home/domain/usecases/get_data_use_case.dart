import 'package:portfolio/Features/home/domain/entities/portfilio_entity.dart';
import 'package:portfolio/Features/home/domain/repositories/repo.dart';

import '../../../../Core/Error/failures.dart';
import '../../../../Core/Network/custom_either.dart';

class GetDataUseCase {
  final Repo repo;
  const GetDataUseCase(this.repo);
  Future<Either<Failure, PortfolioEntity>> call() async {
    return await repo.getData();
  }
}
