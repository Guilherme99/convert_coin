import 'package:conversor_moedas/app/components/currenty_box.dart';
import 'package:conversor_moedas/app/controllers/home_controller.dart';
import 'package:conversor_moedas/app/models/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController toText = TextEditingController();

  final TextEditingController fromText = TextEditingController();

  HomeController? homeController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    homeController = HomeController(toText: toText, fromText: fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 80, bottom: 80),
                    child: Image.asset(
                      'assets/logo.png',
                      width: 140,
                      height: 150,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(right: 30, left: 30),
                      child: Column(
                        children: [
                          CurrentyBox(
                            itens: homeController!.currencies,
                            onChanged: (model) {
                              setState(() {
                                homeController!.toCurrency = model;
                              });
                            },
                            controller: toText,
                            selectedItem: homeController!.toCurrency,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CurrentyBox(
                            itens: homeController!.currencies,
                            onChanged: (model) {
                              setState(() {
                                homeController!.fromCurrency = model;
                              });
                            },
                            controller: fromText,
                            selectedItem: homeController!.fromCurrency,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 80,
                  ),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    color: Colors.amber,
                    onPressed: () {
                      homeController!.convert();
                    },
                    child: Text('CONVERTER'),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
