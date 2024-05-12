import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skori/modules/nav_bar/presentation/screens/home.dart';
import 'package:skori/modules/matches/presentation/screens/matches.dart';
import 'package:skori/modules/news/presentation/screens/news.dart';
import '../../../../core/constant/app_assets.dart';
import '../screens/my_account.dart';
import 'nav_bar_state.dart';


class NavBarCubit extends Cubit<NavBarStates>{
  NavBarCubit() : super(NavBarInit());

  static NavBarCubit of(context)=> BlocProvider.of(context);
   // GlobalKey<ScaffoldState> drawerKey = GlobalKey();
  List iconList = [
    AppNavBarIcons.home,
    AppNavBarIcons.matches,
    AppNavBarIcons.news,
    AppNavBarIcons.profile,
  ];

  List pages=[
    HomeScreen(),
    MatchesScreen(),
    NewsScreen(),
    MyAccountScreen(),

  ];


  int currentIndex = 0;


  void changeIndex(int value){
    if(currentIndex == value) return;
    currentIndex = value;
    emit(NavBarInit());
  }
  void changeState(){
    emit(NavBarInit());
  }

}