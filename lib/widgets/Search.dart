import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:weather_app/model/datamodel.dart';
import 'package:weather_app/repo.dart';

class SearchClass extends StatefulWidget {
  const SearchClass({super.key});

  @override
  State<SearchClass> createState() => __SearchClassState();
}

class __SearchClassState extends State<SearchClass> {
  final TextEditingController controller = TextEditingController();
  WeatherModel? weatherModel;
  String? iconModel;
  IconData? wIcon;
  @override
  Widget build(BuildContext context) {
    if (iconMapping.containsKey(iconModel)) {
      wIcon = iconMapping[iconModel]!;
    }
    void dispose() {
      controller.dispose();
      super.dispose();
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(18),
                    child: TextField(
                      style:  TextStyle(fontSize: 26,),
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: "Search City",
                        labelStyle: const TextStyle(fontSize: 18),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            controller.clear();
                            // onSearchTextChanged("");
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 120,
                  child: Container(
                    padding: const EdgeInsets.all(18),
                    child: ElevatedButton(
                      onPressed: () async {
                        weatherModel = await Repo().getWeather(controller.text);
                        // print(weatherModel?.main?.tempMax ?? "error");
                        iconModel = weatherModel?.weather?[0].icon.toString();

                        setState(() {});
                      },
                      style: const ButtonStyle(
                          minimumSize: MaterialStatePropertyAll(Size(60, 45))),
                      child: const Text("Go",style: TextStyle(color: Color.fromARGB(255, 199, 229, 244)
                     ,fontSize: 18 ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 40),
            child: Icon(wIcon, size: 80),
          ),
          Text(
            "${weatherModel?.weather?[0].description}",
            style: const TextStyle(fontSize: 28),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Feels like ${weatherModel?.main?.feelsLike}",
            style: const TextStyle(fontSize: 15),
          ),
          const SizedBox(
            height: 100,
          ),
          Container(
            padding: const EdgeInsets.only(left: 18, right: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(children: [
                  const Text(
                    "Latitude",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "${weatherModel?.coord?.lat}",
                    style: const TextStyle(fontSize: 18),
                  ),
                ]),
                Column(children: [
                  const Text("Temp",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "${weatherModel?.main?.temp}",
                    style: const TextStyle(fontSize: 18),
                  ),
                ]),
                Column(children: [
                  const Text("Longitude",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "${weatherModel?.coord?.lon}",
                    style: const TextStyle(fontSize: 18),
                  ),
                ])
              ],
            ),
          ),
          const SizedBox(
            height: 70,
          ),
          Container(
            padding: const EdgeInsets.only(left: 18, right: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(children: [
                  const Text(
                    "Humidity",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "${weatherModel?.main?.humidity}",
                    style: const TextStyle(fontSize: 18),
                  ),
                ]),
                Column(children: [
                  const Text("Pressure",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "${weatherModel?.main?.pressure}",
                    style: const TextStyle(fontSize: 18),
                  ),
                ]),
                Column(children: [
                  const Text("Wind Speed",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "${weatherModel?.wind?.speed}",
                    style: const TextStyle(fontSize: 18),
                  ),
                ])
              ],
            ),
          )
        ],
      ),
    );
  }
}
