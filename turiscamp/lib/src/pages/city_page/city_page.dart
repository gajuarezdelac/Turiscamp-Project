import 'package:flutter/material.dart';
import 'package:turiscamp/src/utils/constants.dart';
import 'package:turiscamp/src/widgets/header_widget.dart';

class CityPage extends StatefulWidget {
  const CityPage({Key? key}) : super(key: key);

  static String routeName = "city_page";

  @override
  State<CityPage> createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  final double _headerHeight = 250;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "City Page",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Constants.blueGeneric,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                height: _headerHeight,
                child: HeaderWidget(
                  _headerHeight,
                  false,
                  Icons.home_max,
                ), //let's create a common header widget
              ),
              SafeArea(
                child: FittedBox(
                  child: Container(
                    // height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.all(kFixPadding),
                    padding: const EdgeInsets.all(kFixPadding),
                    decoration: BoxDecoration(
                        color: kWhiteColor,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: const [
                          BoxShadow(color: kLightColor, blurRadius: 2.0)
                        ]),
                    child: Column(
                      children: [
                        Container(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: const [
                                Icon(Icons.home),
                                SizedBox(width: 6.0),
                                Text("Detalle de la ciudad",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 26)),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
