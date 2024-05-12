
import 'package:dartz/dartz.dart';
import 'package:skori/modules/nav_bar/domain/entity/home_entity.dart';
import 'package:skori/modules/nav_bar/domain/entity/match_entity.dart';
import 'package:skori/modules/nav_bar/domain/repository/nav_bar_repository.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/errors/faliure.dart';
import '../../../../core/network/network_checker.dart';
import '../datasource/nav_bar_datasource.dart';


class NavBarRepositoryImp implements NavBarRepository{
  final BaseNavBarDataSource baseNavBarDataSource;
  final NetworkChecker networkChecker;
  NavBarRepositoryImp(this.baseNavBarDataSource, this.networkChecker);


  @override
  Future<Either<Failure, List<MatchEntity>>> getMatches({required int page,String? date,String? tournamentId,String? teamId,String? countryId,String? seasonId}) async {
    if (await networkChecker.isDeviceConnected) {
      try {
        final result = await baseNavBarDataSource.getMatches(page:page,date: date,teamId: teamId,tournamentId: tournamentId,countryId: countryId,seasonId: seasonId);
        return Right(result.data);
      } on ExceptionServiceCallBack catch (e) {
        return Left(FailureServiceWithResponse(msg: e.massage));
      }
    } else {
      return Left(FailureOffline());
    }
  }

  @override
  Future<Either<Failure,HomeEntity>> getHome() async {
    if (await networkChecker.isDeviceConnected) {
      try {
        final result = await baseNavBarDataSource.getHome();
        return Right(result);
      } on ExceptionServiceCallBack catch (e) {
        return Left(FailureServiceWithResponse(msg: e.massage));
      }
    } else {
      return Left(FailureOffline());
    }
  }


}