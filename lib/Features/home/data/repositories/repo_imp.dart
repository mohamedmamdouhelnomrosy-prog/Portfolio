import 'package:portfolio/Features/home/data/datasources/remote/remote_data_source.dart';
import 'package:portfolio/Features/home/domain/entities/portfilio_entity.dart';
import 'package:portfolio/Features/home/domain/repositories/repo.dart';

import '../../../../Core/Error/failures.dart';
import '../../../../Core/Network/custom_either.dart';

class RepoImp implements Repo {
  final RemoteDataSource dataSource;
  const RepoImp(this.dataSource);
  Future<Either<Failure, PortfolioEntity>> getData() async {
    final res = await dataSource.getData();
    print('r : #${res.right?.profile?.firstName}');
    return res.fold((l) => Either.left(l), (r) => Either.right(r.fromModel()));
  }
}
