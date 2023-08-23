import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/res/app_assets/app_assets.dart';
import 'package:flutter_application_1/res/app_strings/app_strings.dart';
import 'package:flutter_application_1/res/color/app_colors.dart';
import 'package:flutter_application_1/res/components/app_name_rich_text.dart';
import 'package:flutter_application_1/res/route/name_routes.dart';
import 'package:flutter_application_1/widgets/app_text.dart';
import 'package:flutter_application_1/widgets/loader.dart';
import 'package:flutter_application_1/view_model/home_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../res/components/card_box.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeViewModel homeViewModel = Get.put(HomeViewModel());

  @override
  void initState() {
    homeViewModel.fetchFoodData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: const AppNameRichText(),
        backgroundColor: AppColors.backGroundColor,
      ),
      drawer: Drawer(
        width: 280.w,
        shadowColor: Colors.white,
        surfaceTintColor: Colors.white,
        backgroundColor: AppColors.backGroundColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Image.asset(AppAssets.logo),
            ),
            ListTile(
              leading: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              title:  AppText(
                title: AppStrings.createCard,
                color: Colors.white,
                fontSize: 15.sp,
              ),
              onTap: () {
                Get.toNamed(NameRoutes.cardView);
              },
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Obx(
            () {
              return Container(
                width: double.infinity,
                height: 200,
                color: AppColors.backGroundColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    (homeViewModel.selectedIndices.isNotEmpty)
                        ? Padding(
                            padding: const EdgeInsets.only(bottom: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:
                                  homeViewModel.selectedIndices.map((index) {
                                var cardModel = homeViewModel.foodData[index];
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Draggable(
                                    feedback: CardBox(
                                      cardText: cardModel.cardText,
                                      imagePath: cardModel.imagePath,
                                    ),
                                    onDragCompleted: () {
                                      // homeViewModel.removeSelectedCard(index);
                                    },
                                    child: CardBox(
                                      cardText: cardModel.cardText,
                                      imagePath: cardModel.imagePath,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          )
                        : Container(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DragTarget(onAccept: (int data) {
                          // log('////////////');
                          // homeViewModel.removeSelectedCard(data);
                        }, builder: (
                          context,
                          List<dynamic> accepted,
                          List<dynamic> rejected,
                        ) {
                          return Padding(
                            padding:
                                const EdgeInsets.only(right: 18.0, bottom: 10),
                            child: GestureDetector(
                              onTap: () {
                                homeViewModel.deleteIconOnTap();
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.delete),
                              ),
                            ),
                          );
                        }),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, bottom: 10),
                          child: GestureDetector(
                            onTap: () {
                              homeViewModel.playVoiceOnTap();
                            },
                            child: Container(
                              height: 50,
                              width: 200,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(
                                Icons.play_circle,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
          Expanded(
            child: Obx(
              () {
                if (homeViewModel.foodData.isEmpty) {
                  return const Loader();
                } else {
                  return SizedBox(
                    height: 400,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 5, right: 5, top: 10),
                      child: ListView(
                        children: [
                           Padding(
                            padding: EdgeInsets.only(
                              left: 20,
                              bottom: 10,
                            ),
                            child: Container(
                              width: 10.w,
                              decoration: BoxDecoration(
                                // color: Colors.grey,
                              ),
                              child: AppText(
                                title: 'Foods',
                                fontSize: 18,
                                color: AppColors.appThemeDarkColor,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 20.h,
                              right: 20.h,
                            ),
                            child: GridView.builder(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 8,
                              ),
                              itemCount: homeViewModel.foodData.length,
                              itemBuilder: (context, index) {
                                var cardModel = homeViewModel.foodData[index];
                                return CardBox(
                                  imagePath: cardModel.imagePath,
                                  cardText: cardModel.cardText,
                                  onTap: () {
                                    if (homeViewModel.selectedIndices.length <
                                        3) {
                                      homeViewModel.selectedIndices.add(index);
                                    }
                                    homeViewModel
                                        .playVoices(cardModel.cardText);
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
