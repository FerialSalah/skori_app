
import 'package:dartz/dartz.dart';
import 'package:skori/modules/leagues_and_tabels/domain/entity/leagues_entity.dart';
import 'package:skori/modules/news/domain/entity/news_entity.dart';
import 'package:skori/modules/players/domain/entity/player_entity.dart';
import 'package:skori/modules/profile/domain/entity/notification_entity.dart';
import 'package:skori/modules/teams/domain/entity/team_entity.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/errors/faliure.dart';
import '../../../../core/network/network_checker.dart';
import '../../domain/repository/profile_repository.dart';
import '../datasource/profile_datasource.dart';

class ProfileRepositoryImp implements ProfileRepository {
  final BaseProfileDataSource baseProfileDataSource;
  final NetworkChecker networkChecker;
  ProfileRepositoryImp(this.baseProfileDataSource, this.networkChecker);



  @override
  Future<Either<Failure, Unit>> editProfile({required String firstName,required String lastName,required String email ,
  required String phone, required String gender,}) async {
    if (await networkChecker.isDeviceConnected) {
      try {
        final result = await baseProfileDataSource.editProfile(
            firstName: firstName, lastName: lastName, email: email, phone: phone, gender: gender);
        return Right(unit);
      } on ExceptionServiceCallBack catch (e) {
        return Left(FailureServiceWithResponse(msg: e.massage));
      }
    } else {
      return Left(FailureOffline());
    }
  }


  @override
  Future<Either<Failure, Unit>> changePassword({required String oldPassword,required String newPassword,required String newPasswordConfirm}) async {
    if (await networkChecker.isDeviceConnected) {
      try {
        final result = await baseProfileDataSource.changePassword(oldPassword:oldPassword,newPassword:newPassword,newPasswordConfirm: newPasswordConfirm);
        return Right(unit);
      } on ExceptionServiceAuthentication catch(e){
        return Left(FailureServiceValidation(errors: e.errors));
      } on ExceptionServiceCallBack catch (e) {
        return Left(FailureServiceWithResponse(msg: e.massage));
      }
    } else {
      return Left(FailureOffline());
    }
  }

  @override
  Future<Either<Failure, List<PlayerEntity>>> getFollowingPlayers(int page) async {
    if (await networkChecker.isDeviceConnected) {
      try {
        final result = await baseProfileDataSource.getFollowingPlayers(page: page,);
        return Right(result.data);
      } on ExceptionServiceCallBack catch (e) {
        return Left(FailureServiceWithResponse(msg: e.massage));
      }
    } else {
      return Left(FailureOffline());
    }
  }


  @override
  Future<Either<Failure, List<TeamEntity>>> getFollowingTeams(int page) async {
    if (await networkChecker.isDeviceConnected) {
      try {
        final result = await baseProfileDataSource.getFollowingTeams(page: page,);
        return Right(result.data);
      } on ExceptionServiceCallBack catch (e) {
        return Left(FailureServiceWithResponse(msg: e.massage));
      }
    } else {
      return Left(FailureOffline());
    }
  }

  @override
  Future<Either<Failure, List<LeagueEntity>>> getFollowingLeagues(int page) async {
    if (await networkChecker.isDeviceConnected) {
      try {
        final result = await baseProfileDataSource.getFollowingLeagues(page: page,);
        return Right(result.data);
      } on ExceptionServiceCallBack catch (e) {
        return Left(FailureServiceWithResponse(msg: e.massage));
      }
    } else {
      return Left(FailureOffline());
    }
  }

  @override
  Future<Either<Failure, List<PlayerEntity>>> getFavoritesPlayers(int page) async {
    if (await networkChecker.isDeviceConnected) {
      try {
        final result = await baseProfileDataSource.getFavoritesPlayers(page: page,);
        return Right(result.data);
      } on ExceptionServiceCallBack catch (e) {
        return Left(FailureServiceWithResponse(msg: e.massage));
      }
    } else {
      return Left(FailureOffline());
    }
  }

  @override
  Future<Either<Failure, List<LeagueEntity>>> getFavoritesLeagues(int page) async {
    if (await networkChecker.isDeviceConnected) {
      try {
        final result = await baseProfileDataSource.getFavoritesLeagues(page: page,);
        return Right(result.data);
      } on ExceptionServiceCallBack catch (e) {
        return Left(FailureServiceWithResponse(msg: e.massage));
      }
    } else {
      return Left(FailureOffline());
    }
  }

  @override
  Future<Either<Failure, List<TeamEntity>>> getFavoritesTeams(int page) async {
    if (await networkChecker.isDeviceConnected) {
      try {
        final result = await baseProfileDataSource.getFavoritesTeams(page: page,);
        return Right(result.data);
      } on ExceptionServiceCallBack catch (e) {
        return Left(FailureServiceWithResponse(msg: e.massage));
      }
    } else {
      return Left(FailureOffline());
    }
  }

  @override
  Future<Either<Failure, List<NewsEntity>>> getFavoritesNews(int page) async {
    if (await networkChecker.isDeviceConnected) {
      try {
        final result = await baseProfileDataSource.getFavoritesNews(page: page,);
        return Right(result.data);
      } on ExceptionServiceCallBack catch (e) {
        return Left(FailureServiceWithResponse(msg: e.massage));
      }
    } else {
      return Left(FailureOffline());
    }
  }

  @override
  Future<Either<Failure, List<NotificationEntity>>> getNotifications() async {
    if (await networkChecker.isDeviceConnected) {
      try {
        final result = await baseProfileDataSource.getNotifications();
        return Right(result.data);
      } on ExceptionServiceCallBack catch (e) {
        return Left(FailureServiceWithResponse(msg: e.massage));
      }
    } else {
      return Left(FailureOffline());
    }
  }


  @override
  Future<Either<Failure, Unit>> contactUs({required String name,required String email,required String message}) async {
    if (await networkChecker.isDeviceConnected) {
      try {
        final result = await baseProfileDataSource.contactUs(name: name,email: email,message: message);
        return Right(unit);
      }  on ExceptionServiceCallBack catch (e) {
        return Left(FailureServiceWithResponse(msg: e.massage));
      }
    } else {
      return Left(FailureOffline());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteNotification({required String id}) async {
    if (await networkChecker.isDeviceConnected) {
      try {
        final result = await baseProfileDataSource.deleteNotification(id:id);
        return Right(unit);
      }  on ExceptionServiceCallBack catch (e) {
        return Left(FailureServiceWithResponse(msg: e.massage));
      }
    } else {
      return Left(FailureOffline());
    }
  }






}