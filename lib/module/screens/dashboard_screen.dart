part of '../../app_imoprts/app_imports.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    MovieBloc movieBloc = context.read<MovieBloc>();
    return SafeArea(
        child: BlocBuilder<MovieBloc, MovieState>(builder: (context, state) {
      return Scaffold(
//!--------------------------------------< App >--------------------------------------
          appBar: AppBar(
              title: Text(PAGES.values[movieBloc.currentPageIndex].uiName),
              actions: [
                Icon(FontAwesomeIcons.solidBell, size: 17),
                SizedBox(width: 15),
                CircleAvatar(
                    radius: 15,
                    backgroundColor: AppColors.backgroundColor,
                    child: Icon(FontAwesomeIcons.solidUser,
                        size: 15, color: Colors.black54)),
                SizedBox(width: 20)
              ]),
//!------------------------------< Bottom Navigation Bar >----------------------------
          bottomNavigationBar: Padding(
              padding: const EdgeInsets.only(bottom: 15, left: 25, right: 25),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            spreadRadius: 3)
                      ]),
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: BottomNavigationBar(
                          showUnselectedLabels: false,
                          backgroundColor: Colors.white,
                          showSelectedLabels: false,
                          selectedItemColor: AppColors.primary,
                          unselectedItemColor: Colors.grey,
                          currentIndex: movieBloc.currentPageIndex,
                          onTap: (index) {
                            movieBloc.add(ChangeBottomNavigationBarValuEvent(
                                value: index));
                          },
                          items: [
                            BottomNavigationBarItem(
                                icon: Icon(FontAwesomeIcons.solidCompass),
                                label: ''),
                            BottomNavigationBarItem(
                                icon: Icon(FontAwesomeIcons.solidHeart),
                                label: ''),
                            BottomNavigationBarItem(
                                icon: Icon(FontAwesomeIcons.solidStar),
                                label: ''),
                          ])))),
          body: IndexedStack(
              index: movieBloc.currentPageIndex,
              children: movieBloc.dashboardScreens));
    }));
  }
}
