import 'package:flutter/material.dart';
import 'package:l5_iot/product.dart';
import './register_page.dart';
import './signin_page.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


void main() {

  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Shopping List',
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Colors.amber,
      ),
      home: MyHomePage(title: 'My Shopping List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController textFieldController = TextEditingController();
  List<Product> shoppingCart = [];
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('My Shopping List');

  List<String> ListItems = [
  ];

  final leftEditIcon = Container(
    color: Colors.pink,
    child: Icon(Icons.favorite),
    alignment: Alignment.centerLeft,
  );
  final rightDeleteIcon = Container(
    color: Colors.deepOrange,
    child: Icon(Icons.delete),
    alignment: Alignment.centerRight,
  );

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: customSearchBar,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (customIcon.icon == Icons.search) {
                  customIcon = const Icon(Icons.cancel);
                  customSearchBar = const ListTile(
                    leading: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 28,
                    ),
                    title: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search something...',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                        ),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  );
                }
              });
              },
            icon: customIcon,
          )
        ],
        centerTitle: true,
          ),
      // Here we take the value from the MyHomePage object that was created by
      // the App.build method, and use it to set our appbar title.
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  Image.asset(
                    "assets/toDo.png",
                    width: 50,
                    height: 50,
                  ),
                  Text(
                    "Products you have to buy",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
                      fontSize: 25,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  Image.asset(
                    "assets/bread.png",
                    width: 50,
                    height: 50,
                  ),
                  TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              _buildPopupDialog(context),
                        );
                      },
                      child: Text("Bread"),
                      style: TextButton.styleFrom(
                          primary: Colors.brown,
                          textStyle: TextStyle(
                            fontSize: 20,
                          )
                      )
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  Image.asset(
                    "assets/butter.png",
                    width: 50,
                    height: 50,
                  ),
                  TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              _buildPopupDialog2(context),
                        );
                      },
                      child: Text("Butter"),
                      style: TextButton.styleFrom(
                          primary: Colors.brown,
                          textStyle: TextStyle(
                            fontSize: 20,
                          )
                      )
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  Image.asset(
                    "assets/chocolate.png",
                    width: 50,
                    height: 50,
                  ),
                  TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              _buildPopupDialog3(context),
                        );
                      },
                      child: Text("Chocolate"),
                      style: TextButton.styleFrom(
                          primary: Colors.brown,
                          textStyle: TextStyle(
                            fontSize: 20,
                          )
                      )
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  Image.asset(
                    "assets/juice.png",
                    width: 50,
                    height: 50,
                  ),
                  TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              _buildPopupDialog4(context),
                        );
                      },
                      child: Text("Orange Juice"),
                      style: TextButton.styleFrom(
                          primary: Colors.brown,
                          textStyle: TextStyle(
                            fontSize: 20,
                          )
                      )
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  Image.asset(
                    "assets/milk.png",
                    width: 50,
                    height: 50,
                  ),
                  TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              _buildPopupDialog5(context),
                        );
                      },

                      child: Text("Milk"),
                      style: TextButton.styleFrom(
                          primary: Colors.brown,
                          textStyle: TextStyle(
                            fontSize: 20,
                          )
                      )
                  ),
                ],
              ),
            ),

            Expanded(
              child: ListView.builder(
                   itemCount:ListItems.length,
                  itemBuilder: (context, index) {
                    /* return ShoppingListItem(
                      product: shoppingCart[index],
                      inCart: shoppingCart.contains(shoppingCart[index]),
                      onCartChanged: onCartChanged,
                    );*/

                    return Dismissible(
                        background: leftEditIcon,
                        secondaryBackground: rightDeleteIcon,
                        key: ObjectKey(ListItems[index]),
                        child: Container(
                          padding: EdgeInsets.all(15.0),
                          child: Text(ListItems[index],
                              style: TextStyle(fontSize: 20,
                              color:Colors.brown,),
                          ),
                        ),

                        onDismissed: (DismissDirection direction) {
                          if (direction == DismissDirection.startToEnd) {
                            // Left to right
                            print("Add to favorites");
                          } else if (direction == DismissDirection.endToStart) {
                            // Right to left
                            print("Delete item");
                          };
                        }
                    );
                  }))],

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => displayDialog(context),
        child: Icon(Icons.add),
      ),

      bottomNavigationBar: new Stack(
        alignment: new FractionalOffset(0.6, 1.0),
        children: [
          new Container(
            height: 40.0,
            color: Colors.brown,
          ),
          new Padding(
            padding: EdgeInsets.fromLTRB(0, 30,600 , 15),
            child: new FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>MyApp()),
                );
              },
              child: new Icon(Icons.home),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(400, 100,0 , 25),
            child: Row(
              children: [
                RaisedButton(
                  color: Colors.green, // background
                  textColor: Colors.white, // foreground
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>MySignIn()),
                    );
                  },
                  child: Text('Log In'),
                )
              ],
            ),
          ),
          new Container(
            height: 40.0,
            width: 50,
            color: Colors.brown,
          ),
          new Padding(
            padding: EdgeInsets.fromLTRB(400, 30,60 , 15),
            child: new FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>Favorites()),
                );
              },
              child: new Icon(Icons.favorite),
            ),
          ),
    ]));

    // This trailing comma makes auto-formatting nicer for build methods.
    // This trailing comma makes auto-formatting nicer for build methods.
  }

  Widget _buildPopupDialog(BuildContext context) {
    return new AlertDialog(
      title: const Text('Bread Info'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Price:  € 0,30 "),
          Text("Quantity: 3 "),
          Text("Calories: 264,6 kcal "),
          Text("Carbohydrates: 49 g "
          ),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme
              .of(context)
              .primaryColor,
          child: const Text('Close'),
        ),
      ],
    );
  }

  Widget _buildPopupDialog2(BuildContext context) {
    return new AlertDialog(
      title: const Text('Butter Info'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Price:  € 2.02 "),
          Text("Quantity: 2 "),
          Text("Calories: 716,8 kcal "),
          Text("Carbohydrates: 0,1 g "
          ),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme
              .of(context)
              .primaryColor,
          child: const Text('Close'),
        ),
      ],
    );
  }

  Widget _buildPopupDialog3(BuildContext context) {
    return new AlertDialog(
      title: const Text('Chocolate Info'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Price:   € 1.01 "),
          Text("Quantity: 3 "),
          Text("Calories: 545,6 kcal "),
          Text("Carbohydrates: 61 g "
          ),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme
              .of(context)
              .primaryColor,
          child: const Text('Close'),
        ),
      ],
    );
  }

  Widget _buildPopupDialog4(BuildContext context) {
    return new AlertDialog(
      title: const Text('Orange Juice Info'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Price:  € 1.21  "),
          Text("Quantity: 1 "),
          Text("Calories: 44,9 kcal "),
          Text("Carbohydrates: 10 g "
          ),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme
              .of(context)
              .primaryColor,
          child: const Text('Close'),
        ),
      ],
    );
  }

  Widget _buildPopupDialog5(BuildContext context) {
    return new AlertDialog(
      title: const Text('Milk Info'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Price:  € 1.68 "),
          Text("Quantity: 4 "),
          Text("Calories: 42,3 kcal "),
          Text("Carbohydrates: 5 g "
          ),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme
              .of(context)
              .primaryColor,
          child: const Text('Close'),
        ),
      ],
    );
  }


  Future<AlertDialog> displayDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Add a new product to your list",
              textAlign: TextAlign.center,
            ),
            content: TextField(
              controller: textFieldController,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  // print(textFieldController.text);
                  if (textFieldController.text.trim() != "")
                    setState(() {
                     ListItems.add(textFieldController.text);
                    });

                  textFieldController.clear();
                  Navigator.of(context).pop();
                },
                child: Text("Save"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Close"),
              ),
            ],
          );
        });
  }

  void onCartChanged(Product product, bool inCart) {
    setState(() {
      // if (!inCart) shoppingCart.add(product);
      shoppingCart.remove(product);
    });
  }
}
class Favorites extends StatefulWidget {


  @override
  FavoritesState createState() {
    return FavoritesState();
  }
}


// Create a corresponding State class.
// This class holds data related to the form.
class FavoritesState extends State<Favorites> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  bool agree = false;
  void confirmation() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Favorites',
        ),
        ),
            );

  }
}
class MySignIn extends StatefulWidget {


  @override
  MySignInState createState() {
    return MySignInState();
  }
}


// Create a corresponding State class.
// This class holds data related to the form.
class MySignInState extends State<MySignIn> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context) /*!*/ .push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }
  bool agree = false;
  void confirmation() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Go Back',
          ),
        ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
            child: SignInButtonBuilder(
              icon: Icons.person_add,
              backgroundColor: Colors.brown,
              text: 'Registration',
              onPressed: () => _pushPage(context, RegisterPage()),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
            child: SignInButtonBuilder(
              icon: Icons.verified_user,
              backgroundColor: Colors.brown,
              text: 'Sign In',
              onPressed: () => _pushPage(context, SignInPage()),
            ),
          ),
        ],
      ), bottomNavigationBar: new Stack(
        alignment: new FractionalOffset(0.6, 1.0),
        children: [
          new Container(
            height: 40.0,
            color: Colors.brown,
          ),
          new Padding(
            padding: EdgeInsets.fromLTRB(0, 30,600 , 15),
            child: new FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>MyApp()),
                );
              },
              child: new Icon(Icons.home),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(400, 100,0 , 25),
            child: Row(
              children: [
                RaisedButton(
                  color: Colors.green, // background
                  textColor: Colors.white, // foreground
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>MySignIn()),
                    );
                  },
                  child: Text('Log In'),
                )
              ],
            ),
          ),
          new Container(
            height: 40.0,
            width: 50,
            color: Colors.brown,
          ),
          new Padding(
            padding: EdgeInsets.fromLTRB(400, 30,60 , 15),
            child: new FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>Favorites()),
                );
              },
              child: new Icon(Icons.favorite),
            ),
          ),
        ],
    ));
  }
}
