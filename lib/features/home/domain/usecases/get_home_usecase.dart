import 'package:dartz/dartz.dart';

import '../../../../core/services/api/api_client/failure.dart';
import '../../data/models/home_data.dart';
import '../repositories/home_repository.dart';

class GetHomeUsecase {
  final HomeRepository repository;

  GetHomeUsecase(this.repository);

  Future<Either<Failure, HomeData>> execute() async {
    return await repository.getHome();
  }
}
