import 'package:assignment_test_xsis/common/strings.dart';
import 'package:assignment_test_xsis/module/home/controller/home_controller.dart';
import 'package:assignment_test_xsis/module/home/data/model/movie_popular/movie_popular.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeLatest extends StatelessWidget {
  const HomeLatest({
    super.key,
    required this.controller,
  });
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.popularLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Popular'),
          const SizedBox(
            height: 8,
          ),
          AspectRatio(
            aspectRatio: 5 / 2,
            child: SizedBox(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: controller.popularList.length,
                itemBuilder: (context, index) {
                  var item = controller.popularList[index];
                  return popularItem(item);
                },
              ),
            ),
          ),
        ],
      );
    });
  }

  Widget popularItem(MoviePopular popular) {
    return GestureDetector(
      onTap: () => controller.showDetail(movieId: popular.id ?? 0),
      child: Container(
        padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
        margin: const EdgeInsets.only(
          right: 16,
        ),
        width: 200,
        decoration: const BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.all(Radius.circular(24))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              TMBDStrings.getThumbImg +
                  popular.posterPath
                      .toString(), //'https://www.google.com/url?sa=i&url=https%3A%2F%2Fencrypted-tbn2.gstatic.com%2Fimages%3Fq%3Dtbn%3AANd9GcQeZl5f7yIvMVDPbWnJdds7oedgLAxvmVDCaYrmDlcMaNx9DvVb&psig=AOvVaw0vKhH9AbEPyb4YvggTFAZe&ust=1729844686839000&source=images&cd=vfe&opi=89978449&ved=0CBAQjRxqFwoTCICpy-LLpokDFQAAAAAdAAAAABAE',
              width: 100,
              height: 100,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              popular.title.toString(),
              //'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum molestie egestas vehicula. Proin id turpis semper, gravida lectus id, mollis tortor. Aliquam vel augue sagittis, aliquam mauris id, finibus augue. Curabitur velit mi, accumsan in ligula et, viverra posuere erat. Donec sollicitudin tincidunt orci nec aliquet. Phasellus finibus placerat elementum. Praesent in vulputate velit. Etiam aliquam id massa in placerat. Aenean molestie urna mi, vitae iaculis odio maximus eu.',
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
