import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/provider/reminder_provider.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/font_size/dimensions.dart';
import '../../../utill/images.dart';
import '../../../utill/style/lato_styles.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ReminderProvider>(context, listen: false).getReminderListData();
  }
  @override
  Widget build(BuildContext context) {
    var mH = MediaQuery.of(context).size.height;
    var mW = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorResources.backGroundColor,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 450,
                  width: mW,
                ),
                Container(
                  height: 420,
                  width: mW,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [ColorResources.colorPrimary, ColorResources.colorPrimary1]
                    ),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35), bottomRight: Radius.circular(35)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Hi, Habib 👋", style: latoSemiBold.copyWith(color: ColorResources.white, fontSize: Dimensions.fontSizeExtraLarge),),
                                const SizedBox(height: 5,),
                                Text("Let’s explore your notes", style: latoRegular.copyWith(color: ColorResources.white, fontSize: Dimensions.fontSizeDefault),),
                              ],
                            ),
                            Image.asset(Images.profile, height: 50, width: 50, fit: BoxFit.cover,),
                          ],
                        ),
                        const SizedBox(height: 30,),
                        Container(
                          // height: 140,
                          width: mW,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: ColorResources.whiteOpacity,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Welcome to TickTick Task", style: latoRegular.copyWith(color: ColorResources.white, fontWeight: FontWeight.w600, fontSize: Dimensions.fontSizeLarge),),
                                const SizedBox(height: 12,),
                                Text("Your one-stop app for task management. Simplify, track, and accomplish tasks with ease.", style: latoRegular.copyWith(color: ColorResources.white, fontWeight: FontWeight.w400, fontSize: Dimensions.fontSizeDefault),),
                                const SizedBox(height: 16,),
                                Container(
                                  height: 31,
                                  width: 109,
                                  decoration: BoxDecoration(
                                    color: ColorResources.buttonColor,
                                    borderRadius: BorderRadius.circular(70),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(Images.play, height: 11, width: 10,),
                                      const SizedBox(width: 5,),
                                      Text("Watch Video", style: latoRegular.copyWith(color: ColorResources.white, fontWeight: FontWeight.w500, fontSize: Dimensions.fontSizeDefault),)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Reminder Task", style: latoRegular.copyWith(color: ColorResources.white, fontWeight: FontWeight.w600, fontSize: Dimensions.fontSizeLarge),),
                            TextButton(
                                onPressed: (){},
                                child: Text("See All", style: latoRegular.copyWith(color: ColorResources.white, fontWeight: FontWeight.w600, fontSize: Dimensions.fontSizeLarge),)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Consumer<ReminderProvider>(builder: (context, reminder, child){
                  return Container(
                    margin: const EdgeInsets.only(top: 365,),
                    height: 120,
                    child: NotificationListener<OverscrollIndicatorNotification>(
                      onNotification: (overScroll){
                        overScroll.disallowIndicator();
                        return true;
                      },
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: reminder.reminderList.length,
                          itemBuilder: (BuildContext context, int index){
                            return Row(
                              children: [
                                const SizedBox(width: 15,),
                                Container(
                                  width: 170,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: ColorResources.white
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 5,),
                                        Image.asset("${reminder.reminderList[index].remindImage}", height: 38, width: 48,),
                                        const SizedBox(height: 5,),
                                        Text("${reminder.reminderList[index].title}", style: latoRegular.copyWith(color: ColorResources.colorPrimary, fontWeight: FontWeight.w500, fontSize: Dimensions.fontSizeLarge),),
                                        const SizedBox(height: 5,),
                                        Text("${reminder.reminderList[index].subTitle}", style: latoRegular.copyWith(color: ColorResources.hintTextColor, fontWeight: FontWeight.w400, fontSize: Dimensions.fontSizeDefault),),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                    ),
                  );
                }),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("All Tasks", style: latoBold.copyWith(color: ColorResources.black, fontWeight: FontWeight.w600, fontSize: Dimensions.fontSizeLarge),),
                  TextButton(
                      onPressed: (){},
                      child: Text("See All", style: latoRegular.copyWith(color: ColorResources.black, fontWeight: FontWeight.w600, fontSize: Dimensions.fontSizeLarge),)),
                ],
              ),
            ),
            Consumer<ReminderProvider>(builder: (context, allText, child){
              return SizedBox(
                height: mH - 600,
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (overScroll){
                    overScroll.disallowIndicator();
                    return true;
                  },
                  child: ListView.builder(
                      itemCount: allText.reminderList.length,
                      itemBuilder: (BuildContext context, int index){
                        return Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                          child: Container(
                            height: 80,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorResources.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Row(
                                children: [
                                  Image.asset("${allText.reminderList[index].remindImage}", height: 38, width: 48,),
                                  const SizedBox(width: 10,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("${allText.reminderList[index].title}", style: latoRegular.copyWith(color: ColorResources.colorPrimary, fontWeight: FontWeight.w500, fontSize: Dimensions.fontSizeLarge)),
                                      const SizedBox(height: 6,),
                                      Text("${allText.reminderList[index].subTitle}", style: latoRegular.copyWith(color: ColorResources.hintTextColor, fontWeight: FontWeight.w400, fontSize: Dimensions.fontSizeDefault),)
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
