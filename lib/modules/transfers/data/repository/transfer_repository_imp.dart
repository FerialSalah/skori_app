import 'package:dartz/dartz.dart';
import 'package:skori/core/errors/faliure.dart';
import 'package:skori/modules/transfers/domain/entity/transfer_entity.dart';
import 'package:skori/modules/transfers/domain/repository/transfer_repository.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/network/network_checker.dart';
import '../datasource/transfer_datasource.dart';

class TransfersRepositoryImp implements TransferRepository {
  final BaseTransfersDataSource baseTransfersDataSource;
  final NetworkChecker networkChecker;
  TransfersRepositoryImp(this.baseTransfersDataSource, this.networkChecker);

  @override
  Future<Either<Failure, List<TransferEntity>>> getTransfers(
      {required int page,
      String? playerId,
      String? teamId,
      String? tournamentId,
      String? seasonId,
      String? playerName,
      String? teamName}) async {
    if (await networkChecker.isDeviceConnected) {
      try {
        final result = await baseTransfersDataSource.getTransfers(
            page: page,
            playerName: playerName,
            teamName: teamName,
            playerId: playerId,
            teamId: teamId,
            tournamentId: tournamentId,
            seasonId: seasonId);
        print("r:${result.data}");
        return Right(result.data);
      } on ExceptionServiceCallBack catch (e) {
        print("err:${e.massage}");
        return Left(FailureServiceWithResponse(msg: e.massage));
      }
    } else {
      return Left(FailureOffline());
    }
  }
}
