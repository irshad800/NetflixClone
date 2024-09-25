import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflixdemo/core/colors.dart';
import 'package:netflixdemo/core/constants.dart';
import 'package:netflixdemo/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});
  final _widgetList = [
    const _smartDownloads(),
    kheight,
    Section2(),
    Section3()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            title: "Downloads",
            image: Image.network(
                "https://ih1.redbubble.net/image.618427277.3222/flat,800x800,075,f.u1.jpg"),
          ),
        ),
        body: ListView.separated(
          padding: EdgeInsets.all(10),
          itemCount: _widgetList.length,
          itemBuilder: (context, index) => _widgetList[index],
          separatorBuilder: (context, index) => SizedBox(
            height: 16,
          ),
        ));
  }
}

class Section2 extends StatelessWidget {
  Section2({super.key});
  final List ImageList = [
    'https://pad.mymovies.it/filmclub/2016/07/043/locandina.jpg',
    'https://www.kinonews.ru/insimgs/2023/poster/poster113677_1.jpg',
    'https://images.mid-day.com/images/images/2023/may/bloddydaddmainposter_d.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        const Text(
          "Introducing Download for you",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kwhiteColor, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Center(
          child: const Text(
            "we will download a personalized selection of movies and shows for you,so there is\n always something to watch on your device",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ),
        Container(
          width: size.width * 2,
          height: size.height * 0.44,
          color: Colors.black,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.withOpacity(.25),
                radius: size.width * 0.33,
              ),
              DownloadsImageWidget(
                ImageList: ImageList[0],
                angle: 27,
                margin: EdgeInsets.only(left: 100, bottom: 30),
                size: Size(size.width * 0.4, size.width * 0.53),
              ),
              DownloadsImageWidget(
                ImageList: ImageList[1],
                angle: -27,
                margin: EdgeInsets.only(right: 100, bottom: 30),
                size: Size(size.width * 0.4, size.width * 0.53),
              ),
              DownloadsImageWidget(
                radius: 20,
                ImageList: ImageList[2],
                angle: 0,
                margin: EdgeInsets.only(bottom: 10),
                size: Size(size.width * 0.37, size.width * 0.58),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 324,
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            onPressed: () {},
            child: Text(
              "Set Up",
              style: TextStyle(
                  color: kwhiteColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            color: kbuttonColorBlue,
          ),
        ),
        MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          onPressed: () {},
          child: Text(
            "See What you can Download",
            style: TextStyle(
                color: kblackcolor, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          color: kbuttonColorWhite,
        )
      ],
    );
  }
}

class _smartDownloads extends StatelessWidget {
  const _smartDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.settings,
          color: kwhiteColor,
        ),
        Text("Smart Downloads")
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    super.key,
    required this.ImageList,
    this.radius = 10,
    required this.angle,
    required this.margin,
    required this.size,
  });

  final String ImageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;

    return Transform.rotate(
      angle: angle * pi / 180,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Container(
          margin: margin,
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
              color: kblackcolor,
              image: DecorationImage(
                  image: NetworkImage(ImageList), fit: BoxFit.fill)),
        ),
      ),
    );
  }
}
