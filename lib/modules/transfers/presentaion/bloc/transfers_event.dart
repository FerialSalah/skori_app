import 'package:equatable/equatable.dart';

abstract class TransfersEvent extends Equatable {
  const TransfersEvent();

  @override
  List<Object> get props => [];
}


class GetTransfersData extends TransfersEvent {
  GetTransfersData();
}

class TransfersPagination extends TransfersEvent {
  TransfersPagination();
}
