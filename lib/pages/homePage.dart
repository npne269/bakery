import 'package:flutter/material.dart';
import 'package:mybakery/components/bannerContainer.dart';
import 'package:mybakery/components/menuCard.dart';
import 'package:mybakery/components/navBar.dart';
import 'package:mybakery/components/titleSection.dart';
import 'package:mybakery/global.dart';

class HomePage extends StatelessWidget {
  List<Widget> menuList(width) {
    List ourItems = [
      {
        'label': 'Sweet Cake',
        'image': 'images/cake.png',
      },
      {
        'label': 'Cookies',
        'image': 'images/cookies.png',
      },
      {
        'label': 'Cream Roll',
        'image': 'images/creamroll.png',
      },
      {
        'label': 'Wow Dessert',
        'image': 'images/dessert.png',
      },
      {
        'label': 'Sweets Sweets',
        'image': 'images/sweets.png',
      },
      {
        'label': 'Cupcake',
        'image': 'images/cupcake.png',
      },
    ];

    return [
      TitleSection(label: 'Our Menu'),
      Expanded(
        child: GridView.builder(
          itemCount: ourItems.length,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: forMobile(width) ? 2 : forLaptop(width) ? 3 : 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemBuilder: (_, i) => MenuCard(
            items: ourItems[i],
          ),
        ),
      ),
      Container(
        width: width * 0.1,
      )
    ];
  }

  List<Widget> getServicesList(width) {
    List service = [
      {
        'type': 'Quality',
        'sloganfill1': 'Health',
        'sloganfill2': 'wealth',
        'image': 'images/services.jpg',
        'desc':
            'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Distinctio dolor corporis ipsum itaque? Dolor expedita eaque suscipit, corrupti fuga ratione quisquam delectus, voluptatem blanditiis, doloribus nisi cum labore odio quam.',
      },
      {
        'type': 'Productivity',
        'sloganfill1': 'Details',
        'sloganfill2': 'Responsibility',
        'image': 'images/services2.jpg',
        'desc':
            'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Distinctio dolor corporis ipsum itaque? Dolor expedita eaque suscipit, corrupti fuga ratione quisquam delectus, voluptatem blanditiis, doloribus nisi cum labore odio quam.',
      },
    ];
    return List.generate(
      service.length,
      (index) => Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            textDirection: (index % 2 == 0)
                ? TextDirection.ltr
                : forMobile(width) ? TextDirection.ltr : TextDirection.rtl,
            children: [
              forMobile(width)
                  ? Container()
                  : Flexible(
                      child: Image.asset(
                        service[index]['image'],
                        width: width * 0.4,
                        fit: BoxFit.cover,
                      ),
                    ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    service[index]['type'],
                    style: TextStyle(fontSize: 12, color: kGoldenColor),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  forMobile(width)
                      ? Flexible(
                          child: Image.asset(
                            service[index]['image'],
                            width: width * 0.8,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Container(),
                  SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Your ',
                        style: TextStyle(
                            fontSize: 20,
                            color: kWhiteColor,
                            fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                              text: service[index]['sloganfill1'],
                              style: TextStyle(color: kGoldenColor)),
                          TextSpan(
                            text: ', Our ',
                          ),
                          TextSpan(
                              text: service[index]['sloganfill2'],
                              style: TextStyle(color: kGoldenColor)),
                        ]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: forMobile(width) ? width * 0.9 : width * 0.4,
                    child: Text(service[index]['desc']),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: forMobile(width) ? Drawer() : null,
      appBar: AppBar(
        title: forMobile(width) ? Container() : NavBar(),
        iconTheme: IconThemeData(color: kGoldenColor),
      ),
      body: ListView(
        children: [
          //banner area

          Container(
            height: height - kToolbarHeight,
            child: Stack(
              children: [
                Opacity(
                  opacity: 0.05,
                  child: Image.asset(
                    'images/aboutus.jpg',
                    width: width,
                    height: height,
                    fit: BoxFit.fill,
                  ),
                ),
                BannerContainer()
              ],
            ),
          ),

          //main area

          Container(
            height: forMobile(width) ? height * 3.4 : height * 3,
            child: Stack(
              children: [
                Opacity(
                  opacity: 0.2,
                  child: Image.asset(
                    'images/blacktexture.jpg',
                    height: height * 3.4,
                    width: width,
                    fit: BoxFit.fill,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Our Menu Block
                    Container(
                      height: height,
                      child: forMobile(width)
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: menuList(width),
                            )
                          : Row(
                              children: menuList(width),
                            ),
                    ),

                    //about us block
                    Container(
                      height: height,
                      child: Stack(
                        children: [
                          Padding(
                            padding: forMobile(width)
                                ? EdgeInsets.only(top: 30.0)
                                : EdgeInsets.only(top: 30.0, left: 60),
                            child: Image.asset(
                              'images/aboutus.jpg',
                              height: height * 0.8,
                              width: forMobile(width) ? width : width * 0.6,
                              fit: BoxFit.cover,
                            ),
                          ),
                          TitleSection(label: 'About Us'),
                          Align(
                            alignment: forMobile(width)
                                ? Alignment.bottomRight
                                : Alignment.topCenter,
                            child: Card(
                              margin: forMobile(width)
                                  ? EdgeInsets.only(top: 0)
                                  : EdgeInsets.only(top: 100),
                              elevation: 4,
                              color: kWhiteColor,
                              child: Container(
                                height: height * 0.6,
                                width: forMobile(width)
                                    ? width * 0.9
                                    : width * 0.65,
                                padding: EdgeInsets.all(40),
                                child: Text(
                                  'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Distinctio dolor corporis ipsum itaque? Dolor expedita eaque suscipit, corrupti fuga ratione quisquam delectus, voluptatem blanditiis, doloribus nisi cum labore odio quam.',
                                  style: TextStyle(color: kBlackColor),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: RaisedButton(
                                onPressed: () {},
                                child: Text('Learn More..'),
                                color: kGoldenColor,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    //Special Services
                    Container(
                      height: forMobile(width) ? height * 1.4 : height,
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 40),
                            child: Column(
                              children: getServicesList(width),
                            ),
                          ),
                          TitleSection(label: 'Special Services')
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),

          //footer area
          Container(
            height: forMobile(width)? height*0.8:height * 0.5,
            padding: const EdgeInsets.all(20),
            color: kWhiteColor,
            child: Column(
              children: [

                //shows in mobile only
                forMobile(width)?FooterOtherWidget():Container(),

                forMobile(width)?SizedBox(
                  height: 40,
                ):Container(),

                //shows except mobile
                forMobile(width)?Container():Expanded(
                  child: Row(
                    children: [
                      FooterSubscribeWidget(),
                      Expanded(child: FooterOtherWidget()),
                    ],
                  ),
                ),

                //shows in mobile only
                forMobile(width)?FooterSubscribeWidget():Container(),

                Container(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'Copyright 2020 Super Bakery. All rights reserved.',
                    style: TextStyle(
                      color: kGreyColor,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FooterOtherWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
            children: [
        Expanded(
            child: Column(
          children: [
            Text(
              'Products',
              style: TextStyle(color: kGoldenColor),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Cake',
              style: TextStyle(color: kBlackColor),
            ),
            Text(
              'Sweets',
              style: TextStyle(color: kBlackColor),
            ),
            Text(
              'Cookies',
              style: TextStyle(color: kBlackColor),
            ),
            Text(
              'Creamroll',
              style: TextStyle(color: kBlackColor),
            ),
            Text(
              'Desserts',
              style: TextStyle(color: kBlackColor),
            ),
          ],
        )),
        Expanded(
            child: Column(
          children: [
            Text(
              'Services',
              style: TextStyle(color: kGoldenColor),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Pre Order',
              style: TextStyle(color: kBlackColor),
            ),
            Text(
              'Custom Cake',
              style: TextStyle(color: kBlackColor),
            ),
            Text(
              'Home Delivery',
              style: TextStyle(color: kBlackColor),
            ),
            Text(
              'Takeaway',
              style: TextStyle(color: kBlackColor),
            ),
          ],
        )),
        Expanded(
            child: Column(
          children: [
            Text(
              'About Us',
              style: TextStyle(color: kGoldenColor),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Contact',
              style: TextStyle(color: kGoldenColor),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Our Gallery',
              style: TextStyle(color: kGoldenColor),
            ),
          ],
        ))
      ],
    );
  }
}

class FooterSubscribeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Super Bakery',
            style: TextStyle(
                color: kGoldenColor, fontSize: 40, fontFamily: 'GreatVibes'),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Subscribe Our Newsletter',
            style: TextStyle(color: kBlackColor),
          ),
          Container(
            constraints: BoxConstraints(
              maxWidth: 400,
            ),
                      child: TextField(
              keyboardType: TextInputType.emailAddress,
              cursorColor: kBlackColor,
              style: TextStyle(color: kBlackColor),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: kBlackColor,
                  ),
                ),
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
                hintText: 'Your Email',
                hintStyle: TextStyle(
                  color: kBlackColor,
                  fontWeight: FontWeight.bold,
                ),
                suffixIcon: FlatButton(
                  onPressed: () {},
                  child: Text('Subscribe'),
                  color: kGoldenColor,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Social Media',
            style: TextStyle(
              color: kBlackColor,
            ),
          ),
          Row(
            children: [
              IconButton(
                  icon: Icon(Icons.face),
                  color: kGoldenColor,
                  onPressed: () {}),
              SizedBox(
                width: 10,
              ),
              IconButton(
                  icon: Icon(Icons.face),
                  color: kGoldenColor,
                  onPressed: () {}),
              SizedBox(
                width: 10,
              ),
              IconButton(
                  icon: Icon(Icons.face),
                  color: kGoldenColor,
                  onPressed: () {}),
              SizedBox(
                width: 10,
              ),
            ],
          )
        ],
      ),
    );
  }
}
