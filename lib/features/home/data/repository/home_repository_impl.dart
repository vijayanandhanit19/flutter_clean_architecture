import 'package:dartz/dartz.dart';

import '../../../../core/services/api/api_client/failure.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasource/home_datasource.dart';
import '../models/home_data.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSourceImpl homeDatasource = HomeRemoteDataSourceImpl();

  @override
  Future<Either<Failure, HomeData>> getHome() async {
    try {
      final result = await homeDatasource.getHomeData();
      return Right(result);
    } catch (error) {
      return Left(Exception(error.toString()));
    }
  }
}
