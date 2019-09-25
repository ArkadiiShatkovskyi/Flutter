import 'package:flutter/material.dart';

class BlogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: UnderlineInputBorder(
          borderSide: BorderSide(style: BorderStyle.none),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
          ),
        ),
        centerTitle: true,
        title: Text("Categories"),
        leading: IconButton(
          icon: Icon(
            Icons.category,
            size: 20,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              size: 30,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: getArticles(context),
    );
  }

  ListView getArticles(context) {
    MediaQueryData media = MediaQuery.of(context);
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (contex, index) {
        return Container(
          width: media.size.width * .7,
          height: media.size.height * .3,
          margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          padding: EdgeInsets.only(left: 10, right: 10,),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(colors: [
              Colors.lightBlueAccent.withOpacity(0.15),
              Colors.indigoAccent.withOpacity(0.15),
            ]),
//              border: Border.all(color: Colors.black),
//              borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset(
                'assets/images/blog.jpg',
                width: 160,
                height: 160,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
                  bottom: 20.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      "This is title",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: SizedBox(
                          width: 150,
                          height: 75,
                          child: Text(
                              "How to Seem Like You Always Have Your Shot Together")),
                    ),
                    Text("By Arek Stawski"),
                    Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.favorite,
                            color: Colors.redAccent,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.share,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
