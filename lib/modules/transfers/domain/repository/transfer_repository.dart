import 'package:dartz/dartz.dart';
import 'package:skori/modules/transfers/domain/entity/transfer_entity.dart';

import '../../../../core/errors/faliure.dart';

abstract class TransferRepository{
  Future<Either<Failure,List<TransferEntity>>> getTransfers({required int page,String? playerId, String?teamId, String? tournamentId,String? seasonId,String? playerName, String? teamName});

}