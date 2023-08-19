import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 5,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 50, 213, 224),
          Color.fromARGB(255, 54, 218, 196)
        ])),
      ),
      leading: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: InkResponse(
            onTap: () {
              print('Meal');
            },
            child: const Icon(
              Icons.menu_rounded,
              size: 30.0,
              color: Colors.black,
            )),
      ),
      title: const Image(
        image: AssetImage('assets/Amazon_logo.png'),
        height: 25.0,
      ),
      centerTitle: true,
      actions: <Widget>[
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 14.0),
              child: InkResponse(
                  onTap: () {
                    print('Shopping Cart');
                  },
                  child: const Icon(
                    Icons.shopping_cart_rounded,
                    size: 28.0,
                    color: Colors.black,
                  )),
            ),
            Positioned(
                top: 8.0,
                right: 13.0,
                child: Container(
                  height: 15.0,
                  width: 15.0,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text(
                      '5',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 10),
                    ),
                  ),
                ))
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 10),
          child: InkResponse(
              onTap: () {
                print('Search');
              },
              child: const Icon(
                Icons.search,
                size: 30.0,
                color: Colors.black,
              )),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _buildAppBar(),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 40,
              width: double.infinity,
              color: Color.fromARGB(255, 141, 255, 240),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on_rounded,
                      color: Colors.black,
                      size: 15,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      '456 Park Avenue, Apt 3B, Townsville, TX 78901, US',
                      style: GoogleFonts.inter(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 10),
                    )
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 30),
                    child: Column(
                      children: [
                        Image(
                          image: NetworkImage(
                            'https://seeklogo.com/images/A/amazon-fresh-logo-02542BA121-seeklogo.com.png',
                          ),
                          height: 30,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Fresh',
                          style: GoogleFonts.inter(fontSize: 10),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 30),
                    child: Column(
                      children: [
                        Image(
                          image: NetworkImage(
                            'https://cdn-icons-png.flaticon.com/512/1260/1260370.png',
                          ),
                          height: 30,
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Electronics',
                          style: GoogleFonts.inter(fontSize: 10),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 30),
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage(
                            'assets/mobile.png',
                          ),
                          height: 30,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Mobiles',
                          style: GoogleFonts.inter(fontSize: 10),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 30),
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage(
                            'assets/amazon_mini.png',
                          ),
                          height: 30,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          'miniTV',
                          style: GoogleFonts.inter(fontSize: 10),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 30),
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage(
                            'assets/fashion.png',
                          ),
                          height: 30,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Fashion',
                          style: GoogleFonts.inter(fontSize: 10),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 30),
                    child: Column(
                      children: [
                        Image(
                          image: NetworkImage(
                            'https://images.meesho.com/images/marketing/1649408378143.png',
                          ),
                          height: 30,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          'Beauty',
                          style: GoogleFonts.inter(fontSize: 10),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 15, left: 30, right: 15),
                    child: Column(
                      children: [
                        Image(
                          image: NetworkImage(
                            'https://assets.pharmeasy.in/apothecary/images/medicine_ff.webp',
                          ),
                          height: 30,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Pharmacy',
                          style: GoogleFonts.inter(fontSize: 10),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        const Image(
                            image: AssetImage('assets/amazon_card_image.png')),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 30),
                          child: Positioned(
                            top: 8.0,
                            left: 13.0,
                            child: Material(
                              borderRadius: BorderRadius.circular(40),
                              elevation: 10,
                              child: Container(
                                height: 45.0,
                                width: 45.0,
                                decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(40)),
                                child: Center(
                                  child: Text(
                                    '10%',
                                    style: GoogleFonts.inter(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Amazon Prime Deal: 10% Off iTunes and App Store Gift Card | Macworld',
                        style: GoogleFonts.inter(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    const Stack(children: [
                      Image(
                        image: NetworkImage(
                          'https://m.media-amazon.com/images/G/31/Symbol/2023/WRS_June/AF_Herotators/MFD/11._SX621_QL85_FMpng_.png',
                        ),
                        height: 300,
                      ),
                      Positioned(
                        top: 20,
                        right : 20,
                        child: Text('Sponsored')),
                    ]),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Men's Fashion: Buy Men's clothing, watches, shoes & accessories online at  best prices in India ",
                        style: GoogleFonts.inter(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text('Deals For you')
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
