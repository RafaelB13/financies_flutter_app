import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
        fontFamily: 'KulimPark', appBarTheme: AppBarTheme(color: Colors.black)),
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var user = "";
  var usercontroller = TextEditingController();

  setNome(text){
    setState(() {
      usercontroller.text = text;
    });
  }

    showAlertDialog(BuildContext context) {

      // set up the button
      Widget okButton = FlatButton(
        child: Text("OK"),
        onPressed: () {
          setState(() {
            user = usercontroller.text;

          });
          Navigator.pop(context);
        },
      );

      // set up the AlertDialog

      AlertDialog alert = AlertDialog(
        title: Text("Qual seu nome?"),
        content: SingleChildScrollView(
          child: TextField(
            controller: usercontroller,
            decoration: InputDecoration(
                labelStyle: TextStyle(fontSize: 16),
                labelText: "Seu Nome",
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                )
            ),
          ),
        ),
        actions: [
          okButton,
        ],
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        height: 65,
        width: 65,
        child: FloatingActionButton(
          backgroundColor: Colors.blue[400],
          onPressed: (){
            showAlertDialog(context);
          },
          child: Icon(
            Icons.add,
            size: 30,
          ),
        ),
      ),
      backgroundColor: Color(0xffc2c2c2),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: Icon(Icons.person, size: 70, color:  Color(0xff616161)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text('Rafael Borges', style: TextStyle(fontSize: 24)),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 78),
                    child: Text("github.com/RafaelB13", style: TextStyle(fontSize: 18, letterSpacing: 2),),
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Color(0xffc2c2c2),
              ),
            ),
            ListTile(
              title: Text('Sobre', style: TextStyle(fontSize: 22)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Contato', style: TextStyle(fontSize: 22)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Color(0xffeeeeee),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Olá, ${user == "" ? "Usuário" : user }",
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'KulimPark',
                      color: Colors.black)),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(Icons.person_outline, color: Colors.black),
              ),
            ],
          )),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Colors.green,
              elevation: 10,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.attach_money, size: 70),
                    title: Text('8.721,98',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'KulimPark',
                            letterSpacing: 1.5)),
                    subtitle: Text('RECEITAS',
                        style: TextStyle(
                            color: Color(0xfffff9c4),
                            fontFamily: 'KulimPark',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            letterSpacing: 1.5)),
                  ),
                  ButtonTheme.bar(
                    child: ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Text('Editar',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'KulimPark',
                                  fontSize: 18)),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          /********* DESPESAS ************/
          Padding(
            padding: EdgeInsets.all(15),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Colors.redAccent,
              elevation: 10,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.money_off, size: 70),
                    title: Text('2.098,10',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'KulimPark',
                            letterSpacing: 1.5)),
                    subtitle: Text('DESPESAS',
                        style: TextStyle(
                            color: Color(0xffffffff),
                            fontFamily: 'KulimPark',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            letterSpacing: 1.5)),
                  ),
                  ButtonTheme.bar(
                    child: ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Text('Editar',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'KulimPark',
                                  fontSize: 18)),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          /********  FATURA DO CARTÃO ********/
          Padding(
            padding: EdgeInsets.all(15),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Color(0xffffb04c),
              elevation: 10,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.credit_card, size: 70),
                    title: Text('1.332,18',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'KulimPark',
                            letterSpacing: 1.5)),
                    subtitle: Text('FATURA DO CARTÃO',
                        style: TextStyle(
                            color: Color(0xffffffff),
                            fontFamily: 'KulimPark',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            letterSpacing: 1.5)),
                  ),
                  ButtonTheme.bar(
                    child: ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Text('Editar',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'KulimPark',
                                  fontSize: 18)),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
