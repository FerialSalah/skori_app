import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/widgets/main_text.dart';
import 'package:skori/generated/locale_keys.g.dart';
import 'package:skori/modules/transfers/presentaion/bloc/transfers_bloc.dart';
import 'package:skori/modules/transfers/presentaion/bloc/transfers_event.dart';
import 'package:skori/modules/transfers/presentaion/widgets/player_transfers_filter.dart';
import 'package:skori/modules/transfers/presentaion/widgets/transfer_card.dart';
import 'package:skori/modules/transfers/presentaion/widgets/transfers_widget.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

import '../../../../core/state/base_state.dart';
import '../../../../core/widgets/app_bar/app_bar_with_filter.dart';
import '../../../../core/widgets/empty.dart';
import '../../../../core/widgets/loader.dart';
import '../../../../core/widgets/offline_widget.dart';
import '../../../../core/widgets/shimmer_widget.dart';
import '../../../../core/injection/injection_app.dart' as di;

class TransfersScreen extends StatefulWidget {
  const TransfersScreen({super.key});

  @override
  State<TransfersScreen> createState() => _TransfersScreenState();
}

class _TransfersScreenState extends State<TransfersScreen> {
@override
  void initState() {
    BlocProvider.of<TransfersBloc>(context)..add(GetTransfersData());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarsWithFilter.appBarTitle(
            title: LocaleKeys.transfers.tr(),
            search: true,
            filter: true,
            onTap: () {
              showSlidingBottomSheet(context, builder: (_) {
                return SlidingSheetDialog(
                    elevation: 8,
                    cornerRadius: 16,
                    snapSpec: SnapSpec(
                      snap: true,
                      snappings: [1.0, 1.0],
                      positioning: SnapPositioning.relativeToAvailableSpace,
                    ),
                    builder: (_, state) {
                      return PlayerTransfersFilterSheet();
                    });
              });
            }
        ),
        body: TransfersItems()
    );
  }
}
