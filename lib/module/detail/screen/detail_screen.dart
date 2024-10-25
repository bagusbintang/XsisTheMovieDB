import 'package:assignment_test_xsis/common/strings.dart';
import 'package:assignment_test_xsis/module/detail/controller/detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.movieID});
  final int movieID;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
      init: DetailController(movieID: movieID),
      builder: (DetailController controller) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: DraggableScrollableSheet(
            maxChildSize: .90,
            minChildSize: .90,
            initialChildSize: .90,
            snap: false,
            expand: false,
            controller: DraggableScrollableController(),
            builder: (context, scrollController) {
              return Container(
                width: Get.width,
                height: Get.height,
                // padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Obx(() {
                  if (controller.detailLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            onPressed: () => Get.back(),
                            icon: const Icon(Icons.cancel),
                            iconSize: 32,
                          ),
                        ),
                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: const BoxDecoration(
                              // color: Colors.grey,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: YoutubePlayer(
                              controller: controller.youtubePlayerController,
                              showVideoProgressIndicator: true,
                              progressIndicatorColor: Colors.amber,
                              progressColors: const ProgressBarColors(
                                playedColor: Colors.amber,
                                handleColor: Colors.amberAccent,
                              ),
                              onReady: () {
                                controller.youtubePlayerController.addListener(
                                  () {},
                                );
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.detailMovie.title.toString(),
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                controller.detailMovie.overview
                                    .toString(), //'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum molestie egestas vehicula. Proin id turpis semper, gravida lectus id, mollis tortor. Aliquam vel augue sagittis, aliquam mauris id, finibus augue. Curabitur velit mi, accumsan in ligula et, viverra posuere erat. Donec sollicitudin tincidunt orci nec aliquet. Phasellus finibus placerat elementum. Praesent in vulputate velit. Etiam aliquam id massa in placerat. Aenean molestie urna mi, vitae iaculis odio maximus eu.',
                                style: const TextStyle(),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 10,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              const Text(
                                'Production Companies',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              AspectRatio(
                                aspectRatio: 3 / 2,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: controller
                                      .detailMovie.productionCompanies!.length,
                                  itemBuilder: (context, index) {
                                    var item = controller.detailMovie
                                        .productionCompanies?[index];
                                    return Container(
                                      padding: const EdgeInsets.only(
                                          top: 8, left: 16, right: 16),
                                      margin: const EdgeInsets.only(
                                        right: 16,
                                      ),
                                      width: 200,
                                      decoration: const BoxDecoration(
                                          color: Colors.deepPurple,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(24))),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          if (item?.logoPath != null)
                                            Image.network(
                                              TMBDStrings.getOriginalImg +
                                                  (item?.logoPath ?? '')
                                                      .toString(), //'https://www.google.com/url?sa=i&url=https%3A%2F%2Fencrypted-tbn2.gstatic.com%2Fimages%3Fq%3Dtbn%3AANd9GcQeZl5f7yIvMVDPbWnJdds7oedgLAxvmVDCaYrmDlcMaNx9DvVb&psig=AOvVaw0vKhH9AbEPyb4YvggTFAZe&ust=1729844686839000&source=images&cd=vfe&opi=89978449&ved=0CBAQjRxqFwoTCICpy-LLpokDFQAAAAAdAAAAABAE',
                                              width: 100,
                                              height: 100,
                                            ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            item?.name ?? '',
                                            //'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum molestie egestas vehicula. Proin id turpis semper, gravida lectus id, mollis tortor. Aliquam vel augue sagittis, aliquam mauris id, finibus augue. Curabitur velit mi, accumsan in ligula et, viverra posuere erat. Donec sollicitudin tincidunt orci nec aliquet. Phasellus finibus placerat elementum. Praesent in vulputate velit. Etiam aliquam id massa in placerat. Aenean molestie urna mi, vitae iaculis odio maximus eu.',
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              );
            },
          ),
        );
      },
    );
  }
}
