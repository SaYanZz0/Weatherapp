import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weatherapp/utils/size_config.dart';

import '../controller/home_controller.dart';
import '../model/current_weather_data.dart';
import '../model/models/five_days_data.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<HomeController>(
        builder: (controller) => SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: getProportionateScreenHeight(270),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/cloud-in-blue-sky.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal:getProportionateScreenWidth(20) , vertical: getProportionateScreenWidth(40)),
                      child: TextField(
                        onChanged: (value) => controller.city = value,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        textInputAction: TextInputAction.search,
                        onSubmitted: (value) => controller.updateWeather(),
                        decoration: InputDecoration(
                          suffixIcon: const Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          hintStyle: const TextStyle(color: Colors.white),
                          hintText: 'Search'.toUpperCase(),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const Alignment(0.0, 1.0),
                      child: SizedBox(
                        height: getProportionateScreenHeight(60),
                        width: getProportionateScreenWidth(15),
                        child: OverflowBox(
                          minWidth: 0.0,
                          maxWidth: MediaQuery.of(context).size.width,
                          minHeight: 0.0,
                          maxHeight: (MediaQuery.of(context).size.height / 3.5),
                          child: Stack(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                width: double.infinity,
                                height: double.infinity,
                                child: Card(
                                  color: Colors.white,
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Center(
                                            child: Text(
                                              (controller.currentWeatherData !=
                                                  null)
                                                  ? '${controller.currentWeatherData.name}'
                                                  .toUpperCase()
                                                  : '',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption
                                                  ?.copyWith(
                                                color: Colors.black45,
                                                fontSize: 24,
                                                fontWeight:
                                                FontWeight.bold,
                                                fontFamily:
                                                'flutterfonts',
                                              ),
                                            ),
                                          ),
                                          Center(
                                            child: Text(
                                              DateFormat()
                                                  .add_MMMMEEEEd()
                                                  .format(DateTime.now()),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption
                                                  ?.copyWith(
                                                color: Colors.black45,
                                                fontSize: 16,
                                                fontFamily:
                                                'flutterfonts',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Divider(),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                            padding: const EdgeInsets.only(left: 50),
                                            child: Column(
                                              children: <Widget>[
                                                Text(
                                                  (controller.currentWeatherData
                                                      .weather !=
                                                      null)
                                                      ? '${controller.currentWeatherData.weather![0].description}'
                                                      : '',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption
                                                      ?.copyWith(
                                                    color: Colors.black45,
                                                    fontSize: 18,
                                                    fontFamily:
                                                    'flutterfonts',
                                                  ),
                                                ),
                                                Text(
                                                  (controller.currentWeatherData
                                                      .main !=
                                                      null)
                                                      ? '${(controller.currentWeatherData.main!.temp! - 273.15).round().toString()}\u2103'
                                                      : '',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline3
                                                      ?.copyWith(
                                                      color: Colors.black45,
                                                      fontFamily:
                                                      'flutterfonts'),
                                                ),
                                                Text(
                                                  (controller.currentWeatherData
                                                      .main !=
                                                      null)
                                                      ? 'min: ${(controller.currentWeatherData.main!.tempMin! - 273.15).round().toString()}\u2103 / max: ${(controller.currentWeatherData.main!.tempMax! - 273.15).round().toString()}\u2103'
                                                      : '',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption
                                                      ?.copyWith(
                                                    color: Colors.black45,
                                                    fontSize: 12,
                                                    fontWeight:
                                                    FontWeight.bold,
                                                    fontFamily:
                                                    'flutterfonts',
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.only(right: 20),
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: <Widget>[
                                                Container(
                                                  width: getProportionateScreenWidth(100),
                                                  height: getProportionateScreenWidth(70),
                                                  decoration: const BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          'assets/images/icon-01.jpg'),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  child: Text(
                                                    (controller.currentWeatherData
                                                        .wind !=
                                                        null)
                                                        ? 'wind ${controller.currentWeatherData.wind!.speed} m/s'
                                                        : '',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .caption
                                                        ?.copyWith(
                                                      color: Colors.black45,
                                                      fontSize: 14,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      fontFamily:
                                                      'flutterfonts',
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      padding: const EdgeInsets.only(top: 85),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                'other city'.toUpperCase(),
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    ?.copyWith(
                                  fontSize: 16,
                                  fontFamily: 'flutterfonts',
                                  color: Colors.black45,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(170),
                              child: ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (context, index) =>
                                    const VerticalDivider(
                                      color: Colors.transparent,
                                      width: 5,
                                    ),
                                itemCount: controller.dataList.length,
                                itemBuilder: (context, index) {
                                  CurrentWeatherData? data;
                                  (controller.dataList.isNotEmpty)
                                      ? data = controller.dataList[index]
                                      : data = null;
                                  return SizedBox(
                                    width: getProportionateScreenWidth(120),
                                    height: getProportionateScreenHeight(160),
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Container(
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              (data != null)
                                                  ? '${data.name}'
                                                  : '',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption
                                                  ?.copyWith(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black45,
                                                fontFamily: 'flutterfonts',
                                              ),
                                            ),
                                            Text(
                                              (data != null)
                                                  ? '${(data.main!.temp! - 273.15).round().toString()}\u2103'
                                                  : '',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption
                                                  ?.copyWith(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black45,
                                                fontFamily: 'flutterfonts',
                                              ),
                                            ),
                                            Container(
                                              width: 50,
                                              height: 50,
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/icon-01.jpg'),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                                              child: Text(
                                                (data != null)
                                                    ? '${data.weather![0].description}'
                                                    : '',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption
                                                    ?.copyWith(
                                                  color: Colors.black45,
                                                  fontFamily: 'flutterfonts',
                                                  fontSize: 14,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 5),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'forcast next 5 days'.toUpperCase(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption
                                        ?.copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black45,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.next_plan_outlined,
                                    color: Colors.black45,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 240,
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: SfCartesianChart(
                                  primaryXAxis: CategoryAxis(),
                                  series: <ChartSeries<FiveDayData, String>>[
                                    SplineSeries<FiveDayData, String>(
                                      dataSource: controller.fiveDaysData,
                                      xValueMapper: (FiveDayData f, _) =>
                                      f.dateTime,
                                      yValueMapper: (FiveDayData f, _) =>
                                      f.temp,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}