import 'package:flutter/material.dart';
import 'login_page.dart';
import 'package:hot_byte_user/signin.dart';
import 'constants/constants.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CategoriesScroller categoriesScroller = CategoriesScroller();
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  List<Widget> itemsData = [];

  void getPostsData() {
    List<dynamic> responseList = FOOD_DATA;
    List<Widget> listItems = [];
    responseList.forEach((post) {
      listItems.add(Container(
          height: 150,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      post["name"],
                      style: const TextStyle(
                          fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      " ${post["price"]}",
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
<<<<<<< HEAD

                      //mainAxisAlignment:MainAxisAlignment.end,
=======
>>>>>>> fa8e1941c6a6f163d7e957892cd6b07aebbe600c
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.add_circle_outline),
                            onPressed: () {}),
                        SizedBox(
                          width: 0,
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.do_not_disturb_on,
                            ),
                            onPressed: () {}),
                      ],
                    ),
                  ],
                ),
                Image.asset(
                  "assets/images/${post["image"]}",
                  height: double.infinity,
                )
              ],
            ),
          )));
    });
    setState(() {
      itemsData = listItems;
    });
  }

  @override
  void initState() {
    super.initState();
    getPostsData();
    controller.addListener(() {
      double value = controller.offset / 119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.30;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightBlueAccent,
        title: Text(
          "Foodies",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
<<<<<<< HEAD
          ),),


          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.person, color: Colors.white),
              onPressed: () {},
            )
          ],
=======
          ),
>>>>>>> fa8e1941c6a6f163d7e957892cd6b07aebbe600c
        ),
        actions: <Widget>[
// IconButton(
//   icon: Icon(Icons.search, color: Colors.white),
//   onPressed: () {},
// ),
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
            onPressed: () {},
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
//padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                name,
                style: TextStyle(fontSize: 25),
              ),
              accountEmail: Text(
                email,
                style: TextStyle(fontSize: 17),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                  imageUrl,
                ),
              ),
            ),
            ListTile(
              title: Text(
                "Hotbyte Account",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onTap: () {
//Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                "Your Orders",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                "Track  your Order",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                "Your Wishlist",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                "Contact Us",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                "Sign Out",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onTap: () async {
                await signOutGoogle();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }), ModalRoute.withName('/'));
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          height: size.height,
          child: Column(
            children: <Widget>[
<<<<<<< HEAD
=======
              SizedBox(
                height: 10,
              ),
>>>>>>> fa8e1941c6a6f163d7e957892cd6b07aebbe600c
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "     Best Sellers",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: closeTopContainer ? 0 : 1,
                child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: size.width,
                    alignment: Alignment.topCenter,
                    height: closeTopContainer ? 0 : categoryHeight,
                    child: categoriesScroller),
              ),
              Expanded(
                  child: ListView.builder(
                      controller: controller,
                      itemCount: itemsData.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        double scale = 1.0;
                        if (topContainer > 0.5) {
                          scale = index + 0.5 - topContainer;
                          if (scale < 0) {
                            scale = 0;
                          } else if (scale > 1) {
                            scale = 1;
                          }
                        }
                        return Opacity(
                          opacity: scale,
                          child: Transform(
                            transform: Matrix4.identity()..scale(scale, scale),
                            alignment: Alignment.bottomCenter,
                            child: Align(
                                heightFactor: 0.7,
                                alignment: Alignment.topCenter,
                                child: itemsData[index]),
                          ),
                        );
                      })),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoriesScroller extends StatelessWidget {
  const CategoriesScroller();

  @override
  Widget build(BuildContext context) {
    final double categoryHeight =
        MediaQuery.of(context).size.height * 0.30 - 50;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Row(
            children: <Widget>[
              Container(
                width: 170,
                margin: EdgeInsets.only(right: 20),
<<<<<<< HEAD
                height: 224,
                decoration: BoxDecoration( border: Border.all(color: Colors.black,width: 4.0),borderRadius: BorderRadius.all(Radius.circular(30.0),)),

=======
                height: 201,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 4.0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    )),
>>>>>>> fa8e1941c6a6f163d7e957892cd6b07aebbe600c
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
<<<<<<< HEAD


                      Center(
                        child: Text(
                          "French Fries",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                        ),
                      ),
                      Image.asset(
                          "assets/images/fries.png",
                        height:135,
=======
                      Image.asset(
                        "assets/images/fries.png",
                        height: 135,
>>>>>>> fa8e1941c6a6f163d7e957892cd6b07aebbe600c
                        width: 150,
                      ),

                      Row(
<<<<<<< HEAD

                        mainAxisAlignment:MainAxisAlignment.center,
=======
                        mainAxisAlignment: MainAxisAlignment.end,
>>>>>>> fa8e1941c6a6f163d7e957892cd6b07aebbe600c
                        children: <Widget>[
                          IconButton(
                              icon: Icon(Icons.add_circle_outline),
                              onPressed: () {}),
                          SizedBox(
                            width: 0,
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.do_not_disturb_on,
                              ),
                              onPressed: () {}),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 170,
                margin: EdgeInsets.only(right: 20),
<<<<<<< HEAD
                height: 224,
                decoration: BoxDecoration( border: Border.all(color: Colors.black,width: 4.0),borderRadius: BorderRadius.all(Radius.circular(30.0),)),

=======
                height: 201,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 4.0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    )),
>>>>>>> fa8e1941c6a6f163d7e957892cd6b07aebbe600c
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
<<<<<<< HEAD
                      Center(
                        child: Text(
                          "Burger",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                        ),
                      ),


=======
>>>>>>> fa8e1941c6a6f163d7e957892cd6b07aebbe600c
                      Image.asset(
                        "assets/images/burger.png",
                        height: 135,
                        width: 150,
                      ),
                      Row(
<<<<<<< HEAD

                        mainAxisAlignment:MainAxisAlignment.center,                        children: <Widget>[
                          IconButton(icon:Icon(Icons.add_circle_outline), onPressed: (){}),
                          SizedBox(width: 0,),
                          IconButton(icon:Icon(Icons.do_not_disturb_on,), onPressed: (){}),
=======
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          IconButton(
                              icon: Icon(Icons.add_circle_outline),
                              onPressed: () {}),
                          SizedBox(
                            width: 0,
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.do_not_disturb_on,
                              ),
                              onPressed: () {}),
>>>>>>> fa8e1941c6a6f163d7e957892cd6b07aebbe600c
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 170,
                margin: EdgeInsets.only(right: 20),
<<<<<<< HEAD
                height: 224,
                decoration: BoxDecoration( border: Border.all(color: Colors.black,width: 4.0),borderRadius: BorderRadius.all(Radius.circular(30.0),)),

=======
                height: 201,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 4.0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    )),
>>>>>>> fa8e1941c6a6f163d7e957892cd6b07aebbe600c
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
<<<<<<< HEAD
                      Center(
                        child: Text(
                          "Pizza",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                        ),
                      ),


=======
>>>>>>> fa8e1941c6a6f163d7e957892cd6b07aebbe600c
                      Image.asset(
                        "assets/images/pizza.png",
                        height: 135,
                        width: 150,
                      ),
                      Row(
<<<<<<< HEAD

                         mainAxisAlignment:MainAxisAlignment.center,
=======
                        mainAxisAlignment: MainAxisAlignment.end,
>>>>>>> fa8e1941c6a6f163d7e957892cd6b07aebbe600c
                        children: <Widget>[
                          IconButton(
                              icon: Icon(Icons.add_circle_outline),
                              onPressed: () {}),
                          SizedBox(
                            width: 0,
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.do_not_disturb_on,
                              ),
                              onPressed: () {}),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 170,
                margin: EdgeInsets.only(right: 20),
<<<<<<< HEAD
                height: 224,
                decoration: BoxDecoration( border: Border.all(color: Colors.black,width: 4.0),borderRadius: BorderRadius.all(Radius.circular(30.0),)),

=======
                height: 201,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 4.0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    )),
>>>>>>> fa8e1941c6a6f163d7e957892cd6b07aebbe600c
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
<<<<<<< HEAD
                      Center(
                        child: Text(
                          "Wrap",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                        ),
                      ),


=======
>>>>>>> fa8e1941c6a6f163d7e957892cd6b07aebbe600c
                      Image.asset(
                        "assets/images/wrap.png",
                        height: 135,
                        width: 150,
                      ),
                      Row(
<<<<<<< HEAD

                        mainAxisAlignment:MainAxisAlignment.center,
=======
                        mainAxisAlignment: MainAxisAlignment.end,
>>>>>>> fa8e1941c6a6f163d7e957892cd6b07aebbe600c
                        children: <Widget>[
                          IconButton(
                              icon: Icon(Icons.add_circle_outline),
                              onPressed: () {}),
                          SizedBox(
                            width: 0,
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.do_not_disturb_on,
                              ),
                              onPressed: () {}),
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
    );
  }
}
