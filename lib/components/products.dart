import 'package:flutter/material.dart';
import 'package:flutter_app1/pages/product_details.dart';

class Products extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Products> {
  var product_list = [
    {
      "name": "Wheat",
      "picture": "assets/images/products/wheat.jpg",
      "old_price": 40,
      "new_price": 50,
    },
    {
      "name": "Rice",
      "picture": "assets/images/products/rice1.jpg",
      "old_price": 30,
      "new_price": 35,
    },
    {
      "name": "Maize",
      "picture": "assets/images/products/maize.jpg",
      "old_price": 30,
      "new_price": 35,
    },
    {
      "name": "Jowar",
      "picture": "assets/images/products/barley_green.jpg",
      "old_price": 50,
      "new_price": 55,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Single_prod(
            prod_name: product_list[index]['name'],
            prod_picture: product_list[index]['picture'],
            prod_old_price: product_list[index]['old_price'],
            prod_price: product_list[index]['new_price'],
          );
        });
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;
  Single_prod(
      {this.prod_name,
      this.prod_picture,
      this.prod_old_price,
      this.prod_price});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: prod_name,
          child: Material(
            child: InkWell(
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  //passing product details to the new page
                  builder: (context) => new ProductDetails(
                        product_detail_name: prod_name,
                        product_detail_picture: prod_picture,
                        product_detail_new_price: prod_price,
                        product_detail_old_price: prod_old_price,
                      ))),
              child: GridTile(
                  footer: Container(
                    color: Colors.white70,
                    child: ListTile(
                      leading: Text(
                        prod_name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      title: Text(
                        '\u{20B9}$prod_price',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w800),
                      ),
                      subtitle: Text(
                        "\u{20B9}$prod_old_price",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w800,
                            decoration: TextDecoration.lineThrough),
                      ),
                    ),
                  ),
                  child: Image.asset(
                    prod_picture,
                    fit: BoxFit.cover,
                  )),
            ),
          )),
    );
  }
}
