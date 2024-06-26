import 'package:flutter/material.dart';
import '../app_const/myapp_const.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../test_dart/holiday.dart';

class MyAppDrawer extends StatelessWidget {
  const MyAppDrawer({super.key});
/*
  void HodidayGet() {
    var t;

    final bool? isHoliday;
    isHoliday = null;
    Hodiday lHo = Hodiday(isHoliday: true, events: [
      Event(description: "so", title: 't'),
      Event(description: "sa", title: 'p')
    ]);
    Hodiday lHo2;
    String jsonData =
        '{"is_holiday": true,	"events": [	{	"title":"t", "description": "پیروزی انقلاب اسلامی"}]} ';

    var user = jsonDecode(jsonData) as Map<String, dynamic>;
    lHo = Hodiday.fromJson(user);

    jsonData =
        '{"is_holiday": true,	"events": [	{	"title":"t", "description": "ی"}]} ';

    user = jsonDecode(jsonData) as Map<String, dynamic>;

    lHo2 = Hodiday.fromJson(user);
    print('************************');
    print(lHo2.toString());
  }
*/
  void getholiday() {
    String url1 =
        'https://myshop-df5c6-default-rtdb.firebaseio.com/products.json';
    http.post(Uri.parse(url1), body: jsonEncode({'title': 'saaed'}));
    String url = 'https://holidayapi.ir/jalali/1403/11/22';
    try {
      http.get(Uri.parse(url)).then((lResponse) {
        if (lResponse.statusCode == 200) {
          var j = json.decode(lResponse.body);

          Map<String, dynamic> jsonResponse = json.decode(lResponse.body);

          Hodiday lH = Hodiday.fromJson(jsonResponse);
          print(lH.toString());
        }
      });
    } catch (e) {
      e.toString();
    }

    // try {
    //   url = 'http://127.0.0.1:5000';
    //   http.get(Uri.parse(url)).then((value) => print('su ${value.body}'));

    //   // then((value) => print());
    // } catch (e) {
    //   print('saeed errr:${e}');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        AppBar(
          title: Text("data"),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.shop),
          title: Text('shop'),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
        ListTile(
          leading: Icon(Icons.payment),
          title: Text('Orders'),
          onTap: () {
            Navigator.of(context)
                .pushReplacementNamed(MyAppConst.cOrdersScreenRouteName);
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.payment),
          title: Text('Manage Product'),
          onTap: () {
            Navigator.of(context)
                .pushReplacementNamed(MyAppConst.cUserProductsScreenRouteName);
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.payment),
          title: Text('Get API'),
          onTap: () {
            getholiday();
            // HodidayGet();
          },
        ),
      ]),
    );
  }
}
