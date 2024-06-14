import 'package:dartz/dartz.dart';
import 'package:skori/modules/teams/domain/entity/team_statistics_entity.dart';
import 'package:skori/modules/transfers/domain/entity/transfer_entity.dart';
import 'package:skori/modules/transfers/domain/repository/transfer_repository.dart';
import '../../../../core/errors/faliure.dart';
import '../../../nav_bar/domain/entity/match_entity.dart';
import '../../../news/domain/entity/news_entity.dart';
import '../../../players/domain/entity/player_entity.dart';


class TransfersUseCase{
  final  TransferRepository transferRepository;

  TransfersUseCase(this.transferRepository);

  Future<Either<Failure,List<TransferEntity>>> getTransfers({required int page, String? playerName,String? teamName, String? tournamentId, String? playerId,String? teamId, String?seasonId})async{
    return await transferRepository.getTransfers(page:page,teamName: teamName??"",tournamentId: tournamentId??"",seasonId: seasonId??"", playerId: playerId??"",teamId: teamId??"",playerName: playerName??"");
  }

}

