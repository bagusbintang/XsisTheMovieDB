import 'package:assignment_test_xsis/common/strings.dart';
import 'package:assignment_test_xsis/module/home/controller/home_controller.dart';
import 'package:assignment_test_xsis/module/home/data/model/now_playing/now_playing.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeHeadline extends StatelessWidget {
  const HomeHeadline({
    super.key,
    required this.controller,
  });
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.nowPlayingLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Column(
          children: [
            CarouselSlider.builder(
              carouselController: controller.nowPlayingCarouselController,
              itemCount: 5,
              options: CarouselOptions(
                aspectRatio: 16 / 9,
                viewportFraction: 1.0,
                enlargeCenterPage: true,
                disableCenter: true,
                initialPage: controller.nowPlayingIndex.value,
                onPageChanged: (index, reason) async {
                  controller.changeHeadlineIndex(index);
                },
              ),
              itemBuilder: (context, index, realIndex) {
                var item = controller.nowPlayingList[index];
                return nowPlayingItem(item);
              },
            ),
            const SizedBox(
              height: 16,
            ),
            Center(
              child: AnimatedSmoothIndicator(
                activeIndex: controller.nowPlayingIndex.value,
                count: 5,
                effect: const SwapEffect(
                  dotColor: Colors.grey,
                  activeDotColor: Colors.deepPurple,
                  spacing: 8,
                  dotHeight: 8,
                  dotWidth: 8,
                  paintStyle: PaintingStyle.fill,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget nowPlayingItem(NowPlaying nowPlaying) {
    return GestureDetector(
      onTap: () => controller.showDetail(movieId: nowPlaying.id??0),
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.all(Radius.circular(24))),
        child: Row(
          children: [
            Image.network(
              TMBDStrings.getThumbImg +
                  nowPlaying.posterPath
                      .toString(), //'https://www.google.com/url?sa=i&url=https%3A%2F%2Fencrypted-tbn2.gstatic.com%2Fimages%3Fq%3Dtbn%3AANd9GcQeZl5f7yIvMVDPbWnJdds7oedgLAxvmVDCaYrmDlcMaNx9DvVb&psig=AOvVaw0vKhH9AbEPyb4YvggTFAZe&ust=1729844686839000&source=images&cd=vfe&opi=89978449&ved=0CBAQjRxqFwoTCICpy-LLpokDFQAAAAAdAAAAABAE',
              width: 100,
              height: 100,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nowPlaying.title.toString(),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    nowPlaying.overview
                        .toString(), //'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum molestie egestas vehicula. Proin id turpis semper, gravida lectus id, mollis tortor. Aliquam vel augue sagittis, aliquam mauris id, finibus augue. Curabitur velit mi, accumsan in ligula et, viverra posuere erat. Donec sollicitudin tincidunt orci nec aliquet. Phasellus finibus placerat elementum. Praesent in vulputate velit. Etiam aliquam id massa in placerat. Aenean molestie urna mi, vitae iaculis odio maximus eu.',
                    style: const TextStyle(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
