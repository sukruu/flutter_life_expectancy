import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:life_expectancy/constants.dart';
import 'package:life_expectancy/result_page.dart';
import 'package:life_expectancy/icon_cinsiyet.dart';
import 'package:life_expectancy/my_container.dart';
import 'package:life_expectancy/user_data.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String? seciliCinsiyet;
  double icilenSigara = 0.0;
  double sporGunu = 3.0;
  int boy = 170;
  int kilo = 60;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'YAŞAM BEKLENTİSİ',
            style: TextStyle(color: Colors.black54),
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: MyContainer(
                      child: buildRowOutlineButton("BOY"),
                    ),
                  ),
                  Expanded(
                    child: MyContainer(
                      child: buildRowOutlineButton("KİLO"),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: MyContainer(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Haftada Kaç Gün Spor Yapıyorsunuz?",
                        style: kMetinStili,
                      ),
                      Text("${sporGunu.round()}", style: kSayiStili),
                      Slider(
                        min: 0,
                        max: 7,
                        divisions: 7,
                        value: sporGunu,
                        onChanged: (double value) {
                          setState(() {
                            sporGunu = value;
                          });
                        },
                      )
                    ]),
              ),
            ),
            Expanded(
              child: MyContainer(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Günde Kaç Sigara İçiyorsunuz?",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${icilenSigara.round()}",
                        style: kSayiStili,
                      ),
                      Slider(
                        min: 0,
                        max: 30,
                        value: icilenSigara,
                        onChanged: (double value) {
                          setState(() {
                            icilenSigara = value;
                          });
                        },
                      )
                    ]),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: MyContainer(
                      onPress: () {
                        setState(() {
                          seciliCinsiyet = "KADIN";
                        });
                      },
                      renk:
                          seciliCinsiyet == "KADIN" ? Colors.red : Colors.white,
                      child: IconCinsiyet(
                        cinsiyet: "KADIN",
                        icon: FontAwesomeIcons.venus,
                      ),
                    ),
                  ),
                  Expanded(
                    child: MyContainer(
                      onPress: () {
                        setState(() {
                          seciliCinsiyet = "ERKEK";
                        });
                      },
                      renk: seciliCinsiyet == "ERKEK"
                          ? Colors.lightBlue
                          : Colors.white,
                      child: IconCinsiyet(
                        cinsiyet: "ERKEK",
                        icon: FontAwesomeIcons.mars,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ButtonTheme(
              height: 50,
              child: FlatButton(
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultPage(UserData(
                                seciliCinsiyet: seciliCinsiyet,
                                icilenSigara: icilenSigara,
                                sporGunu: sporGunu,
                                boy: boy,
                                kilo: kilo))));
                  },
                  child: Text("HESAPLA", style: kMetinStili)),
            )
          ],
        ));
  }

  Row buildRowOutlineButton(String label) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      RotatedBox(
          quarterTurns: -1,
          child: Text(
            label,
            style: kMetinStili,
          )),
      SizedBox(width: 25),
      RotatedBox(
          quarterTurns: -1,
          child: Text(
            label == "BOY" ? boy.toString() : kilo.toString(),
            style: kSayiStili,
          )),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ButtonTheme(
            minWidth: 36,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.blue),
              ),
              child: Icon(
                FontAwesomeIcons.plus,
                size: 15,
              ),
              onPressed: () {
                setState(() {
                  label == "BOY" ? boy++ : kilo++;
                });
              },
            ),
          ),
          ButtonTheme(
            minWidth: 36,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.blue),
              ),
              child: Icon(
                FontAwesomeIcons.minus,
                size: 15,
              ),
              onPressed: () {
                setState(() {
                  label == "BOY" ? boy-- : kilo--;
                });
              },
            ),
          ),
        ],
      ),
    ]);
  }
}
