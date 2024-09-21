import 'package:flutter/material.dart';
import 'package:netflixdemo/core/colors.dart';
import 'package:netflixdemo/presentation/downloads/widgets/screen_downloads.dart';
import 'package:netflixdemo/presentation/fast_laugh/screen_fast_laugh.dart';
import 'package:netflixdemo/presentation/home/screen_home.dart';
import 'package:netflixdemo/presentation/main_pages/widgets/bottom_nav.dart';
import 'package:netflixdemo/presentation/new_and_hot/screen_new_and_hot.dart';
import 'package:netflixdemo/presentation/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});
  final _pages = [
    ScreenHome(),
    ScreenNewAndHot(),
    ScreenFastLaugh(),
    ScreenSearch(),
    ScreenDownloads()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (context, index, child) {
            return _pages[index];
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationWidget(),
    );
  }
}
