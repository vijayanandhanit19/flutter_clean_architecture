import 'package:dartz/dartz.dart';

import '../../../../core/services/api/api_client/failure.dart';
import '../../data/models/home_data.dart';

abstract class HomeRepository {
  Future<Either<Failure, HomeData>> getHome();
}
