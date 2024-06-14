import 'package:dartz/dartz.dart';
import 'package:skori/modules/leagues_and_tabels/domain/entity/leagues_entity.dart';
import 'package:skori/modules/news/domain/entity/news_entity.dart';
import 'package:skori/modules/profile/domain/entity/notification_entity.dart';
import 'package:skori/modules/teams/domain/entity/team_entity.dart';
import '../../../../core/errors/faliure.dart';
import '../../../players/domain/entity/player_entity.dart';
import '../repository/profile_repository.dart';

class ProfileUseCase{
  final  ProfileRepository profileRepository;

  ProfileUseCase(this.profileRepository);




  Future<Either<Failure, Unit>> editProfile(
      {required String firstName,required String lastName,required String email ,
        required String phone, required String gender,}) async =>
      profileRepository.editProfile(
          firstName: firstName, lastName: lastName, gender: gender, phone: phone, email: email);

  Future<Either<Failure, Unit>> changePassword(
      {required String oldPassword,required String newPassword,required String newPasswordConfirm}) async =>
      profileRepository.changePassword(oldPassword: oldPassword,newPassword: newPassword,newPasswordConfirm: newPasswordConfirm);


  Future<Either<Failure,List<PlayerEntity>>> getFollowingPlayers(int page)async{
    return await profileRepository.getFollowingPlayers(page);
  }

  Future<Either<Failure,List<TeamEntity>>> getFollowingTeams(int page)async{
    return await profileRepository.getFollowingTeams(page);
  }
  Future<Either<Failure,List<LeagueEntity>>> getFollowingLeagues(int page)async{
    return await profileRepository.getFollowingLeagues(page);
  }

  
  Future<Either<Failure,List<PlayerEntity>>> getFavoritesPlayers(int page)async{
    return await profileRepository.getFavoritesPlayers(page);
  }

  Future<Either<Failure,List<TeamEntity>>> getFavoritesTeams(int page)async{
    return await profileRepository.getFavoritesTeams(page);
  }

  Future<Either<Failure,List<LeagueEntity>>> getFavoritesLeagues(int page)async{
    return await profileRepository.getFavoritesLeagues(page);
  }
  Future<Either<Failure,List<NewsEntity>>> getFavoritesNews(int page)async{
    return await profileRepository.getFavoritesNews(page);
  }
  Future<Either<Failure,List<NotificationEntity>>> getNotifications()async{
    return await profileRepository.getNotifications();
  }


  Future<Either<Failure, Unit>> contactUs(
      {required String name,required String email,required String message}) async =>
      profileRepository.contactUs(name: name,email: email,message: message);

  Future<Either<Failure, Unit>> deleteNotification(
      {required String id}) async =>
      profileRepository.deleteNotification(id: id);

}

