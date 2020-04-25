import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget{
  final String id;
  final String title;
  final String imageUrl;

  ProductItem({this.id, this.imageUrl, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.grey.withAlpha(45), offset: Offset(4, 4))]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
            child: Image.network(
              imageUrl, 
              fit: BoxFit.cover,),
              footer: GridTileBar(
                backgroundColor: Colors.black54,
                leading: IconButton(
                  icon: Icon(Icons.favorite), 
                  onPressed: (){},
                  color: Theme.of(context).accentColor,
                ),
                title: Text(
                  title, 
                  textAlign: TextAlign.center,),
                trailing: IconButton(
                  icon: Icon(Icons.shopping_cart), 
                  onPressed: (){},
                  color: Theme.of(context).accentColor,
                ),
              ),
          ),
      ),
    );
  }
}