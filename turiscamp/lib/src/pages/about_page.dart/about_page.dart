import 'package:flutter/material.dart';
import 'package:turiscamp/src/utils/constants.dart';
import 'package:turiscamp/src/utils/themes.dart';
import 'package:turiscamp/src/widgets/card_custom.dart';
import 'package:turiscamp/src/widgets/header_widget.dart';
import 'package:turiscamp/src/widgets/list_tile_custom.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  static String routeName = "about_page";

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final double _headerHeight = 250;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.only(left: 16, right: 20),
          alignment: Alignment.center,
          height: 60.0,
          width: 150,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/cotta.png'),
              fit: BoxFit.contain,
            ),
          ),
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
                        // Text(
                        //     'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                        //     style: kDarkTextStyle),
                        // SizedBox(height: 16.0),
                        Container(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: const [
                                Icon(Icons.home),
                                SizedBox(width: 6.0),
                                Text("¿Quienes somos?",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 26)),
                              ],
                            )),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 16, right: 20),
                          alignment: Alignment.center,
                          height: 200.0,
                          width: 200,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/logos-fin.jpg'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),

                        const Text(
                            "Somos una empresa que ha revolucionado la industria retail con una nueva forma de conectar a las personas a través de la venta de celulares a crédito. Ofrecemos diversos productos financieros, de manera eficiente, ágil, cómoda y confiable.",
                            style: TextStyle(color: kLightColor, fontSize: 19)),
                        const SizedBox(height: 16.0),
                        Container(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: const [
                                Icon(Icons.build_rounded),
                                SizedBox(width: 6.0),
                                Text("¿Cuál es nuestra misión?",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 22)),
                              ],
                            )),
                        const SizedBox(
                          height: 15.0,
                        ),

                        Image.asset("assets/images/credito.jpg"),
                        const SizedBox(
                          height: 15.0,
                        ),
                        const Text(
                            "Reinventamos la forma de dar productos financieros, logramos que sea fácil y rápido, creemos en la inclusión financiera y que la tecnología llegue a todos.",
                            style: TextStyle(color: kLightColor, fontSize: 19)),

                        const SizedBox(height: 16.0),
                        Container(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: const [
                                Icon(Icons.feed_outlined),
                                SizedBox(width: 6.0),
                                Text("Visión",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 22)),
                              ],
                            )),
                        const SizedBox(
                          height: 6.0,
                        ),

                        Image.asset("assets/images/promocion1.png"),
                        const SizedBox(
                          height: 15.0,
                        ),

                        const Text(
                            "Consolidar nuestro modelo Retail en todo México y lograr ser una empresa unicornio que tenga presencia en latinoamérica.",
                            style: TextStyle(color: kLightColor, fontSize: 19)),
                        const SizedBox(height: 16.0),
                        Container(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: const [
                                Icon(Icons.phone),
                                SizedBox(width: 6.0),
                                Text("Contacto",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 22)),
                              ],
                            )),
                        const SizedBox(
                          height: 6.0,
                        ),
                        CardCustom(
                          width: size.width - 40,
                          height: 88.9,
                          mLeft: 0,
                          mRight: 3,
                          child: ListTileCustom(
                            bgColor: purpleLight,
                            pathIcon: "line.svg",
                            title: "Número de contacto",
                            subTitle: "999 192 3939",
                          ),
                        ),
                        // const Text(
                        //     "Nos apasiona satisfacer las necesidades de nuestros clientes, siempre buscando soluciones innovadoras para brindarles la mejor experiencia, somos audaces, perseverantes y estamos enfocados en alcanzar el éxito.",
                        //     style: TextStyle(color: kLightColor, fontSize: 19)),
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
